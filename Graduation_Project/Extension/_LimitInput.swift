//
//  limitInput.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/21.
//

import SwiftUI

//須額外新增名為：“extension”的資料夾，存放自建方法；func limitInput限制文字字數，
//使用方法.limitInput(text: $account, max: 12,min: 4) // 限制最小字數為 4，最大字數為 12
//.limitInput(text: $account, max: 20)只限制最大值 不限制最小值
//.lineLimit(10)變成限制文本行數

import SwiftUI
//須額外新增名為：“extension”的資料夾，存放自建方法；func limitInput限制文字字數，使用方法“.lineLimit(自訂字數)”
extension View
{
    func limitInput(text: Binding<String>, max: Int) -> some View
    {
        self.modifier(TextLimit(text: text, max: max))
    }
}
struct TextLimit: ViewModifier
{
    @Binding var text: String
    
    var max: Int
    //舉例：Text("").font(.largeTitle)
    func body(content: Content) -> some View
    {
        content.onReceive(self.text.publisher.collect())
        {
            text=String($0.prefix(max))
        }
    }
}
