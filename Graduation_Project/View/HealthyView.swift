//
//  HealthyView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/24.
//

import SwiftUI

struct HealthyView: View {
    var body: some View {
        VStack(spacing:10)
        {
            //用戶頭像
            HStack
            {
                Spacer()
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 150,height: 150)
                Spacer()
                  
                
                
                 
            }

            //用戶名稱
            Spacer()
            Text("秋雨")
            Spacer()

            VStack
            {
                //MARK: 功能按鈕
                Button
                {

                }
            label:
                {
                    HealthyButton(title: "BMI")
                }
                Spacer()
                Button
                {

                }
            label:
                {
                    HealthyButton(title: "卡路里")
                }
                Spacer()
                Button
                {

                }
            label:
                {
                    HealthyButton(title: "身體素質")
                }
                Spacer()
                Button
                {

                }
            label:
                {
                    HealthyButton(title: "未來展望")
                }
                Spacer()

            }
        }
    }
}

struct HealthyView_Previews: PreviewProvider {
    static var previews: some View {
        HealthyView()
    }
}


