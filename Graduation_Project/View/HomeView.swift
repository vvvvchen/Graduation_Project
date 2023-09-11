//
//
//  Home.swift
//
//  Created by 0820
//

import SwiftUI

struct HomeView: View
{
    @Binding var select: Int
    @State private var selectedTab = 0


    var body: some View
    {
        TabView(selection: $selectedTab) {
            ZStack
            {
                Color(red: 0.961, green: 0.804, blue: 0.576)

                NavigationStack
                {
                    ScrollView(showsIndicators: false)
                    {
                        // 這裡是管理食譜有多少的 數字可以隨便改
                        ForEach(0..<5, id: \.self)
                        {
                           _ in
                            overlayRectangleWithText()
                            Spacer().frame(height: 0)
                        }
                    }
                }
            }
                .tag(0)

            Text("第二个视图")
                .tabItem {
                    Text("配菜")
                }
                .tag(1)

            Text("第三个视图")
                .tabItem {
                    Image(systemName: "3.circle")
                }
                .tag(2)
            Text("第四个视图")
                .tabItem {
                    Text("甜點")
                }
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
//        ZStack
//        {
//            Color(red: 0.961, green: 0.804, blue: 0.576)
//
//            NavigationStack
//            {
//                ScrollView(showsIndicators: false)
//                {
//                    // 這裡是管理食譜有多少的 數字可以隨便改
//                    ForEach(0..<5, id: .self)
//                    {  in
//                        overlayRectangleWithText()
//                        Spacer().frame(height: 0)
//                    }
//                }
//            }
//        }
//    }
//}
