//  HomeView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/9/13.
//

import SwiftUI

struct HomeView: View {
    @Namespace private var cardNamespace
    @State private var selectedTab = 0
    
    var body: some View {
        // MARK: 內建食譜分類
        VStack(spacing: 0) {
            HStack {
                Spacer()
                TabButton(title: "主菜", isSelected: selectedTab == 0) {
                    withAnimation {
                        selectedTab = 0
                    }
                }
                Spacer()
                TabButton(title: "配菜", isSelected: selectedTab == 1) {
                    withAnimation {
                        selectedTab = 1
                    }
                }
                Spacer()
                TabButton(title: "湯品", isSelected: selectedTab == 2) {
                    withAnimation {
                        selectedTab = 2
                    }
                }
                Spacer()
                TabButton(title: "甜點", isSelected: selectedTab == 3) {
                    withAnimation {
                        selectedTab = 3
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color(.systemOrange))

            // MARK: TabView
            TabView(selection: $selectedTab) {
                // MARK: 主菜
                    NavigationStack
                    {
                        // 番茄炒蛋
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
                                        // MARK: 資料庫食譜照片
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.gray)
                                            .frame(width: 180, height: 100)
                                        // MARK: 資料庫食譜名稱
                                        Text("番茄炒蛋")
                                            .foregroundColor(Color("textcolor"))
                                            .font(.body)
                                    }
                                    // MARK: 資料庫所需食材及料理方式
                                    Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                        .foregroundColor(Color("textcolor"))
                                        .font(.body)
                                }
                                .foregroundColor(Color.black)
                                .padding(.horizontal) // 在水平方向上添加安全區塊
                            }
                    }
                        // 洋蔥炒蛋
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
                                        // MARK: 資料庫食譜照片
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.gray)
                                            .frame(width: 180, height: 100)
                                        // MARK: 資料庫食譜名稱
                                        Text("洋蔥炒蛋")
                                            .foregroundColor(Color("textcolor"))
                                            .font(.body)
                                    }
                                    // MARK: 資料庫所需食材及料理方式
                                    Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                        .foregroundColor(Color("textcolor"))
                                        .font(.body)
                                }
                                .foregroundColor(Color.black)
                                .padding(.horizontal) // 在水平方向上添加安全區塊
                            }
                    }
                        // 韭菜炒蛋
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
                                        // MARK: 資料庫食譜照片
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.gray)
                                            .frame(width: 180, height: 100)
                                        // MARK: 資料庫食譜名稱
                                        Text("韭菜炒蛋")
                                            .foregroundColor(Color("textcolor"))
                                            .font(.body)
                                    }
                                    // MARK: 資料庫所需食材及料理方式
                                    Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                        .foregroundColor(Color("textcolor"))
                                        .font(.body)
                                }
                                .foregroundColor(Color.black)
                                .padding(.horizontal) // 在水平方向上添加安全區塊
                            }
                    }
                        // 菜埔炒蛋
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
                                        // MARK: 資料庫食譜照片
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.gray)
                                            .frame(width: 180, height: 100)
                                        // MARK: 資料庫食譜名稱
                                        Text("菜埔炒蛋")
                                            .foregroundColor(Color("textcolor"))
                                            .font(.body)
                                    }
                                    // MARK: 資料庫所需食材及料理方式
                                    Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
                                        .foregroundColor(Color("textcolor"))
                                        .font(.body)
                                }
                                .foregroundColor(Color.black)
                                .padding(.horizontal) // 在水平方向上添加安全區塊
                            }
                    }
                }
                .tag(0)
                // MARK: 配菜
                CardView(title: "配菜", namespace: cardNamespace) // 配菜視圖
                    .tag(1)
                // MARK: 湯品
                CardView(title: "湯品", namespace: cardNamespace) // 湯品視圖
                    .tag(2)
                // MARK: 甜點
                CardView(title: "甜點", namespace: cardNamespace) // 甜點視圖
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct TabButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18))
                .foregroundColor(isSelected ? .white : .black)
        }
        .padding()
        .background(isSelected ?  Color(red: 0.914, green: 0.510, blue: 0.235) : Color.clear)
        .cornerRadius(8)
    }
}

struct CardView: View {
    var title: String
    var namespace: Namespace.ID
    
    var body: some View {
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

//func overlayRectangleWithText() -> some View
//{
//    return
//    NavigationStack
//    {
//        NavigationLink(destination: MenuView())
//        {
//            ZStack
//            {
//                // MARK: 矩形背景
//                Rectangle()
//                    .frame(width: 400, height: 150)
//                    .foregroundColor(Color("menusheetbackgroundcolor"))
//
//                HStack(alignment:.center)
//                {
//                    VStack(alignment: .center)
//                    {
//                        // MARK: 食譜照片
//                        RoundedRectangle(cornerRadius: 20)
//                            .fill(Color.gray)
//                            .frame(width: 180, height: 100)
//                        // MARK: 食譜名稱
//                        Text("番茄炒蛋")
//                            .foregroundColor(Color("textcolor"))
//                            .font(.body)
//                    }
//                    // MARK: 所需食材及料理方式
//                    Text("XXXXXXXXXXXXXXXXXXXXXXXXXX")
//                        .foregroundColor(Color("textcolor"))
//                        .font(.body)
//                }
//                .foregroundColor(Color.black)
//                .padding(.horizontal) // 在水平方向上添加安全區塊
//            }
//        }
//    }
//}
