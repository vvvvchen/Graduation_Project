//
//  SwiftUIView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/24.
//

import SwiftUI

struct SwiftUIView: View
{
    //是否顯示底部的彈出式圖
    @State private var showSheet: Bool=false
    //控制彈出式圖是否在頂部
    @State private var up: Bool=false
    //當前拖動垂直位置
    @State private var drag: CGFloat=0
    //最終位置（上方或下方）用於隱藏或顯示彈出式視圖
    @State private var end: CGFloat=0
    //起始位置，用於恢復視圖位置
    @State private var start: CGFloat=0
    //存儲被點擊按鈕的標題
    @State private var selectedTitle: String = ""
    
    
    //標題陣列
    private let title: [String]=["番茄炒蛋", "荷包蛋", "炒高麗菜", "冰糖肘子"]
    private let englishtitle: [String]=["Tomato Scrambled Eggs", "Poached Eggs", "Fried Cabbage", "Pork Joint Stewed With Rock Sugar"]
    
    
    var body: some View
    {
        NavigationStack
        {
            VStack(spacing: 50)
            {
                //遍歷標題數組，為每個標題創建按鈕
                ForEach(self.title, id: \.self)
                {
                    index in
                    Button(action:
                            {
                        //點擊按鈕時顯示彈出視圖，並將選定的標題存儲到selectedTitle
                        self.selectedTitle = index
                        //點擊按鈕時顯示或隱藏彈出式視圖
                        self.showSheet.toggle()
                    }){
                        Text(index)
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(width: 300)
                            .background(.black)
                            .cornerRadius(10)
                    }
                }
            }
            //彈出式視圖
            .sheet(isPresented: self.$showSheet)
            {
                NavigationStack
                {
                    ZStack(alignment: .top)
                    {
                        //背景色
                        Color(.systemGray6).ignoresSafeArea()
                        
                        VStack(spacing: 0)
                        {
                            Rectangle()
                                .fill(.indigo.gradient)
                            //頭部顏色區域
                                .frame(height: 300)
                            
                            VStack
                            {
                                Text(selectedTitle)
                                    .bold()
                                    .font(.largeTitle)
                                
                                Text(englishtitle[title.firstIndex(of: selectedTitle) ?? 0])
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .offset(y: self.start)
                            .offset(y: self.drag)
                            .offset(y: self.end)
                            //拖動手勢處理
                            .gesture(
                                DragGesture()
                                    .onChanged {value in
                                        withAnimation(.easeInOut)
                                        {
                                            self.drag=value.translation.height
                                        }
                                    }
                                    .onEnded
                                {
                                    value in
                                    withAnimation(.spring())
                                    {
                                        //根據拖動距離決定最終位置
                                        self.end=self.drag <= -100 ? -150:0
                                        self.drag=0
                                    }
                                }
                            )
                            //MARK: 測試文本
                            ScrollView(.vertical, showsIndicators: false) {
                                Text("This is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.\nThis is an additional text.")
                                    .font(.system(size:20))
                                    .foregroundColor(.black)
                                    .padding(.bottom, 20)
                            }
                        }
                    }
                    //導航欄標題
                    .navigationBarTitleDisplayMode(.inline)
                }
                //彈出視圖内容交互方式
                .presentationContentInteraction(.scrolls)
                .presentationCornerRadius(20)
                //彈出視圖拖動指示器
                .presentationDragIndicator(.visible)
            }
        }
    }
}
struct SwiftUIView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SwiftUIView()
    }
}
