//
//  ContentView.swift
//
//  Created by 0822
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
        HStack
        {
            // MARK: 主頁和分享
            if self.select == 0 || self.select == 1 {
                ZStack {
                    VStack(spacing: 0) {
                        HStack {
                            Button(action: {
                                //按鈕動作
                            }) {
                                NavigationLink(destination: SearchView())
                                {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(red: 0.961, green: 0.804, blue: 0.576))
                                        .frame(width: 300, height: 35, alignment: .leading)
                                    
                                        .overlay {
                                            Image(systemName: "magnifyingglass")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                                .frame(height: 20)
                                                .padding(.horizontal, 10)
                                        }
                                }
                            }
                            if self.select == 0 {
                                Image(systemName: "list.bullet")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            }else if self.select == 1 {
                                Image(systemName: "plus")
                                    .font(.system(size: 35))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(10)
                    }
                }
                // MARK: 最上方搜尋列和清單或加號的背景調整
                .frame(width:400)
                .background(Color(.systemOrange))
//                .background(Color(.orange))
                .padding(.bottom, -10)
            }
            // MARK: 會員
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
            // MARK: TabView
            TabView(selection: self.$select)
            {
//                HomeView(select: self.$select)
                HomeView()
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
        .ignoresSafeArea(.all)
        //.navigationBarTitleDisplayMode(.inline)
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
