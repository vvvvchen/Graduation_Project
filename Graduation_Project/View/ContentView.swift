//
//  ContentView.swift
//
//  Created by 0914
//

import SwiftUI

struct ContentView: View {
    // Circle大小
    let circleSize: CGFloat = 50
    // 設定發文每行可輸入的字數
    let maxCharactersPerLine = 16
    // 預設輸入時沒有東西
    @State private var userInput: String = ""
    // 控制點按加號後會出現的Zstack
    @State private var isExpanded = false
    
    // 切換深淺模式
    @State var isDarkMode: Bool = false
    
    // TabView選擇的頁面
    @State private var showSide: Bool = false
    // 跟蹤標籤頁
    @State private var select: Int = 0
    @State private var information: Information = Information(name: "vc", gender: "女性", age: 20, height: 161, weight: 50, BMI: 19.68)
    // 展開搜索列設為FALSE
    @State private var isSearching = false
    
    @StateObject private var cameraManagerViewModel = CameraManagerViewModel()
    
    var body: some View
    {
        HStack
        {
            // MARK: 主頁
            if self.select == 0
            {
                ZStack
                {
                    // 應該會包住篩選和食譜
                    VStack
                    {
                        // 第一個視圖
                        VStack(spacing: 0)
                        {
                            HStack
                            {
                                Button(action:
                                        {
                                    // 展開搜索列設為TRUE
                                    isSearching = true
                                }) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(red: 0.961, green: 0.804, blue: 0.576))
                                        .frame(width: 300, height: 35, alignment: .leading)
                                        .overlay
                                    {
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
                            .padding(10)
                        }
                        // MARK: 最上方搜尋列和清單或加號的背景調整
                        .frame(width:400)
                        .background(Color(.systemOrange))
                        //                .background(Color(.orange))
                        .padding(.bottom, -10)
                        .fullScreenCover(isPresented: $isSearching)
                        {
                            SearchView(isSearching: $isSearching)
                        }
                    }
                }
            }
            // MARK: 分享
            if self.select == 1
            {
                ZStack
                {
                    // 包住加號和發佈貼文
                    VStack
                    {
                        VStack(spacing: 0)
                        {
                            // 第一個視圖
                            HStack
                            {
                                Button(action:
                                        {
                                    // 展開搜索列設為TRUE
                                    isSearching = true
                                }) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(red: 0.961, green: 0.804, blue: 0.576))
                                        .frame(width: 300, height: 35, alignment: .leading)
                                        .overlay
                                    {
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
                            .padding(10)
                        }
                        // MARK: 最上方搜尋列和清單或加號的背景調整
                        .frame(width:400)
                        .background(Color(.systemOrange))
                        //                .background(Color(.orange))
                        .padding(.bottom, -10)
                        .fullScreenCover(isPresented: $isSearching)
                        {
                            SearchView(isSearching: $isSearching)
                        }
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
        // MARK: TabView
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
