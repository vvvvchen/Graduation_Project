//
//  ContentView.swift
//  TopicIM110
//
//  Created by 0822
//

import SwiftUI

struct ContentView: View
{
    //TabView選擇的頁面
    @State private var select: Int=1
    @State private var showSide: Bool=false
    @State var isDarkMode: Bool = false
    
    var body: some View
    {
        ZStack
        {
            TabView(selection: self.$select)
            {
                FavoriteView(select: self.$select)
                    .tabItem
                {
                    Image(systemName: "heart.fill")
                    
                    Text("我的最愛")
                    
                }
                .tag(0)
                
                HomeView(select: self.$select)
                    .tabItem
                {
                    Image(systemName: "house.fill")
                    
                    Text("主頁")
                }
                .tag(1)
                
                MemberView(select: self.$select)
                    .tabItem
                {
                    Image(systemName: "person.fill")
                    
                    Text("會員")
                        .background(isDarkMode ? Color("D") : Color("L"))
                }
                .tag(2)
            }
            
            SideView(showSide: self.$showSide)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            // 在展開SideView時禁止使用TabView和HomeView
                .disabled(showSide)
            
            if showSide {
                SideView(showSide: self.$showSide)
                    .background(Color(.systemGray5).opacity(0.1))
                //返回動畫控制處
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            self.showSide = false
                        }
                    }
            }
            
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
                            //顯示動畫控制處
                            withAnimation(.easeInOut(duration: 0.25)) {
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
            //搜尋列
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
                    .opacity(self.select == 1 ? 1 : 0)
                    
                }
            }
            //照相
            ToolbarItem(placement: .navigationBarTrailing)
            {
                if(self.select==1)
                {
                    ZStack{
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
                else if self.select==0
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
                else if self.select==2
                {
                    ZStack
                    {
                        NavigationLink(destination: MydataView())
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

//MARK: SideView

struct SideView: View
{
    @Binding var showSide: Bool
    @AppStorage("colorScheme") private var colorScheme: Bool=false
    @State var isDarkMode: Bool = false
    
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                Rectangle()
                    .foregroundColor(Color(red: 0.994, green: 0.689, blue: 0.418))
                    .frame(maxHeight: .infinity)
                //true點按不會收回
                    .onTapGesture {
                        self.showSide=true
                    }
                //MARK: 深色模式
                VStack
                {
                    HStack
                    {
                        HStack
                        {
                        }
                        .padding(.horizontal,25)
                        .padding(.vertical,15)
                        Circle()
                            .foregroundStyle(
                                isDarkMode
                                ? Color.white
                                : Color.orange
                            )
                            .frame(width: 140, height: 140)
                            .overlay(alignment: .topTrailing)
                        {
                            if !isDarkMode
                            {
                                
                            }
                            else
                            {
                                Image(systemName: "sun.max.fill")
//                                Circle()
//                                    .foregroundColor(Color("L"))
//                                    .frame(width: 105, height: 105)
//                                    .offset(x:10, y:5)
                            }
                        }
                        Toggle("",isOn: self.$colorScheme)
                            .toggleStyle(CustomToogleStyle())
                            .padding()
                    }
                    .cornerRadius(20)
                    .frame(width:290,height: 25)
                    .shadow(color: .black.opacity(0.2), radius: 10,x:10,y:10)
                    .padding(.top,-200)
                    
                    NavigationStack
                    {
                        NavigationLink(destination: MydataView())
                        {
                            Text("過往食譜")
                        }
                        NavigationLink(destination: MydataView())
                        {
                            Text("食材紀錄")
                        }
                        NavigationLink(destination: MydataView())
                        {
                            Text("登出")
                        }
                    }
                }
                .offset(x:self.showSide ? geometry.size.width * 0.15 : geometry.size.width * -1)
            }
            .ignoresSafeArea(.all)
            .offset(x:self.showSide ? geometry.size.width * -0.3 : geometry.size.width * -1)
        }
        .preferredColorScheme(self.colorScheme ? .light:.dark)
    }
    
}
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
