//0818更新 晏
//.foregroundColor(Color(red: 0.995, green: 0.477, blue: 0.33))深橘色
//.foregroundColor(Color(red: 0.994, green: 0.689, blue: 0.418))淺橘色
//.foregroundColor(Color(red: 0.983, green: 0.821, blue: 0.411))黃色
//.foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))綠色

import SwiftUI

struct LoginView: View
    {
    @State private var goTo: Bool=false
    @State private var account: String=""
    @State private var password: String=""
    
    private func check() -> Bool
    {
        return self.account=="1234" && self.password=="4321"
    }
    
    var body: some View
    {
        NavigationStack
        {
            VStack(spacing:60)
            {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 150,height: 150)
                    .padding(.top,50)
                
                VStack(spacing: 20)
                {
                    TextField("Account", text: $account)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(100)
                        .padding(10)
                        
                    SecureField("Password", text: $password)
                        .padding(10)
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(100)
                    
                    NavigationLink(destination: SigninView())
                    {
                        Text("尚未註冊嗎 ？請點擊我")
                            .foregroundColor(Color(red: 0.574, green: 0.609, blue: 0.386))
                    }
                    
                    NavigationLink(destination: CheckView(account: self.account, password: self.password))
                    {
                        Text("登入")
                            .foregroundColor(Color.white)
                            .padding(10)
                            .frame(width: 300, height: 50)
                            .background(Color(red: 0.828, green: 0.249, blue: 0.115))
                            .cornerRadius(100)
                            .font(.title3)

                    }
                }
                    HStack(spacing: 20)
                    {
                        Spacer()
                        Circle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 50,height: 50)
                        Spacer()
                        Circle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 50,height: 50)
                        Spacer()
                        Circle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 50,height: 50)
                        Spacer()
                    }
                    Spacer()

                
            }
            //.padding()
            .navigationTitle(Text("LOG IN"))
            .navigationBarTitleDisplayMode(.inline)

            .onAppear
            {
                self.account=""
                self.password=""
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
