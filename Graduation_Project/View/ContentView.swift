//
//  ContentView.swift
//  TopicIM110
//
//  Created by 0822
//

import SwiftUI

struct ContentView: View
{
    @State var isDarkMode: Bool=false
    //TabView選擇的頁面
    @State private var select: Int=1
    @State private var showSide: Bool=false
    
    var body: some View
    {
        ZStack
        {
            TabView(selection: self.$select)
            {
                //MARK: FavoriteView
                FavoriteView(select: self.$select)
                    .tabItem
                    {
                        Image(systemName: "heart.fill")
                        
                        Text("我的最愛")
                        
                    }
                    .tag(0)
                
                //MARK: HomeView
                HomeView(select: self.$select)
                    .tabItem
                    {
                        Image(systemName: "house.fill")
                        
                        Text("主頁")
                    }
                    .tag(1)
                
                //MARK: MemberView
                MemberView(select: self.$select)
                    .tabItem
                    {
                        Image(systemName: "person.fill")
                        
                        Text("會員")
                            .background(self.isDarkMode ? Color("D") : Color("L"))
                    }
                    .tag(2)
            }
            
            //MARK: SideView
            SideView(showSide: self.$showSide)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
                //展開SideView時 禁止TabView和HomeView
                .disabled(self.showSide)
            
            if(self.showSide)
            {
                SideView(showSide: self.$showSide)
                    .background(Color(.systemGray5).opacity(0.1))
                    //返回動畫控制處
                    .onTapGesture
                    {
                        withAnimation(.easeInOut(duration: 0.25))
                        {
                            self.showSide=false
                        }
                    }
            }
            
        }
        .tint(.black)
        //不要顯示NavigationBarTitle
        .navigationBarTitleDisplayMode(.inline)
        .toolbar
        {
            //MARK: 選單
            ToolbarItem(placement: .navigationBarLeading)
            {
                NavigationStack
                {
                    ZStack
                    {
                        Button
                        {
                            //顯示動畫控制處
                            withAnimation(.easeInOut(duration: 0.25))
                            {
                                self.showSide=true
                            }
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
                        .opacity(self.showSide ? 0:1)
                    }
                }
            }
            
            //MARK: 搜尋列
            ToolbarItem(placement: .principal)
            {
                HStack
                {
                    if(self.showSide)
                    {
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(.systemGray5))
                        .frame(maxWidth: self.showSide ? 45:.infinity)
                        .overlay
                    {
                        HStack
                        {
                            Spacer()
                            
                            Image(systemName: "magnifyingglass")
                        }
                        .padding(.horizontal)
                    }
                    .opacity(self.select==1 ? 1:0)
                    
                }
            }
            //MARK: 相機
            ToolbarItem(placement: .navigationBarTrailing)
            {
                if(self.select==1)
                {
                    ZStack
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
                }
                else if(self.select==0)
                {
                    ZStack
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
                else if(self.select==2)
                {
                    ZStack
                    {
                        NavigationLink(destination: MyDataView())
                        {
                            //點擊「編輯」之後要執行的動作
                            Text("編輯")
                                .font(.body)
                                .foregroundColor(.blue)
                            
                        }
                    }
                }
            }
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
