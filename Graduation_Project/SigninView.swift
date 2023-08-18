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
    
    var body: some View
    {
        NavigationStack
        {
            Circle()
                .foregroundColor(.gray)
                .frame(width: 150,height: 150)
                .padding()
                //Image("our loge")
            VStack(spacing: 60)
            {
                VStack(spacing: 20)
                {
                    TextField("輸入您的帳號", text: self.$account)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .frame(width: 300, height: 50)
                        .cornerRadius(100)
                    TextField("輸入您的密碼", text: self.$password)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .frame(width: 300, height: 50)
                        .cornerRadius(100)
                    
                    TextField("再次輸入密碼", text: self.$password)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .frame(width: 300, height: 50)
                        .cornerRadius(100)

                }
                    NavigationLink(destination: LoginView())
                    {
                        Text("點選往返登入畫面，進行登入動作")
                            .foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))
                    }
                }
            }
            .padding()
            .navigationTitle(Text("SIGN IN"))
            .navigationBarTitleDisplayMode(.inline)
            //.onAppear/
    }
}
struct SigninView_Previews: PreviewProvider {
    static var previews: some View
    {
    SigninView()
    }
}
