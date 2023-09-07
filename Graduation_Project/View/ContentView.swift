//
//  ContentView.swift
//
//  Created by 0822
//

import SwiftUI

struct ContentView: View
{
    //切換深淺模式
    @State var isDarkMode: Bool=false
    
    //TabView選擇的頁面
    @State private var showSide: Bool=false
    //跟蹤標籤頁
    @State private var select: Int=0
    @State private var information: Information=Information(name:"vc", gender: "女性", age: 20, height: 161, weight: 50, BMI:19.68)
    
    @StateObject private var cameraManagerViewModel = CameraManagerViewModel()
    
    var body: some View
    {
        //MARK: TabView
        HStack
        {
            if(self.select==0||self.select==1)
            {
                Spacer()
                    .opacity(self.showSide ? 1 : 0)
                
                Button(action:
                        {
                }) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(.systemGray3))
                        .frame(width: 300, height: 38)
                        .overlay
                    {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("cameracolor"))
                            .frame(maxWidth: .infinity, alignment: self.showSide ? .trailing : .leading)
                            .frame(height: 20)
                            .padding(.horizontal, 10)
                    }
                }
            }
            else if self.select == 4
            {
                HStack
                {
                    Spacer()
                    NavigationLink(destination: MydataView(information: self.$information))
                    {
                        Text("編輯")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .transition(.opacity.animation(.easeInOut.speed(2)))
                }
            }
            Spacer()
        }
        
        ZStack
        {
            //MARK: TabView
            TabView(selection: self.$select)
            {
                HomeView(select: self.$select)
                    .tag(0)
                    .tabItem
                {
                    Label("主頁", systemImage: "house.fill")
                }
                
                ForumView()
                    .tag(1)
                    .tabItem
                {
                    Label("分享", systemImage: "globe")
                }
                
                CameraContentView(cameraManagerViewModel: self.cameraManagerViewModel)
                    .tag(2)
                    .tabItem
                {
                    Label("AI", systemImage: "camera")
                }
                
                ProgressView()
                    .tag(3)
                    .tabItem
                {
                    Label("我的最愛", systemImage: "heart.fill")
                }
                MyView(select: self.$select, information: self.$information)
                    .tag(4)
                    .tabItem
                {
                    Label("我的", systemImage: "person.fill")
                }
            }
            
            .tint(.black)
            
        }
        .ignoresSafeArea(.all)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationStack
        {
            ContentView()
        }
    }
}
