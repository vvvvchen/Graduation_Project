//
//  ContentView.swift
//  TopicIM110
//
//  Created by 0820
//

import SwiftUI

struct ContentView: View
{
    //TabView選擇的頁面
    @State private var select: Int=1
    @State private var showSide: Bool=false
    
    var body: some View
    {
        ZStack
        {
            TabView(selection: self.$select)
            {
                Favorite(select: self.$select)
                    .tabItem
                {
                    Image(systemName: "heart.fill")
                    
                    Text("我的最愛")
                }
                .tag(0)
                
                Home(select: self.$select)
                    .tabItem
                {
                    Image(systemName: "house.fill")
                    
                    Text("主頁")
                }
                .tag(1)
                
                Member(select: self.$select)
                    .tabItem
                {
                    Image(systemName: "person.fill")
                    
                    Text("會員")
                }
                .tag(2)
            }
            SideView(showSide: self.$showSide)
        }
        .tint(.black)
        //不要顯示NavigationBarTitle
        .navigationBarTitleDisplayMode(.inline)
        //MARK: Toolbar

        .toolbar
        {
            //選單
                ToolbarItem(placement: .navigationBarLeading)
                {
                    NavigationStack{
                    ZStack{
                        
                    Button
                    {
                        self.showSide=true
                    }
                label:
                    {
                        VStack(spacing: 6)
                        {
                            ForEach(0..<3)
                            {_ in
                                Capsule(style: .continuous)
                                    .fill(.black)
                                    .frame(width: 30, height: 3)
                            }
                        }
                    }
                    .opacity(self.select==1 ? 1:0)
                }
                    }
                }
                //搜尋列
                ToolbarItem(placement: .principal)
                {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(.systemGray5))
                        .overlay
                        {
                            HStack
                            {
                                Image(systemName: "magnifyingglass")
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .opacity(self.select==1 ? 1:0)
                }
                
                //照相
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    if(self.select==1)
                    {
                        Button
                        {
                            //照相功能
                        }
                    label:
                        {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .foregroundColor(.black)
                        }
                    }
                    else if(self.select==0)
                    {
                        Button
                        {
                            //點擊「刪除紀錄」之後要執行的動作
                        }
                    label:
                        {
                            Text("刪除紀錄")
                                .font(.body)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            
        }
    }


struct SideView: View {
    @Binding var showSide: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack
            {
                Rectangle()
                    .fill(.green)
                    .frame(maxHeight: .infinity)
                    .onTapGesture {
                        self.showSide=false
                    }
            }
            .ignoresSafeArea()
            .offset(x:self.showSide ? geometry.size.width * -0.5 : -400)
            .animation(.easeInOut, value: self.showSide)
        }
    }
}


struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
