//.foregroundColor(Color(red: 0.995, green: 0.477, blue: 0.33))深橘色
//.foregroundColor(Color(red: 0.994, green: 0.689, blue: 0.418))淺橘色
//.foregroundColor(Color(red: 0.983, green: 0.821, blue: 0.411))黃色
//.foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))綠色
//


import SwiftUI

//登入畫面
struct LoginView: View
{

    //AppStorage logIn -> Bool
    @AppStorage("logIn") private var logIn: Bool = false
    @AppStorage("userImage") private var userImage: Data?
    
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
    //手機儲存「記住我」狀態
    @State private var remember: Bool=false //之後要改
    @State private var account: (String, String)=("", "")
    
    //MARK: 檢查帳密
    private func checkStatus()
    {
        if(self.account.0=="14" && self.account.1=="123")
        {
            withAnimation(.easeInOut)
            {
                self.logIn=true
            }
        }
        else
        {
        }
    }
    
    var body: some View
    {
        NavigationStack
        {
            if(self.logIn)
            {
                ContentView().transition(.opacity)
            }
            else
            {
                VStack(spacing: 20)
                {
                    //MARK: 頭像
                    if let userImage=self.userImage,
                       let image=UIImage(data: userImage)
                    {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .background(.gray)
                            .clipShape(Circle())
                            .padding(.bottom, 50)
                    }
                    else
                    {
                        Circle()
                            .fill(.gray)
                            .scaledToFit()
                            .frame(width: 150)
                            .padding(.bottom, 50)
                    }
                    
                    VStack(spacing: 30)
                    {
                        //MARK: 帳號
                        TextField("帳號...", text: self.$account.0)
                            .scrollContentBackground(.hidden)
                            .padding()
                            .background(Color(.systemGray5))
                            .clipShape(Capsule())
                        
                        //MARK: 密碼
                        SecureField("密碼...", text: self.$account.1)
                            .scrollContentBackground(.hidden)
                            .padding()
                            .background(Color(.systemGray5))
                            .clipShape(Capsule())
                    }
                    .font(.title3)
                    
                    NavigationLink(destination:SigninView())
                    {
                        Text("尚未註冊嗎？請點擊我")
                            .font(.body)
                            .foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))
                            .colorMultiply(.gray)
                    }
                    HStack
                    {
                        //MARK: 記住我
                        HStack
                        {
                            Circle()
                                .fill(Color(.systemGray6))
                                .frame(width: 20)
                                .overlay
                                {
                                    Circle()
                                        .fill(.blue)
                                        .padding(5)
                                        .opacity(self.remember ? 1:0)
                                }
                                .onTapGesture
                                {
                                    withAnimation(.easeInOut)
                                    {
                                        self.remember.toggle()
                                    }
                                }
                            
                            Text("記住我").font(.callout)
                        }
                        
                        Spacer()
                        
                        //MARK: 忘記密碼
                        Button("忘記密碼？")
                        {
                            self.forget.toggle()
                        }
                        .font(.callout)
                    }
                    .sheet(isPresented: self.$forget)
                    {
                        ForgetPasswordView()
                            .presentationDetents([.medium])
                            .presentationCornerRadius(30)
                    }
                    //MARK: 登入
                    Button
                    {
                        self.checkStatus()
                    }
                    label:
                    {
                        Text("登入")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.828, green: 0.249, blue: 0.115))
                            .clipShape(Capsule())
                    }
                    
                    //MARK: Circle
                    HStack
                    {
                        ForEach(0..<3)
                        {index in
                            Circle()
                                .fill(Color(.systemGray3))
                                .scaledToFit()
                                .frame(height: 50)
                            
                            if(index<2)
                            {
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.horizontal, 50)
                .transition(.opacity)
            }
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
