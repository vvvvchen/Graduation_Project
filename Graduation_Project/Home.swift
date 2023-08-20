//
//  Home.swift
//  TopicIM110
//
//  Created by 曾品瑞 on 2023/8/18.
//

import SwiftUI

struct Home: View
{
    //TabView選擇的頁面
    @Binding var select: Int
    
    private let cook: [String]=["煎", "煮", "炒", "作"]
    
    var body: some View
    {
        VStack(spacing: 20)
        {
            //MARK: 今日推薦
            ScrollView(.horizontal, showsIndicators: false)
            {
                HStack
                {
                    ForEach(0..<3)
                    {_ in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray3))
                            .frame(width: UIScreen.main.bounds.size.width*0.8, height: 200)
                            .overlay
                            {
                                Text("今日推薦").font(.title)
                            }
                    }
                }
            }
            
            Capsule(style: .continuous).frame(height: 1)
            
            //MARK: 烹飪方法
            HStack
            {
                ForEach(self.cook, id: \.self)
                {index in
                    Button
                    {
                        //點擊「烹飪方法」之後要執行的動作
                    }
                    label:
                    {
                        Circle()
                            .fill(Color(.systemGray3))
                            .overlay
                            {
                                Text(index).font(.title)
                            }
                    }
                }
            }
            
            Capsule(style: .continuous).frame(height: 1)
            
            //MARK: 其他功能
            HStack
            {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray3))
                    .overlay
                    {
                        Text("健康管理").font(.title)
                    }
                
                VStack
                {
                    ForEach(0..<2)
                    {index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray3))
                            .overlay
                            {
                                Text(index==0 ? "我的食譜":"購物清單").font(.title)
                            }
                    }
                }
            }
        }
        .padding()
    }
}

struct Home_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
