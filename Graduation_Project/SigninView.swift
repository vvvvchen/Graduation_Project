//
//  SigninView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/18.
//

import SwiftUI

struct SigninView: View {
    @State private var account: String=""
    @State private var password: String=""
    @State private var goTo : Bool=false
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Circle()
                    .scale(0.2)
                    .foregroundColor(.gray.opacity(0.15))
                
                //Image("our loge")
                
                VStack(spacing: 20)
                {
                    VStack(spacing: 20)
                    {
                        HStack
                        {
                            Text("帳號")
                            TextField("輸入您的帳號", text: self.$account)
                        }
                        HStack
                        {
                            Text("密碼")
                            TextField("輸入您的密碼", text: self.$password)
                        }
                        HStack
                        {
                            Text("密碼")
                            TextField("再次輸入密碼", text: self.$password)
                                
                        }
                        .textFieldStyle(.roundedBorder)
                        .font(.title)
                    }
                    NavigationLink(destination: LoginView())
                    {
                        Text("請返往登入畫面，進行登入動作")
                    }
                    
                }
                
            }
        }
            
        .padding()
        .navigationTitle(Text("SIGN IN"))
        .navigationBarTitleDisplayMode(.large)
        //.onAppear
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
