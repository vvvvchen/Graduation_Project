//  HomeView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/9/13.
//

import SwiftUI

struct HomeView: View
{
    @Namespace private var cardNamespace
    @State private var selectedTab = 0
    
    var body: some View
    {
        // MARK: 內建食譜分類
        VStack(spacing: 0)
        {
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
