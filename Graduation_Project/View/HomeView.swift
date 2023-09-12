// HomeView.swift

import SwiftUI

struct HomeView: View {
    @Namespace private var cardNamespace
    @State private var selectedTab = 0
    
    var body: some View {
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
            
            TabView(selection: $selectedTab) {
                // 主菜
                ZStack
                {
                    //                    Color(red: 0.961, green: 0.804, blue: 0.576)
                    
                    NavigationStack
                    {
                        ScrollView(showsIndicators: false) {
                            // 这里是管理食谱有多少的，您可以随意更改
                            //                                ForEach(0..<5, id: \.self)
                            //                                { _ in
                            //                                    overlayRectangleWithText()
                            //                                    Spacer().frame(height: 0)
                            //                                }
                            
                            overlayRectangleWithText()
                            Spacer().frame(height: 0)
                        }
                    }
                }
                .tag(0)
                
                CardView(title: "配菜", namespace: cardNamespace) // 配菜視圖
                    .tag(1)
                CardView(title: "湯品", namespace: cardNamespace) // 湯品視圖
                    .tag(2)
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
