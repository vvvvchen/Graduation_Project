//
//  Mydata.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import SwiftUI

struct MydataView: View
{
    @Environment(\.dismiss) private var dismiss   //關閉當前畫面
    @Binding var person: [Information]
    
    @State private var showAlert: Bool=false     //警示提示視窗
    @State private var success: Bool=false
    @State private var alertMessage: String=" "  //提示訊息
    
    //MARK: 宣告一個新的儲存更改後的資料
    @State private var tempPerson: [Information] = []
    
    private func changecheck() -> Bool
    {
        for info in tempPerson
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
                
                ForEach(tempPerson.indices, id: \.self) { index in
                    Section("姓名")
                    {
                        TextField("Name", text: self.$tempPerson[index].name)
                    }
                    Section("性別")
                    {
//                        HStack{
//                            Text(self.$tempPerson[index].gender)
//                            Picker(selection:self.$tempPerson[index].gender, label: Text("")) {
//                                Text("男性").tag("男性")
//                                Text("女性").tag("女性")
//                                Text("隱私").tag("隱私")
                                TextField("Gender", text: self.$tempPerson[index].gender)
//                            }
//                            .pickerStyle(.wheel)
//                        }
                    }
                    Section("年齡")
                    {
                        TextField("Age", value: self.$tempPerson[index].age, formatter: NumberFormatter())
                        
                    }
                    Section("身高")
                    {
                        TextField("CM", value: self.$tempPerson[index].CM, formatter: NumberFormatter())
                        
                    }
                    Section("體重")
                    {
                        TextField("KG", value: self.$tempPerson[index].KG, formatter: NumberFormatter())
                        
                    }
                    Section("電話")
                    {
                        TextField("Phone", text: self.$tempPerson[index].phone)
                    }
                }
                Button("確認")
                {
                    if self.changecheck()
                    {
                        tempPerson = person // 保存更改后的值
                        
                        // 在这里可以添加额外的逻辑，例如成功保存后的操作
                        self.success = true
                        
                        self.showAlert = true
                        self.alertMessage = "修改成功"
                    }
                    else
                    {
                        self.showAlert = true
                        self.alertMessage = "請填寫所有欄位"
                    }
                }
                .alert(isPresented: self.$showAlert)
                {
                    Alert(
                        title: Text(alertMessage),
                        dismissButton: self.alertMessage=="請填寫所有欄位" ? .default(Text("確認")):.cancel(Text("確認"))
                        {
                            //
                            for i in 0..<self.person.count
                            {
                                self.person[i]=self.tempPerson[i]
                            }
                            self.dismiss()
                        }
                    )
                }
            }
            
            .navigationTitle(Text("編輯個人資料"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear
            {
                tempPerson = person // 在进入编辑页面时，将原始值保存到临时数组
            }
        }
    }
}
