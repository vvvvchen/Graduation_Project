//
//  ForumView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/9/14.
//

import SwiftUI

struct ForumView: View
{
    @State private var isSheetPresented = false
    @State private var buttonOffset: CGSize = .zero
    @State private var isDragging = false
    @State private var buttonPosition: CGPoint = CGPoint(x: 350, y: 600)

    var body: some View
    {
        ZStack
        {
            // MARK: 使用者發布文章區塊
            Button(action:
                    {
                isSheetPresented = true
            }) {
                ZStack
                {
                    Circle()
                        .fill(Color(.systemOrange))
                        .frame(width: 80, height: 80)
                        .offset(buttonOffset)
                    
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                        .offset(buttonOffset)
                }
            }
            .offset(buttonOffset)

            // MARK: 發布文章按鈕


        }
        .sheet(isPresented: $isSheetPresented)
        {
            Text("This is a sheet.")
        }
        
        .gesture(
            // 手勢類型，會在用戶開始拖動時觸發
            DragGesture()
                // 用戶拖動發生變化時，會執行括號中的代碼
                .onChanged
            {
                value in
                    // 把按鈕偏移位置設置為當前拖動的位移
                    buttonOffset = value.translation
                    // 按鈕正在被拖動
                    isDragging = true
                }
                .onEnded
            {
                value in
                    // 按鈕停止拖動
                    isDragging = false
                    // 更新按鈕位置(限制按鈕可以移動到哪裡)
                    let newX = min(max(45, buttonPosition.x + value.translation.width), 350)
                    let newY = min(max(50, buttonPosition.y + value.translation.height), 600)

                    withAnimation
                {
                        buttonPosition = CGPoint(x: newX, y: newY)
                    }
                    // 重置按鈕偏移
                    buttonOffset = .zero
                }
        )
        // 用保存的位置來設置按鈕位置
        .position(buttonPosition)
    }
}

struct ForumView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ForumView()
    }
}
