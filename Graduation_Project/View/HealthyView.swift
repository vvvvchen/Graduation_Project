////
////  HealthyView.swift
////  Graduation_Project
////
////  Created by Mac on 2023/8/24.
////
//
//import SwiftUI
//
//struct HealthyView: View
//{
//    @AppStorage("userImage") private var userImage: Data?
//    var body: some View
//    {
//        VStack(spacing:40)
//        {
//            //用戶頭像
//            HStack
//            {
//                if let userImage=self.userImage,
//                   let image=UIImage(data: userImage)
//                {
//                    Spacer()
//                    Image(uiImage: image)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 130, height: 130)
//                        .clipShape(Circle())
//                        .padding(.bottom, 0)
//                        .clipShape(Circle())
//                    Spacer()
//                }
//                else
//                {
//                    Spacer()
//                    Circle()
//                        .fill(.gray)
//                        .scaledToFit()
//                        .frame(width: 130)
//                        .padding(.bottom, 50)
//                    Spacer()
//                }
//            }
//            
//            //用戶名稱
//            Text("秋雨")
//            
//            NavigationStack
//            {
//                VStack(spacing:50)
//                {
//                    //MARK: 導航頁面
//                    NavigationLink(destination: BMIView())
//                    {
//                        HealthyButton(title: "BMI")
//                    }
//                    
//                    NavigationLink(destination: KcalView())
//                    {
//                        HealthyButton(title: "卡路里")
//                    }
//                    NavigationLink(destination: BodyView())
//                    {
//                        HealthyButton(title: "身體素質")
//                    }
//                    NavigationLink(destination: SwiftUIView())
//                    {
//                        HealthyButton(title: "未來展望")
//                    }
//                    
//                }
//                
//                Spacer()
//            }
//        }
//    }
//}
//
//struct HealthyView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        HealthyView()
//    }
//}
