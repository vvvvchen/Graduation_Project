//
//  BMIView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/24.
//

import SwiftUI

struct BMIView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bmiResult: Double = 0.0

    var body: some View
    {
        VStack(spacing: 30)
        {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 300, height: 200)
                .cornerRadius(10)

            Text("BMI計算")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)

            VStack(spacing: -5)
            {

                TextField("請輸入身高（公分）", text: $height)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)

                TextField("請輸入體重（公斤）", text: $weight)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }

            Button("計算BMI")
            {
                if let heightValue = Double(height), let weightValue = Double(weight) {
                    let bmi = weightValue / ((heightValue / 100) * (heightValue / 100))
                    bmiResult = bmi

                    // 清空输入框
                    height = ""
                    weight = ""
                }
            }
            .padding()

            if bmiResult > 0
            {
                Text("你的BMI值為：\(bmiResult, specifier: "%.2f")")
                    .font(.headline)
            }
        }
    }
}

struct BMIView_Previews: PreviewProvider
{
    static var previews: some View
    {
        BMIView()
    }
}
