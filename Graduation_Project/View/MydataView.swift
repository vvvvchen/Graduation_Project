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
    //  @State private var height: Int=0
    @State private var temporary: [Any]=["", "", "", "", "",""]
    
    //MARK: List欄位
    private func setListView(index: Int) -> some View
    {
        if(index==0 || (index>=5 && index<=5))
        {
            return AnyView(TextField("", text: Binding<String>(
                get: { self.temporary[index] as? String ?? "" },
                set: { self.temporary[index] = $0 }
            )))
        }
        else if(index==1)
        {
            return AnyView(
                Picker("", selection: Binding<String>(
                    get: { self.temporary[index] as? String ?? "" },
                    set: { self.temporary[index] = $0 }
                ))
                {
                    Text("男性").tag("男性")
                    Text("女性").tag("女性")
                    Text("隱私").tag("隱私")
                }
                    .pickerStyle(.wheel)
                    .frame(width: 330, height: 43)
            )
        }
        else if(index==2)
        {
            return AnyView(
                Picker("", selection: Binding<String>(
                    get: { self.temporary[index] as? String ?? "" },
                    set: { self.temporary[index] = $0 }
                ))
                {
                    ForEach(0..<120)
                    { age in
                        Text("\(age)歲").tag("\(age)歲")
                    }
                }
                    .pickerStyle(.wheel)
                    .frame(width: 330, height: 43)
            )
        }
        else if(index==3)
        {
            return AnyView(
                HStack {
                    TextField("", text: Binding<String>(
                        get: { self.temporary[index] as? String ?? "" },
                        set: { self.temporary[index] = $0 }
                    ))
                    Stepper("", value: Binding<CGFloat>(
                        get: { self.temporary[index] as? CGFloat ?? 0.0 },
                        set: { newValue in
                            if let newValue = newValue as? Any {
                                self.temporary[index] = newValue
                            }
                        }
                    ), in: 0...230)
                }
            )
        }
        else if(index==4)
        {
            return AnyView(
                HStack {
                    TextField("", text: Binding<String>(
                        get: { self.temporary[index] as? String ?? "" },
                        set: { self.temporary[index] = $0 }
                    ))
                    Stepper("", value: Binding<CGFloat>(
                        get: { self.temporary[index] as? CGFloat ?? 0.0 },
                        set: { newValue in
                            if let newValue = newValue as? Any {
                                self.temporary[index] = newValue
                            }
                        }
                    ), in: 0...230)
                })
            
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
        if let name = temporary[0] as? String
        {
            information.name = name
        }
        if let gender = temporary[1] as? String
        {
            information.gender = gender
        }
        if let ageString = temporary[2] as? String, let age = Int(ageString)
        {
            information.age = age
        }
        if let heightString = temporary[3] as? String, let height = Double(heightString)
        {
            information.height = CGFloat(height)
        }
        if let weightString = temporary[4] as? String, let weight = Double(weightString)
        {
            information.weight = CGFloat(weight)
        }
        if let phone = temporary[5] as? String
        {
            information.phone = phone
        }
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(0..<temporary.count, id: \.self)
                {
                    index in
                    Section(setSection(index: index))
                    {
                        setListView(index: index)
                    }
                    .headerProminence(.increased)
                }
                
                Button("確認")
                {
                    Task
                    {
                        await self.updateInformation()
                    }
                    success.toggle()
                }
                .frame(maxWidth: .infinity)
            }
            .font(.title3)
            .alert("修改成功", isPresented: $success)
            {
                Button("確認")
                {
                    dismiss()
                }
            }
        }
        .navigationTitle("編輯個人資料")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear
        {
            temporary[0] = information.name
            temporary[1] = information.gender
            temporary[2] = "\(information.age)"
            temporary[3] = "\(information.height)"
            temporary[4] = "\(information.weight)"
            temporary[5] = information.phone
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
