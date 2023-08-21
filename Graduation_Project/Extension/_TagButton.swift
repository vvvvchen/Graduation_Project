//
//  _TagButton.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/21.
//

import SwiftUI

extension View
{
    //紀錄用戶身體健康指標標籤
    func _Tag1Button(image: String, title: String, fore: Color, back: Color) -> some View
    {
        HStack
        {
            Image(image)
            
            Text("\(title)")
                .bold()
                .font(.system(size: 12)) // 設定字體大小為 12
                .foregroundColor(fore)
                .padding()
                .frame(width:90 ,height:25 )
                .background(back)
                .cornerRadius(100)
                .shadow(color: Color(.systemGray3), radius: 5, y: 5)
        }
    }
    
    //用戶成就標籤
    func _Tag2Button(image: String, title: String, fore: Color, back: Color) -> some View
    {
        HStack(spacing: 10) {
            Image(systemName: image) // 使用系統圖標
                .foregroundColor(fore)
                .font(.title3) // 使用系統字體大小

            Text("\(title)  成就")
                .bold()
                .font(.system(size: 12)) // 設定字體大小為 12
                .foregroundColor(fore)
                .padding()
                .frame(width: 160, height: 25)
                .background(back)
                .cornerRadius(100)
                .shadow(color: Color(.systemGray3), radius: 5, y: 5)
        }
        .frame(maxWidth: .infinity)
    }
}
