//
//  Member.swift
//  TopicIM110
//
//  Created by 覓食陳 on 2023/8/21.
//

import SwiftUI

struct MemberView: View
{
    //TabView選擇的頁面
    @Binding var select: Int
    
    var body: some View
    {
        NavigationStack{
            VStack(spacing:30)
            {
//user image目前用圓形代替
//                Image("user image")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 150.0, height: 150.0)
//                    .clipShape(Circle())//圓形裁減
//                    .padding(.top, -300)
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 150,height: 150)
                    .padding()
                
                Text("username")
                //標籤集
                VStack(spacing:15)
                {
                    //紀錄用戶身體健康指標標籤
                    HStack{
                        //高血糖
                        VStack(spacing:5)
                        {
                            Button
                            {
                                //點擊標籤去到標籤收藏館
                            }
                            label:
                            {
                                _Tag1Button(
                                    image: "",
                                    title: "高血糖",
                                    fore: .gray,
                                    back: .white
                                )
                            }
                        }
                        //尿酸
                        VStack(spacing:5)
                        {
                            Button
                            {
                                //點擊標籤去到標籤收藏館
                            }
                            label:
                            {
                                _Tag1Button(
                                    image: "",
                                    title: "尿酸",
                                    fore: .gray,
                                    back: .white
                                )
                            }
                        }
                        //高血脂
                        VStack(spacing:5)
                        {
                            Button
                            {
                                //點擊標籤去到標籤收藏館
                            }
                            label:
                            {
                                _Tag1Button(
                                    image: "",
                                    title: "高血脂",
                                    fore: .gray,
                                    back: .white
                                )
                            }
                        }
                    }

                    //用戶成就標籤
                    HStack{
                        //美食尋寶家
                        VStack(spacing:5)
                        {
                            Button
                            {
                                //點擊標籤去到標籤收藏館
                            }
                            label:
                            {
                                _Tag2Button(
                                    image: "",
                                    title: "美食尋寶家",
                                    fore: .gray,
                                    back: .white
                                )
                            }
                        }
                        //7日打卡成功
                        VStack(spacing:5)
                        {
                            Button
                            {
                                //點擊標籤去到標籤收藏館
                            }
                            label:
                            {
                                _Tag2Button(
                                    image: "",
                                    title: "7日打卡成功",
                                    fore: .gray,
                                    back: .white
                                )
                            }
                        }
                    }
                }
                
                //個人資料內容
                VStack{
                    HStack{
                        Image("person.fill")
                        Text("姓名 ： ")
                        
                        Button
                        {
                            //點擊後跳轉至mydata編輯
                        }
                    label:
                        {
                            _Tag1Button(
                                image: "",
                                title: "username",
                                fore: .gray,
                                back: .white
                            )
                        }
                    }
                }

                Spacer()
            }
        }
        .navigationTitle(Text("會員"))
        .navigationBarTitleDisplayMode(.inline)
    }
    
}
//想放一個視窗更換用戶圖貼用
//struct UsersHeadSticker : View
//{
//    var body: some View
//    {
//
//    }
//}
struct MemberView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
