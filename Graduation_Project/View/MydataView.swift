//
//  Mydata.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/20.
//

import SwiftUI

struct MydataView: View {
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
            MydataView()
        }
    }
//123
//
//  Mydata.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/20.
//

//import SwiftUI
//
//struct MydataView: View {
//        @State private var name = ""
//
//var body: some View
//{
//            NavigationStack
//            {
//                VStack
//                {
//                    List
//                    {
//                        Section
//                        {
//                            TextField("name",text: $name)
//                                .padding()
//                                .background(Color.gray.opacity(0.1))
//                                .frame(width: 300, height: 50)
//                                .cornerRadius(100)
//                        }
//                    }
//                    .listStyle(.plain)
//
//                }
//            }
//            .navigationTitle(Text("編輯個人資料"))
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//
//    struct MydataView_Previews: PreviewProvider {
//        static var previews: some View {
//            MydataView()
//        }
//    }