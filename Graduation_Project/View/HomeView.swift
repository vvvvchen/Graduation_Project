//  HomeView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/9/15.
//

import SwiftUI

struct HomeView: View
{
    @Namespace private var cardNamespace
    @State private var selectedTab = 0
    
    // 展開搜索列設為FALSE
    @State private var isSearching = false
    
    // 轉盤控制區
    @State private var isSheetPresented = false
    @State private var buttonOffset: CGSize = .zero
    @State private var isDragging = false
    @State private var buttonPosition: CGPoint = CGPoint(x: 350, y: 600)
    
    var body: some View
    {
        ZStack
        {
            // MARK: 內建食譜分類
            VStack(spacing: 0)
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
                .padding(.bottom, 0)
                .fullScreenCover(isPresented: $isSearching)
                {
                    SearchView(isSearching: $isSearching)
                }
                HStack(spacing: 25)
                {
                    TabButton(title: "主菜", isSelected: selectedTab == 0)
                    {
                        withAnimation
                        {
                            selectedTab = 0
                        }
                    }
                    .padding(.top, 8)
                    TabButton(title: "配菜", isSelected: selectedTab == 1)
                    {
                        withAnimation
                        {
                            selectedTab = 1
                        }
                    }
                    .padding(.top, 8)
                    
                    TabButton(title: "湯品", isSelected: selectedTab == 2)
                    {
                        withAnimation
                        {
                            selectedTab = 2
                        }
                    }
                    .padding(.top, 8)
                    
                    TabButton(title: "甜點", isSelected: selectedTab == 3)
                    {
                        withAnimation
                        {
                            selectedTab = 3
                        }
                    }
                    .padding(.top, 8)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color(.systemOrange))
                .padding(.bottom, 0) // 向下添加底边距
                ZStack(alignment: .bottomLeading)
                {
                    // MARK: 底線設置
                    GeometryReader
                    {
                        geometry in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: geometry.size.width / 4, height: 3)
                            .offset(x: CGFloat(selectedTab) * (geometry.size.width / 4), y: 0)
                            .animation(.easeInOut)
                    }
                    .padding(.top,-5)
                    
                    // MARK: TabView 視圖
                    TabView(selection: $selectedTab)
                    {
                        // MARK: 主菜
                        NavigationStack
                        {
                            ScrollView
                            {
                                // 番茄炒蛋
                                NavigationLink(destination: MenuView())
                                {
                                    ZStack
                                    {
                                        
                                        // 內建食譜最下層的矩形
                                        Rectangle()
                                            .frame(width: 400, height: 150)
                                            .foregroundColor(Color("menusheetbackgroundcolor"))
                                        HStack(alignment:.center)
                                        {
                                            VStack(spacing: 0)
                                            {
                                                // 資料庫食譜照片
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.gray)
                                                    .frame(width: 180, height: 100)
                                                // 資料庫食譜名稱
                                                Text("番茄炒蛋")
                                                    .foregroundColor(Color("textcolor"))
                                                    .font(.body)
                                            }
                                            // 資料庫所需食材及料理方式
                                            Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                                .foregroundColor(Color("textcolor"))
                                                .font(.body)
                                        }
                                        .foregroundColor(Color.black)
                                        .padding(.horizontal)
                                    }
                                }
                                // 洋蔥炒蛋
                                NavigationLink(destination: MenuView())
                                {
                                    ZStack
                                    {
                                        
                                        // 內建食譜最下層的矩形
                                        Rectangle()
                                            .frame(width: 400, height: 150)
                                            .foregroundColor(Color("menusheetbackgroundcolor"))
                                        HStack(alignment:.center)
                                        {
                                            VStack(spacing: 0)
                                            {
                                                // 資料庫食譜照片
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.gray)
                                                    .frame(width: 180, height: 100)
                                                // 資料庫食譜名稱
                                                Text("洋蔥炒蛋")
                                                    .foregroundColor(Color("textcolor"))
                                                    .font(.body)
                                            }
                                            // 資料庫所需食材及料理方式
                                            Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                                .foregroundColor(Color("textcolor"))
                                                .font(.body)
                                        }
                                        .foregroundColor(Color.black)
                                        .padding(.horizontal)
                                    }
                                }
                                // 韭菜炒蛋
                                NavigationLink(destination: MenuView())
                                {
                                    ZStack
                                    {
                                        
                                        // 內建食譜最下層的矩形
                                        Rectangle()
                                            .frame(width: 400, height: 150)
                                            .foregroundColor(Color("menusheetbackgroundcolor"))
                                        HStack(alignment:.center)
                                        {
                                            VStack(spacing: 0)
                                            {
                                                // 資料庫食譜照片
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.gray)
                                                    .frame(width: 180, height: 100)
                                                // 資料庫食譜名稱
                                                Text("韭菜炒蛋")
                                                    .foregroundColor(Color("textcolor"))
                                                    .font(.body)
                                            }
                                            // 資料庫所需食材及料理方式
                                            Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                                .foregroundColor(Color("textcolor"))
                                                .font(.body)
                                        }
                                        .foregroundColor(Color.black)
                                        .padding(.horizontal)
                                    }
                                }
                                // 菜埔炒蛋
                                NavigationLink(destination: MenuView())
                                {
                                    ZStack
                                    {
                                        
                                        // 內建食譜最下層的矩形
                                        Rectangle()
                                            .frame(width: 400, height: 150)
                                            .foregroundColor(Color("menusheetbackgroundcolor"))
                                        HStack(alignment:.center)
                                        {
                                            VStack(spacing: 0)
                                            {
                                                // 資料庫食譜照片
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.gray)
                                                    .frame(width: 180, height: 100)
                                                // 資料庫食譜名稱
                                                Text("菜埔炒蛋")
                                                    .foregroundColor(Color("textcolor"))
                                                    .font(.body)
                                            }
                                            // 資料庫所需食材及料理方式
                                            Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                                .foregroundColor(Color("textcolor"))
                                                .font(.body)
                                        }
                                        .foregroundColor(Color.black)
                                        .padding(.horizontal)
                                    }
                                }
                                // 棉花糖炒蛋
                                NavigationLink(destination: MenuView())
                                {
                                    ZStack
                                    {
                                        
                                        // MARK: 內建食譜最下層的矩形
                                        Rectangle()
                                            .frame(width: 400, height: 150)
                                            .foregroundColor(Color("menusheetbackgroundcolor"))
                                        HStack(alignment:.center)
                                        {
                                            VStack(spacing: 0)
                                            {
                                                // 資料庫食譜照片
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.gray)
                                                    .frame(width: 180, height: 100)
                                                // 資料庫食譜名稱
                                                Text("棉花糖炒蛋")
                                                    .foregroundColor(Color("textcolor"))
                                                    .font(.body)
                                            }
                                            // 資料庫所需食材及料理方式
                                            Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                                .foregroundColor(Color("textcolor"))
                                                .font(.body)
                                        }
                                        .foregroundColor(Color.black)
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .tag(0)
                        // MARK: 配菜
                        CardView(title: "配菜", namespace: cardNamespace)
                            .tag(1)
                        // MARK: 湯品
                        CardView(title: "湯品", namespace: cardNamespace)
                            .tag(2)
                        // MARK: 甜點
                        CardView(title: "甜點", namespace: cardNamespace)
                            .tag(3)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    ZStack
                    {
                        // MARK: 使用者發布文章區塊
                        Button(action:
                                {
                            isSheetPresented = true
                        }) {
                            ZStack
                            {
                                Circle()
                                    .fill(Color(.systemOrange))
                                    .frame(width: 80, height: 80)
                                    .offset(buttonOffset)
                                
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                    .offset(buttonOffset)
                            }
                        }
                        .offset(buttonOffset)
                        
                        // MARK: 發布文章按鈕
                        
                        
                    }
                    .sheet(isPresented: $isSheetPresented)
                    {
                        Text("This is a sheet.")
                    }
                    
                    .gesture(
                        // 手勢類型，會在用戶開始拖動時觸發
                        DragGesture()
                        // 用戶拖動發生變化時，會執行括號中的代碼
                            .onChanged
                        {
                            value in
                            // 把按鈕偏移位置設置為當前拖動的位移
                            buttonOffset = value.translation
                            // 按鈕正在被拖動
                            isDragging = true
                        }
                            .onEnded
                        {
                            value in
                            // 按鈕停止拖動
                            isDragging = false
                            // 更新按鈕位置(限制按鈕可以移動到哪裡)
                            let newX = min(max(45, buttonPosition.x + value.translation.width), 350)
                            let newY = min(max(50, buttonPosition.y + value.translation.height), 600)
                            
                            withAnimation
                            {
                                buttonPosition = CGPoint(x: newX, y: newY)
                            }
                            // 重置按鈕偏移
                            buttonOffset = .zero
                        }
                    )
                    // 用保存的位置來設置按鈕位置
                    .position(buttonPosition)
                }
            }
        }
        
    }
}

// MARK: TabButton格式
struct TabButton: View
{
    var title: String
    var isSelected: Bool
    var action: () -> Void
    var body: some View
    {
        GeometryReader
        {
            geometry in
            VStack
            {
                Button(action: action)
                {
                    Text(title)
                        .font(.system(size: 18))
                        .foregroundColor(isSelected ? .white : .black)
                }
                .padding()
                .cornerRadius(8)
                .frame(width: geometry.size.width, height: geometry.size.height/1.5)
            }
        }
    }
}

// MARK: CardView格式

struct CardView: View
{
    var title: String
    var namespace: Namespace.ID
    
    var body: some View
    {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.blue)
            .frame(width: 300, height: 200)
            .overlay(
                Text(title)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: title, in: namespace)
            )
    }
}
