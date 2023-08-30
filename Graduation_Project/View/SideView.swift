//
//  SideView.swift
//  Graduation_Project
//
//  Created by 0825.
//

import SwiftUI

struct SideView: View
{
    @AppStorage("colorScheme") private var colorScheme: Bool=true
    @AppStorage("logIn") private var logIn: Bool = false
    @AppStorage("userImage") private var userImage: Data?
    //@AppStorage("userImage") private var userImage: Data?
    
    @Binding var showSide: Bool
    
    @State var isDarkMode: Bool = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    var imageScaleEffect: CGFloat {
        self.showSide ? 1.0 : 0.0
    }
    var body: some View
    {
        ZStack
        {
            //MARK: 背景
            Color.black
                .opacity(self.showSide ? 0.5:0)
                .onTapGesture
            {
                withAnimation(.spring())
                {
                    self.showSide.toggle()
                }
            }
            
            //MARK: 側邊欄
            Rectangle()
                .fill(.orange)
                .frame(maxWidth: UIScreen.main.bounds.width/1.5)
                .overlay
            {
                //MARK: 項目連結
                VStack(alignment: .leading, spacing: 20)
                {
                    HStack
                    {
                        if let userImage=self.userImage,
                           let image=UIImage(data: userImage)
                        {
                            Spacer()
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                                .clipShape(Circle())
                                .padding(.bottom, 0)
                                .clipShape(Circle())
                                .scaleEffect(imageScaleEffect)
                            Spacer()
                        }
                        else
                        {
                            Spacer()
                            Circle()
                                .fill(.gray)
                                .scaledToFit()
                                .frame(width: 130)
                                .padding(.bottom, 50)
                            Spacer()
                        }
                    }
                    
                    HStack
                    {
                        Spacer()
                        Text("秋雨")
                            .font(.system(size: 20))
                            .foregroundColor(Color("textcolor"))
                        Spacer()
                    }
                    HStack
                    {
                        Image(systemName: self.isDarkMode ? "moon.fill" : "sun.max.fill")
                            .font(.system(size: 27))
                            .foregroundColor(self.isDarkMode ? Color.white : Color.black)
                            .frame(width: 80)
                        
                        Text(self.isDarkMode ? "深色模式" : "淺色模式")
                            .font(.system(size: 20))
                            .foregroundColor(Color("textcolor"))
                            .alignmentGuide(.leading) { d in d[.leading] }
                        
                        Toggle("", isOn: self.$colorScheme)
                            .tint(Color.black)
                            .scaleEffect(0.75)
                            .padding(.trailing, 15)
                    }
                    
                    HStack
                    {
                        Image(systemName: "clock.badge.checkmark")
                            .font(.system(size: 27))
                            .foregroundColor(Color("textcolor"))
                            .frame(width: 80)
                        
                        Text("過往食譜")
                            .font(.system(size: 20))
                            .foregroundColor(Color("textcolor"))
                            .alignmentGuide(.leading)
                        {
                            d in d[.leading]
                        }
                    }
                    
                    HStack
                    {
                        Image(systemName: "list.clipboard")
                            .font(.system(size: 27))
                            .foregroundColor(Color("textcolor"))
                            .frame(width: 80)
                        
                        Text("食材紀錄")
                            .font(.system(size: 20))
                            .foregroundColor(Color("textcolor"))
                            .alignmentGuide(.leading)
                        {
                            d in d[.leading]
                        }
                    }
                    
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
                                .font(.system(size: 27))
                                .foregroundColor(Color("textcolor"))
                                .frame(width: 80)
                            
                            Text("登出")
                                .font(.system(size: 20))
                                .foregroundColor(Color("textcolor"))
                                .alignmentGuide(.leading)
                            {
                                d in d[.leading]
                            }
                        }
                    }
                }
                .padding(.bottom, 225)
                .font(.title)
                .foregroundColor(.black)
            }
            .offset(x: self.showSide ? -70:-330)
            .animation(.spring(), value: self.showSide)
        }
        .ignoresSafeArea(.all)
        .preferredColorScheme(self.colorScheme ? .light:.dark)
        
        .onChange(of: self.colorScheme)
        {
            newValue in
            self.isDarkMode = !self.colorScheme
        }
    }
}

struct SideView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
