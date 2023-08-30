//
//  Mydata.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import SwiftUI

struct MydataView: View
{
    @Binding var information: Information

    @Environment(\.dismiss) private var dismiss

    @State private var success: Bool=false
    @State private var temporary: [String]=["", "", "", "", "",""]

    //MARK: List欄位
    private func setListView(index: Int) -> some View
    {
        if(index==0 || (index>=2 && index<=5))
        {
            return AnyView(TextField("", text: self.$temporary[index]))
        }
        else if(index==1)
        {
            return AnyView(
                Picker("", selection: self.$temporary[index])
                {
                    Text("男性").tag("男性")
                    Text("女性").tag("女性")
                    Text("隱私").tag("隱私")
                }
                .pickerStyle(.wheel)
                .frame(height: 100)
            )
        }
        else
        {
            return AnyView(Text("ERROR"))
        }
    }
    //MARK: Section欄位
    private func setSection(index: Int) -> String
    {
        switch(index)
        {
            case 0:
                return "名字"
            case 1:
                return "性別"
            case 2:
                return "年齡"
            case 3:
                return "身高"
            case 4:
                return "體重"
            case 5:
                return "手機號碼"
            default:
                return ""
        }
    }
    //MARK: 更新資訊
    private func updateInformation() async
    {
        self.information.name=self.temporary[0]
        self.information.gender=self.temporary[1]
        self.information.age=(Int(self.temporary[2]) ?? self.information.age)
        self.information.height=CGFloat(Double(self.temporary[3]) ?? self.information.height)
        self.information.weight=CGFloat(Double(self.temporary[4]) ?? self.information.weight)
        self.information.phone=self.temporary[5]
    }
    var body: some View
    {
        ZStack
        {
            //MARK: List
            List
            {
                ForEach(0..<self.temporary.count, id: \.self)
                {index in
                    Section(self.setSection(index: index))
                    {
                        self.setListView(index: index)
                    }
                    .headerProminence(.increased)
                }

                //MARK: 確認按鈕
                Button("確認")
                {
                    Task
                    {
                        await self.updateInformation()
                    }

                    self.success.toggle()
                }
                .frame(maxWidth: .infinity)
            }
            .font(.title3)
            .alert("修改成功", isPresented: self.$success)
            {
                Button("確認")
                {
                    self.dismiss()
                }
            }
        }
        .navigationTitle("編輯個人資料")
        .navigationBarTitleDisplayMode(.inline)
        //MARK: 初始化資訊
        .onAppear
        {
            self.temporary[0]=self.information.name
            self.temporary[1]=self.information.gender
            self.temporary[2]="(self.information.age)"
            self.temporary[3]="(self.information.height)"
            self.temporary[4]="(self.information.weight)"
            self.temporary[5]=self.information.phone
        }
    }
}

struct MydataView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationStack
        {
            MydataView(
                information: .constant(
                    Information(
                        name: "Justin",
                        gender: "男性",
                        age: 21,
                        height: 170,
                        weight: 53,
                        phone: "0800012000"
                    )
                )
            )
        }
    }
}
