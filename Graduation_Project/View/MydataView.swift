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
    
    @State private var showAlert = false//警示提示視窗
    @State private var alertMessage = " "//提示訊息
    @State private var Changesuccess = false
    
//    private func changecheck() -> Bool
//    {
//        return !self.name.isEmpty && !self.gender.isEmpty && !self.age.isEmpty && !self.CM.isEmpty && !self.KG.isEmpty && !self.phone.isEmpty
//    }
//
    var body: some View {
        NavigationStack{
            List{
                ForEach(person.indices, id: \.self) { index in
                    Section("姓名")
                    {
                        TextField("Name", text: $person[index].name)
                    }
                    Section("性別")
                    {
                        TextField("Gender", text: $person[index].gender)
                        
                    }
                    Section("年齡")
                    {
                        TextField("Age", value: $person[index].age, formatter: NumberFormatter())
                        
                    }
                    Section("身高")
                    {
                        TextField("CM", value: $person[index].CM, formatter: NumberFormatter())
                        
                    }
                    Section("體重")
                    {
                        TextField("KG", value: $person[index].KG, formatter: NumberFormatter())
                        
                    }
                    Section("電話")
                    {
                        TextField("Phone", text: $person[index].phone)
                        
                    }
                }
                Button("確認")
                {
//                    if(self.name.isEmpty || self.gender.isEmpty || self.age.isEmpty || self.CM.isEmpty || self.KG.isEmpty || self.phone.isEmpty )
//                    {
//                        self.showAlert=true
//                        self.alertMessage="請填寫所有欄位"
//                    }
//                    else
//                    {
//                        person.append((name: self.name, gender: self.gender, age: self.age,CM: self.CM, KG: self.KG, phone: self.phone))
//                        self.showAlert=true
//                        self.alertMessage="註冊成功!"
//                        self.success=true
//
//
//                        if(self.changecheck())
//                        {
//                            self.dismiss()
//                        }
//
//                        if(self.changecheck())
//                        {
//                            self.dismiss()
//                        }
//                    }
                    //關閉畫面
                    Changesuccess = true
                    dismiss()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("修改成功"), message: Text(alertMessage), dismissButton: .default(Text("確定")))
                }
                .navigationTitle(Text("編輯個人資料"))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
