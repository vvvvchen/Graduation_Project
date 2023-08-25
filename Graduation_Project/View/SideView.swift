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
    
    @Binding var showSide: Bool
    
    @State var isDarkMode: Bool = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View
    {
        
        GeometryReader
        {
            geometry in
            ZStack
            {
                Rectangle()
                    .foregroundColor(Color(red: 0.994, green: 0.689, blue: 0.418))
                    .frame(maxHeight: .infinity)
                //true點按不會收回
                    .onTapGesture
                {
                    self.showSide=true
                }
                
                //MARK: 深淺模式
                VStack
                {
                    HStack
                    {
                        Image(systemName: self.isDarkMode ? "moon.fill":"sun.max.fill").font(.largeTitle)
                        
                        Toggle("", isOn: self.$colorScheme)
                            .toggleStyle(CustomToogleStyle())
                            .padding()
                    }
                    .cornerRadius(20)
                    .frame(width:290,height: 25)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 10,y: 10)
                    .padding(.top,-200)
                    
                    //MARK: 連結
                    NavigationStack
                    {
                        NavigationLink(destination: SwiftUIView())
                        {
                            Text("過往食譜")
                        }
                        NavigationLink(destination: SwiftUIView())
                        {
                            Text("食材紀錄")
                        }
                    }
                    if logIn
                    {
                        Button(action:
                                {
                            // 清除保存的帳號和密碼信息
                            UserDefaults.standard.removeObject(forKey: "savedAccount")
                            UserDefaults.standard.removeObject(forKey: "savedPassword")
                            
                            logIn = false
                            
                            // 返回到登入畫面
                            
                            presentationMode.wrappedValue.dismiss()
                        },
                        label:
                        {
                            Text("登出")
                        })
                    }
                }
                .offset(x:self.showSide ? geometry.size.width * 0.15 : geometry.size.width * -1)
            }
            .ignoresSafeArea(.all)
            .offset(x: self.showSide ? geometry.size.width * -0.3:geometry.size.width * -1)
            
        }
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



