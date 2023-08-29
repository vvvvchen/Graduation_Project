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
                VStack
                {
                    //MARK: 深淺模式
                    
                    HStack
                    {
                        Image(systemName: self.isDarkMode ? "moon.fill":"sun.max.fill")
                            .font(.largeTitle)
                            .foregroundColor(self.isDarkMode ? Color.white : Color.black)
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
                        VStack{
                            NavigationLink(destination: SwiftUIView())
                            {
                                Text("過往食譜")
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                Text("食材紀錄")
                            }
                        }
                    }
                    Button("登出")
                    {
                        withAnimation(.easeInOut)
                        {
                            self.logIn=false
                        }
                    }
                }
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
