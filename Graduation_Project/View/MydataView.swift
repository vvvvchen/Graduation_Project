//
//  Mydata.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import SwiftUI

struct MydataView: View
{
    @Binding var person: [Information]
    @State private var tempPerson: [Information] = []
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert: Bool=false//警示提示視窗
    @State private var success: Bool=false
    @State private var alertMessage: String=" "//提示訊息
    
    private func changecheck() -> Bool
    {
        for info in person
        {
            if info.name.isEmpty || info.gender.isEmpty || info.age <= 0 || info.CM <= 0 || info.KG <= 0 ||
                info.phone.isEmpty
            {
                return false
            }
        }
        return true
    }
    var body: some View
    {
        NavigationStack
        {
            List
            {
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
                    if changecheck()
                    {
                        tempPerson = person // 保存更改后的值
                        self.showAlert = true
                        self.alertMessage = "修改成功"
                        self.success = true
                        
                    }
                }
                .alert(isPresented: self.$showAlert)
                {
                    Alert(
                        title: Text(alertMessage),
                        dismissButton: .default(Text("返回")){ self.dismiss() }
                    )
                }
            }
            .navigationTitle(Text("編輯個人資料"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear
            {
                tempPerson = person // 在进入编辑页面时，将原始值保存到临时数组
            }
            .onDisappear
            {
                if(!success)
                {
                    person = tempPerson // 如果用户取消或返回，将临时数组的值还原
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                    {
                        self.dismiss()
                    }
                }
            }
        }
    }
}
