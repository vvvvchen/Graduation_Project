//
//  Mydata.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import SwiftUI

struct MydataView: View {
    @Binding var person: [Information]

    @Environment(\.dismiss) var dismiss

    //    @State private var showAlert = false//警示提示視窗
    //    @State private var alertMessage = " "//提示訊息
    //    @State private var Changesuccess = false

    var body: some View {
        NavigationStack{
            
            VStack{
                ForEach(person.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        TextField("Name", text: $person[index].name)
                        TextField("Gender", text: $person[index].gender)
                        TextField("Age", value: $person[index].age, formatter: NumberFormatter())
                        TextField("CM", value: $person[index].CM, formatter: NumberFormatter())
                        TextField("KG", value: $person[index].KG, formatter: NumberFormatter())
                        TextField("Phone", text: $person[index].phone)
                    }
                    .font(.title)
                    .padding()
                }
                Button("Confirm Changes") {
                    dismiss()
                }
                .padding()
            }
            .navigationTitle(Text("編輯個人資料"))
            .navigationBarTitleDisplayMode(.inline)
   
        }
    }
}
