//
//  HealthyView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/24.
//

import SwiftUI

struct HealthyView: View
{
    @State private var showBMIView = false
    @State private var showKcalView = false
    var body: some View
    {
        VStack(spacing:40)
        {
            //用戶頭像
            HStack
            {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 150,height: 150)
            }

            //用戶名稱
            Text("秋雨")
            VStack(spacing:50)
            {
                //MARK: 功能按鈕
                NavigationLink(destination: BMIView(), isActive: $showBMIView) {
                    Button
                    {
                        showBMIView = true
                    }
                label:
                    {
                        HealthyButton(title: "BMI")
                    }
                }

                NavigationLink(destination: KcalView(), isActive: $showKcalView) {
                    Button
                    {
                        showKcalView = true
                    }
                label:
                    {
                        HealthyButton(title: "卡路里")
                    }
                }
                Button
                {

                }
            label:
                {
                    HealthyButton(title: "身體素質")
                }
                Button
                {

                }
            label:
                {
                    HealthyButton(title: "未來展望")
                }

            }

            Spacer()
        }
    }
}

struct HealthyView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HealthyView()
    }
}
