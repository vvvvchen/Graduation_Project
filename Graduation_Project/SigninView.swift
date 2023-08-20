//
//  SigninView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/20.
//

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

struct SigninView: View
{
    @State private var users: [(account:String,password:String,againpassword:String)] = []
    
    //帳號
    @State private var account: String=""
    //密碼
    @State private var password: String=""
    //密碼驗證
    @State private var againpassword: String=""
    
    @State private var showAlert = false//警示提示視窗
    @State private var alertMessage = " "//提示訊息
    @State private var succcess = false

    //想確認帳號是否被註冊過(以後處理）

    
     //MARK:環境
     @Environment(\.dismiss)private var dismiss
    //驗證密碼兩次是否相同
    
    //MARK:驗證密碼2次是否相同
    private func psscheck() -> Bool
    {
        return !self.password.isEmpty && self.password==self.againpassword
    }
    
        var body: some View
        {
            NavigationStack
            {
                VStack(spacing: 60)
                {
                    //Logo
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 150,height: 150)
                        .padding(.top,-90)
                
                    //Image("our loge")
                    VStack(spacing: 20)
                    {
                        TextField("輸入您的帳號", text: self.$account)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .frame(width: 300, height: 50)
                            .cornerRadius(100)
                        SecureField("輸入您的密碼", text: self.$password)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .frame(width: 300, height: 50)
                            .cornerRadius(100)
                            .lineLimit(10)
                            
                        SecureField("再次輸入密碼", text: self.$againpassword)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .frame(width: 300, height: 50)
                            .cornerRadius(100)
                    }
                    
                    Button("註冊") {
                        if account.isEmpty || password.isEmpty || againpassword.isEmpty {
                            showAlert = true
                            alertMessage = "請填寫所有欄位"
                        } else if psscheck() {
                            users.append(( account: account, password: password, againpassword: againpassword))
                            showAlert = true
                            alertMessage = "註冊成功!"
                            succcess = true
                        } else {
                            showAlert = true
                            alertMessage = "密碼錯誤"
                        }
                    }
                    .foregroundColor(Color.white)
                    .padding(10)
                    .frame(width: 300, height: 50)
                    .background(Color(red: 0.828, green: 0.249, blue: 0.115))
                    .cornerRadius(100)
                    .font(.title3)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(alertMessage),
                              dismissButton: .default(Text("OK")){
                            if(self.psscheck()){
                                self.dismiss()
                            }else{
                            }
                        })
                    }
                }
            }
            .padding()
            .navigationTitle(Text("SIGN IN"))
            .navigationBarTitleDisplayMode(.inline)
            //.onAppear/
        }
    
    struct SigninView_Previews: PreviewProvider {
        static var previews: some View
        {
            SigninView()
        }
    }
}

