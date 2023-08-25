//0820更新 晏
//.foregroundColor(Color(red: 0.995, green: 0.477, blue: 0.33))深橘色
//.foregroundColor(Color(red: 0.994, green: 0.689, blue: 0.418))淺橘色
//.foregroundColor(Color(red: 0.983, green: 0.821, blue: 0.411))黃色
//.foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))綠色
//

import SwiftUI

//登入畫面
struct LoginView: View
{
    //手機儲存「記住我」狀態
    @AppStorage("rememberMe") private var rememberMe: Bool=false
    //AppStorage logIn -> Bool
    @AppStorage("logIn") private var logIn: Bool = false
    
    //let定義
    private let savedAccount = UserDefaults.standard.string(forKey: "savedAccount")
    private let savedPassword = UserDefaults.standard.string(forKey: "savedPassword")
    
    //開啟「忘記密碼」的狀態
    @State private var forget: Bool=false
    //帳號密碼審核狀態
    @State private var valid: Bool=false
    //帳號及密碼
    @State private var information: (String, String)=("", "")
    //警示提示視窗
    @State private var showAlert = false
    //提示訊息
    @State private var alertMessage = " "
    
    private func checkInformation() -> Bool
    {
        return self.information.0=="14" && self.information.1=="123"
    }
    
    var body: some View
    {
        //NavigaitonStack包裝在最外面
        NavigationStack
        {
            //MARK: 帳密不合格
            if(!self.valid)
            {
                //Logo
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 150,height: 150)
                    .padding(.top,50)
                
                VStack(spacing: 60)
                {
                    VStack(spacing: 30)
                    {
                        //MARK: 輸入帳號
                        TextField("Account", text: self.$information.0)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(100)
                            .padding(10)
                        
                        //MARK: 輸入密碼
                        SecureField("Password", text: self.$information.1)
                            .padding(10)
                            .frame(width: 300, height: 50)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(100)
                        
                        //MARK: SignInView
                        NavigationLink(destination: SigninView())
                        {
                            Text("尚未註冊嗎 ？請點擊我")
                                .foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))
                        }
                        
                        //MARK: 協助功能
                        HStack
                        {
                            Button
                            {
                                //點擊「記住我」之後要執行的動作
                                withAnimation(.easeInOut)
                                {
                                    self.rememberMe.toggle()
                                }
                            }
                            label:
                            {
                                HStack(spacing: 5)
                                {
                                    Circle()
                                        .foregroundColor(Color(.systemGray5))
                                        .frame(width: 15)
                                        //根據點擊狀態點擊更新畫面
                                        .overlay
                                        {
                                            Circle()
                                                .foregroundColor(.blue)
                                                .padding(3)
                                                .opacity(self.rememberMe ? 1:0)
                                        }
                                    
                                    Text("記住我").foregroundColor(.black)
                                }
                            }
                            
                            Spacer()
                            
                            //MARK: 忘記密碼
                            Button
                            {
                                //點擊「忘記密碼？」之後要執行的動作
                                self.forget.toggle()
                            }
                            label:
                            {
                                Text("忘記密碼？")
                            }
                        }
                        .font(.body)
                        
                        //MARK: 一般登入
                        Button
                        {
                            if(self.checkInformation())
                            {
                                withAnimation(.easeInOut)
                                {
                                    self.valid.toggle()
                                    
                                    if(self.rememberMe)
                                    {
                                        // 將帳號密碼儲存到UserDefaults
                                        UserDefaults.standard.set(self.information.0, forKey: "savedAccount")
                                        UserDefaults.standard.set(self.information.1, forKey: "savedPassword")
                                    }
                                    self.logIn = true
                                }
                            }
                            else
                            {
                                self.showAlert=true
                                self.alertMessage="登入失敗！請確認帳號密碼是否正確"
                            }
                        }
                        label:
                        {
                            Text("登入")
                                .foregroundColor(Color.white)
                                .padding(10)
                                .frame(width: 300, height: 50)
                                .background(Color(red: 0.828, green: 0.249, blue: 0.115))
                                .cornerRadius(100)
                                .font(.title3)
                        }
                        
                        HStack(spacing: 20)
                        {
                            // Apple
                            
                            Spacer()
                            
                            Circle()
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: 50,height: 50)
                            //Facebook
                            
                            Spacer()
                            
                            Circle()
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: 50,height: 50)
                            
                            //Google
                            
                            Spacer()
                            
                            Circle()
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: 50,height: 50)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .padding()
                .transition(.opacity)
            }
            //MARK: 帳密合格
            else
            {
                //MARK: 首頁
                ContentView().transition(.opacity)
            }
        }
        .ignoresSafeArea(.all)
        // MARK: 忘記密碼
        .sheet(isPresented: self.$forget)
        {
            ForgetPasswordView()
                .presentationDetents([.medium])
                .presentationCornerRadius(30)
        }
        .onAppear
        {
            if(self.rememberMe),
              let savedAccount=self.savedAccount,
              let savedPassword=self.savedPassword
            {
                self.information.0=savedAccount
                self.information.1=savedPassword
                self.valid=true
            }
        }
        
        // MARK: 登入失敗
        .alert(isPresented: self.$showAlert)
        {
            Alert(
                title: Text("提示"),
                message: Text(alertMessage),
                dismissButton: .default(Text("確定"))
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoginView()
    }
}
