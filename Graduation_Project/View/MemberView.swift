//
//  Member.swift
//  TopicIM110
//
//  Created by 覓食陳 on 2023/8/21.
//

import SwiftUI

struct MemberView: View
{
//    @State private var person: [Information] = [
//        Information(image: "", name: "秋雨", gender: "男生", age: 16, CM: 166, KG: 45, phone: "0900000000")
//    ]
    @ObservedObject var userDataManager = UserDataManager()
    //TabView選擇的頁面
    @Binding var select: Int
    
    var body: some View
    {
        
        NavigationStack
        {
            ZStack
            {
                Color.white.ignoresSafeArea(.all)
                
                List
                {
                   
                        //用戶頭貼
                        HStack
                        {
                            //user image目前用圓形代替
                            //                Image("user image")
                            //                    .resizable()
                            //                    .aspectRatio(contentMode: .fit)
                            //                    .frame(width: 150.0, height: 150.0)
                            //                    .clipShape(Circle())//圓形裁減
                            //                    .padding(.top, -300)
                            
                            Spacer()
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width: 150,height: 150)
                            
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                        .listRowSeparator(.hidden)
                        //MARK: 標籤集
                        Section
                        {
                            //紀錄用戶身體健康指標標籤
                            HStack
                            {
                                Spacer()
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
                                Spacer()
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
                            
                        }.listRowSeparator(.hidden)
                        NavigationLink(destination: MydataView(person: $userDataManager.person)){
                            Text("編輯個人資料")
                                .foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))
                        }
                        //MARK: 個人資料集
                        
                        Section
                        {
                            ForEach(userDataManager.person, id: \.self)
                            {index in
                            VStack(alignment: .leading)
                            {
                                MemberButton(image: "person.fill", title: "名稱" ,itemContent: "\(index.name)")
                                MemberButton(image: "figure.arms.open", title: "性別" ,itemContent: "\(index.gender)")
                                MemberButton(image: "birthday.cake.fill", title: "年齡", itemContent:"\(index.age)")
                                MemberButton(image: "ruler", title: "身高", itemContent: "\(index.CM)CM")
                                MemberButton(image: "dumbbell", title: "體重", itemContent: "\(index.KG)KG")
                                MemberButton(image: "phone", title: "手機號碼", itemContent: "\(index.phone)")
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(Text("會員"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//MARK: 想放一個視窗更換用戶圖貼用
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
