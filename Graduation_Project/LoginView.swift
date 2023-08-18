//0818更新 晏

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
            VStack(spacing: 20)
            {
                VStack(spacing: 20)
                {
                    HStack
                    {
                        Text("帳號")
                        TextField("輸入您的帳號", text: self.$account)
                            .textFieldStyle(.roundedBorder)
                            .font(.title)
                    }
                    HStack
                    {
                        Text("密碼")
                        TextField("輸入您的密碼", text: self.$password)
                            .textFieldStyle(.roundedBorder)
                            .font(.title)
                    }
                }

                NavigationLink(destination: SigninView())
                {
                    Text("註冊")
                }
                    NavigationLink(destination: CheckView(account: self.account, password: self.password))
                    {
                        Text("CONFIRM")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.black)
                            .cornerRadius(10)
                    }

                .padding()
                .navigationTitle(Text("LOG IN"))
                .navigationBarTitleDisplayMode(.large)
                .onAppear
                {
                    self.account=""
                    self.password=""
                }
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
