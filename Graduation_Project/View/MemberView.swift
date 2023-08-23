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
                    //用戶名稱
                    HStack
                    {
                        Spacer()
                        Text("秋雨")
                        Spacer()
                        
                    }
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
                    NavigationLink(destination: MydataView()){
                        Text("編輯個人資料")
                            .foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))
                    }
                    //MARK: 個人資料集
                    Section
                    {
                        //性別
                        MemberButton(image: "person.fill", title: "性別", itemContent: "男性")
                        //年齡
                        MemberButton(image: "birthday.cake.fill", title: "年齡", itemContent: "18")
                        //身高
                        MemberButton(image: "ruler", title: "身高", itemContent: "180 CM")
                        //體重
                        MemberButton(image: "dumbbell", title: "體重", itemContent: "60 KG")
                        //手機號碼
                        MemberButton(image: "phone", title: "手機號碼", itemContent: "0900-123456")
                    }
//                    NavigationLink(destination: MydataView()){
//                        Text("編輯個人資料")
//                    }
                }
                
            }
                .listStyle(.plain)
       
            }
        .navigationTitle(Text("會員"))
        .navigationBarTitleDisplayMode(.inline)
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
/////12345
/////
//  Member.swift
//  TopicIM110
//
//  Created by 覓食陳 on 2023/8/21.
//

//import SwiftUI
//
//struct MemberView: View
//{
//    @State private var name = ""
//    @State private var gender = ""
//    @State private var age : Bool
//    @State private var CM : Bool
//    @State private var KG : Bool
//    @State private var phone = ""
//
//    //TabView選擇的頁面
//    @Binding var select: Int
//
//    var body: some View
//    {
//
//        NavigationStack
//        {
//            ZStack
//            {
//                Color.white.ignoresSafeArea(.all)
//
//                List
//                {
//                    //用戶頭貼
//                    HStack
//                    {
//                        //user image目前用圓形代替
//                        //                Image("user image")
//                        //                    .resizable()
//                        //                    .aspectRatio(contentMode: .fit)
//                        //                    .frame(width: 150.0, height: 150.0)
//                        //                    .clipShape(Circle())//圓形裁減
//                        //                    .padding(.top, -300)
//
//                        Spacer()
//                        Circle()
//                            .foregroundColor(.gray)
//                            .frame(width: 150,height: 150)
//
//                        Spacer()
//                    }
//                    .listRowSeparator(.hidden)
//                    //用戶名稱
//                    HStack
//                    {
//                        Spacer()
//                        Text("秋雨")
//                        Spacer()
//
//                    }
//                    .listRowSeparator(.hidden)
//                    //MARK: 標籤集
//                    Section
//                    {
//                        //紀錄用戶身體健康指標標籤
//                        HStack
//                        {
//                            Spacer()
//                            //高血糖
//                            VStack(spacing:5)
//                            {
//                                Button
//                                {
//                                    //點擊標籤去到標籤收藏館
//                                }
//                            label:
//                                {
//                                    _Tag1Button(
//                                        image: "",
//                                        title: "高血糖",
//                                        fore: .gray,
//                                        back: .white
//                                    )
//                                }
//                            }
//                            //尿酸
//                            VStack(spacing:5)
//                            {
//                                Button
//                                {
//                                    //點擊標籤去到標籤收藏館
//                                }
//                            label:
//                                {
//                                    _Tag1Button(
//                                        image: "",
//                                        title: "尿酸",
//                                        fore: .gray,
//                                        back: .white
//                                    )
//                                }
//                            }
//                            //高血脂
//                            VStack(spacing:5)
//                            {
//                                Button
//                                {
//                                    //點擊標籤去到標籤收藏館
//                                }
//                            label:
//                                {
//                                    _Tag1Button(
//                                        image: "",
//                                        title: "高血脂",
//                                        fore: .gray,
//                                        back: .white
//                                    )
//                                }
//                            }
//                            Spacer()
//                        }
//
//                        //用戶成就標籤
//                        HStack{
//                            //美食尋寶家
//                            VStack(spacing:5)
//                            {
//                                Button
//                                {
//                                    //點擊標籤去到標籤收藏館
//                                }
//                            label:
//                                {
//                                    _Tag2Button(
//                                        image: "",
//                                        title: "美食尋寶家",
//                                        fore: .gray,
//                                        back: .white
//                                    )
//                                }
//                            }
//                            //7日打卡成功
//                            VStack(spacing:5)
//                            {
//                                Button
//                                {
//                                    //點擊標籤去到標籤收藏館
//                                }
//                            label:
//                                {
//                                    _Tag2Button(
//                                        image: "",
//                                        title: "7日打卡成功",
//                                        fore: .gray,
//                                        back: .white
//                                    )
//                                }
//                            }
//
//                        }
//
//                    }.listRowSeparator(.hidden)
//
//                    //MARK: 個人資料集
//                    Section
//                    {MemberButton(image: <#T##String#>, title: <#T##String#>, itemContent: <#T##String#>)
//                        //性別
////                        _MemberButton(image: "person.fill", title: "性別", itemContent: gender)
////                        //年齡
////                        _MemberButton(image: "birthday.cake.fill", title: "年齡", itemContent: age)
////                        //身高
////                        _MemberButton(image: "ruler", title: "身高", itemContent: CM)
////                        //體重
////                        _MemberButton(image: "dumbbell", title: "體重", itemContent:  KG)
////                        //手機號碼
////                        _MemberButton(image: "phone", title: "手機號碼", itemContent: phone)
//                    }
////                    NavigationLink(destination: MydataView()){
////                        Text("編輯個人資料")
////                    }
//                }
//
//            }
//                .listStyle(.plain)
//
//            }
//        .navigationTitle(Text("會員"))
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//
////MARK: 想放一個視窗更換用戶圖貼用
////struct UsersHeadSticker : View
////{
////    var body: some View
////    {
////
////    }
////}
//struct MemberView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        ContentView()
//    }
//}
