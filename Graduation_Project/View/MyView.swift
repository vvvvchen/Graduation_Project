//
//  MyView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/9/7.
//

import SwiftUI
import PhotosUI

struct MyView: View
{
    @AppStorage("userImage") private var userImage: Data?
    @AppStorage("colorScheme") private var colorScheme: Bool=true
    @AppStorage("logIn") private var logIn: Bool = false
    
    @Binding var select: Int
    @Binding var information: Information
    
    @State private var pickImage: PhotosPickerItem?
    @State var isDarkMode: Bool = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    private let label: [InformationLabel]=[
        InformationLabel(image: "person.fill", label: "名稱"),
        InformationLabel(image: "figure.arms.open", label: "性別"),
        InformationLabel(image: "birthday.cake.fill", label: "年齡"),
        InformationLabel(image: "ruler", label: "身高"),
        InformationLabel(image: "dumbbell", label: "體重"),
        InformationLabel(image: "figure.strengthtraining.traditional",label:"BMI")
    ]
    
    private let tag: [String]=["高血壓", "尿酸", "高血脂", "美食尋寶家", "7日打卡"]
    
    //MARK: 設定顯示資訊
    private func setInformation(index: Int) -> String
    {
        switch(index)
        {
        case 0:
            return self.information.name
        case 1:
            return self.information.gender
        case 2:
            return "\(self.information.age)"
        case 3:
            return "\(self.information.height)"
        case 4:
            return "\(self.information.weight)"
        case 5:
            return String(format: "%.2f", CalculateBMI(weight: information.weight, height: information.height))
        default:
            return ""
        }
    }
    
    var body: some View
    {
        VStack(spacing: 20)
        {
            VStack(spacing: 20)
            {
                //MARK: 頭像
                if let userImage=self.userImage,
                   let image=UIImage(data: userImage)
                {
                    PhotosPicker(selection: self.$pickImage, matching: .any(of: [.images, .livePhotos]))
                    {
                        Circle()
                            .fill(.gray)
                            .scaledToFit()
                            .frame(width: 160)
                            .overlay
                        {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                        }
                    }
                    .onChange(of: self.pickImage)
                    {image in
                        Task
                        {
                            if let data=try? await image?.loadTransferable(type: Data.self)
                            {
                                self.userImage=data
                            }
                        }
                    }
                }
                else
                {
                    PhotosPicker(selection: self.$pickImage, matching: .any(of: [.images, .livePhotos]))
                    {
                        Circle()
                            .fill(.gray)
                            .scaledToFit()
                            .frame(width: 160)
                    }
                    .onChange(of: self.pickImage)
                    {image in
                        Task
                        {
                            if let data=try? await image?.loadTransferable(type: Data.self)
                            {
                                self.userImage=data
                            }
                        }
                    }
                }
            }
            
            //MARK: 標籤
            VStack(spacing: 20)
            {
                HStack(spacing: 20)
                {
                    ForEach(0..<3)
                    {index in
                        Capsule()
                            .fill(Color("tagcolor"))
                            .frame(width: 100, height: 30)
                            .shadow(color: .gray, radius: 3, y: 3)
                            .overlay(Text(self.tag[index]))
                    }
                }
                
                HStack(spacing: 20)
                {
                    ForEach(3..<5)
                    {index in
                        Capsule()
                            .fill(Color("tagcolor"))
                            .frame(width: 100, height: 30)
                            .shadow(color: .gray, radius: 3, y: 3)
                            .overlay(Text(self.tag[index]))
                    }
                }
            }
            //MARK: 使用者資訊
            List
            {
                
                Section(header:Text("個人資訊"))
                {
                    ForEach(self.label.indices, id: \.self)
                    {
                        index in
                        HStack
                        {
                            self.label[index]
                            Text(self.setInformation(index: index)).foregroundColor(.gray)
                        }
                        .frame(height: 40)
                    }
                }
                .listRowSeparator(.hidden)
                Section(header:Text("數值紀錄"))
                {
                    
                    HStack
                    {
                        NavigationLink(destination: MenuView()) {
                            InformationLabel(image: "figure.strengthtraining.traditional", label: "BMI")
                        }
                    }
                    
                    HStack
                    {
                        NavigationLink(destination: HypertensionView()) {
                            InformationLabel(system: false,image: self.isDarkMode ? "hypertension2" : "hypertension", label: "高血壓")
                            
                        }
                    }
                    HStack
                    {
                        NavigationLink(destination: HyperglycemiaView()) {
                            InformationLabel(system: false,image: self.isDarkMode ? "high blood sugar2" : "high blood sugar", label: "高血糖")
                            
                        }
                    }
                    HStack
                    {
                        NavigationLink(destination: HyperlipidemiaView()) {
                            InformationLabel(system: false,image: self.isDarkMode ? "hyperlipidemiar2" : "hyperlipidemia", label: "高血脂")
                        }
                    }
                }
                .listRowSeparator(.hidden)
                Section(header:Text("食譜相關"))
                {
                    HStack
                    {
                        NavigationLink(destination: MenuView()) {
                            InformationLabel(image: "clock.arrow.circlepath", label: "查閱過往")
                        }
                    }
                    HStack
                    {
                        NavigationLink(destination: MenuView()) {
                            InformationLabel(image: "doc.on.clipboard", label: "食材紀錄")
                        }
                    }
                }
                .listRowSeparator(.hidden)
                Section(header:Text("設定相關"))
                {
                    //MARK: 深淺模式
                    HStack
                    {
                        HStack
                        {
                            Image(systemName: self.isDarkMode ? "moon.fill" : "sun.max.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                            Text(self.isDarkMode ? "  深色模式" : "   淺色模式")
                                .bold()
                                .font(.body)
                                .alignmentGuide(.leading) { d in d[.leading] }
                            
                        }
                        Toggle("", isOn: self.$colorScheme)
                            .tint(Color("sidebuttomcolor"))
                            .scaleEffect(0.75)
                            .offset(x: 30)
                    }
                    //MARK: 登出
                    Button(action:
                            {
                        withAnimation(.easeInOut)
                        {
                            self.logIn = false
                        }
                    }) {
                        HStack
                        {
                            Image(systemName: "power")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .offset(x: 2)
                            
                            Text("    登出")
                                .bold()
                                .font(.body)
                                .alignmentGuide(.leading)
                            {
                                d in d[.leading]
                            }
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .background(.clear)
            
            //設定背景為白色，不要是灰色
            .listStyle(InsetListStyle())
            //控制深淺模式切換
            .preferredColorScheme(self.colorScheme ? .light:.dark)
            .onChange(of: self.colorScheme)
            {
                newValue in
                self.isDarkMode = !self.colorScheme
            }
        }
    }
}

struct MyView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationStack
        {
            MyView(
                select: .constant(2),
                information: .constant(
                    Information(name:"vc", gender: "女性", age: 20, height: 161, weight: 50, BMI:19.68)
                )
            )
        }
    }
}
