//
//  Member.swift
//  TopicIM110
//
//  Created by 曾品瑞 on 2023/8/18.
//

import SwiftUI

struct MemberView: View
{
    //TabView選擇的頁面
    @Binding var select: Int
    
    var body: some View
    {
        NavigationStack{
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
                NavigationLink(destination: MydataView())
                {
                    MemberButton(title: "我的資料")
                }
                NavigationLink(destination: MydataView()) //要改ＶＩＥＷ
                {
                    MemberButton(title: "查閱食譜")
                }
                NavigationLink(destination: MydataView()) //要改ＶＩＥＷ
                {
                    MemberButton(title: "食材紀錄")
                }
                NavigationLink(destination: MydataView()) //要改ＶＩＥＷ
                {
                    MemberButton(title: "其他設定")
                }
                Spacer()
            }
        }
    }
}

struct MemberView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
