//
//  ContentView.swift
//
//  Created by 0915
//

import SwiftUI

struct ContentView: View {

    // 切換深淺模式
    @State var isDarkMode: Bool = false
    // TabView選擇的頁面
    @State private var showSide: Bool = false
    // 跟蹤標籤頁
    @State private var select: Int = 0
    @State private var information: Information = Information(name: "vc", gender: "女性", age: 20, height: 161, weight: 50, BMI: 19.68)

    @StateObject private var cameraManagerViewModel = CameraManagerViewModel()
    
    var body: some View
    {
        ZStack
        {
            TabView(selection: self.$select)
            {
                //                  HomeView(select: self.$select)

                HomeView()
                    .tag(0)
                    .tabItem
                {
                    Label("主頁", systemImage: "house.fill")
                }
                
                //MARK: ForumView
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
                
                FavoriteView(select: self.$select)
                    .tag(3)
                    .tabItem
                {
                    Label("最愛", systemImage: "heart.fill")
                }
                
                MyView(select: self.$select, information: self.$information)
                    .tag(4)
                    .tabItem
                {
                    Label("會員", systemImage: "person.fill")
                }
            }
            // 點選後的顏色
            .tint(.orange)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationStack {
            ContentView()
        }
    }
}
