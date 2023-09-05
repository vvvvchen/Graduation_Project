import SwiftUI

struct SwiftUIView: View
{
   //设置最小高度和最大高度
   private let minHeight: CGFloat = 60
   private let maxHeight: CGFloat = 200
   
   //用於控制是否顯示標題
   @State private var showTitle: Bool = false
   //用於控制是否顯示彈出式視圖
   @State private var showSheet: Bool = false
   //用於存儲用戶選擇的標題
   @State private var selectedTitle: String = ""
   
   
   //標題陣列
   private let title: [String] = ["番茄炒蛋", "荷包蛋", "炒高麗菜", "冰糖肘子"]
   
   var body: some View
   {
      NavigationStack
      {
         ScrollView(.vertical, showsIndicators: false)
         {
            VStack(spacing: 50)
            {
               //遍歷標題數組，為每個標題創建按鈕
               ForEach(self.title, id: \.self)
               {
                  index in
                  Button(action:
                           {
                     //點擊按鈕時更新選定的標題和顯示sheet的狀態
                     self.selectedTitle = index
                     self.showSheet = true
                  }) {
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
         }
         
         //MARK: 彈出式視圖
         .sheet(isPresented: self.$showSheet)
         {
            NavigationStack
            {
               ScrollView
               {
                  LazyVStack
                  {
                     ZStack
                     {
                        Rectangle()
                           .frame(width: 500, height: maxHeight)
                           .foregroundColor(.blue)
                        
                        Text(selectedTitle)
                           .bold()
                           .font(.system(size: 28))
                     }
                     
                     //用於生成數字 1 到 20，個循環將遍歷這些數字並根據條件分別創建不同的視圖。
                     ForEach(1..<21)
                     {
                        index in
                        //如果內容小於等於11
                        if (index <= 11)
                        {
                           //顯示
                           Text("\(index)")
                              .font(.title)
                              .padding(.vertical)
                              .frame(maxWidth: .infinity)
                        }
                        //如果內容大於12
                        else
                        {
                           Text("\(index)")
                              .font(.title)
                              .padding(.vertical)
                              .frame(maxWidth: .infinity)
                              .onAppear {
                                 withAnimation(.easeInOut)
                                 {
                                    self.showTitle = true
                                 }
                              }
                              .onDisappear {
                                 withAnimation(.easeInOut)
                                 {
                                    self.showTitle = false
                                 }
                              }
                        }
                     }
                  }
                  .background(Color(.systemGray6))
               }
               .background(Color(.systemGray2))
               .navigationTitle(self.showTitle ? selectedTitle : "")
               .navigationBarTitleDisplayMode(.inline)
            }
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
