//
//  Member.swift
//  TopicIM110
//
//  Created by 曾品瑞 on 2023/8/18.
//

import SwiftUI

struct Member: View
{
    //TabView選擇的頁面
    @Binding var select: Int
    
    var body: some View
    {
        VStack(spacing: 50)
        {
            //MARK: 頭貼名字
            VStack
            {
                Circle()
                    .fill(.gray)
                    .frame(height: 100)
                
                Text("NAME")
                    .bold()
                    .font(.title)
            }
            
            //MARK: 功能按鈕
            Button
            {
                
            }
            label:
            {
                MemberButton(title: "我的資料")
            }
            
            Button
            {
                
            }
            label:
            {
                MemberButton(title: "查閱食譜")
            }
            
            Button
            {
                
            }
            label:
            {
                MemberButton(title: "購物記錄")
            }
            
            Button
            {
                
            }
            label:
            {
                MemberButton(title: "其他設定")
            }
            
            Spacer()
        }
    }
}

struct Member_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
