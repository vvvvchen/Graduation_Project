////
////  Mydata.swift
////  Graduation_Project
////
////  Created by Mac on 2023/8/23.
////
//
//import SwiftUI
//
//struct MydataView: View {
//    @Binding var person: [Information]
//
//    @Environment(\.dismiss) var dismiss
//
//
//
//    //    @State private var showAlert = false//警示提示視窗
//    //    @State private var alertMessage = " "//提示訊息
//    //    @State private var Changesuccess = false
//
//    var body: some View {
//        NavigationStack{
//
//            VStack{
//                ForEach(self.person, id: \.self) {index in
//                    VStack(alignment: .leading) {
//                        Text("Name: \(index.name)")
//                        Text("gender: \(index.gender)")
//                        Text("Age: \(index.age)")
//                        Text("CM: \(index.CM)")
//                        Text("KG: \(index.KG)")
//                        Text("phone: \(index.phone)")
//
//                    }
//                    .font(.title)
//                    Button("Confirm Changes") {
//                        dismiss()
//                    }
//                    .padding()
//                }
//            }
//            .navigationTitle(Text("編輯個人資料"))
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
////    struct MydataView_Previews: PreviewProvider {
////        static var previews: some View {
////            MydataView(
////                name: .constant(""),
////
////                gender: .constant(""),
////
////                age: .constant(""),
////
////                CM: .constant(""),
////
////                KG: .constant(""),
////                phone: .constant("")
////            )
////        }
////    }


//舊版更新無誤
//
//  Mydata.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/20.
//

import SwiftUI

struct MyDataView: View {
    @State private var showAlert = false//警示提示視窗
        @State private var alertMessage = " "//提示訊息
        @State private var Changesuccess = false

        var body: some View {
            NavigationStack{

                VStack{
                    //            TextField("輸入您的帳號")
                    //                .padding()
                    //                .background(Color.gray.opacity(0.1))
                    //                .frame(width: 300, height: 50)
                    //                .cornerRadius(100)
                }
            }
            .navigationTitle(Text("編輯個人資料"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    struct MydataView_Previews: PreviewProvider {
        static var previews: some View {
            MyDataView()
        }
    }
