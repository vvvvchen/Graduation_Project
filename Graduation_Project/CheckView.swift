//0818更新 晏

import SwiftUI

struct CheckView: View
{
    //MARK: ehuewhriuewhriewrh
    @Environment(\.dismiss) private var dismiss
    
    @State private var confirm: Bool=false
    @State private var showError: Bool=false
    
    let account: String
    let password: String
    
    var body: some View
    {
        NavigationStack
        {
            ZStack
            {
                if(!self.confirm)
                {
                    ProgressView()
                        .navigationTitle("CHECKING...")
                        .transition(.opacity.animation(.easeInOut))
                }
                else
                {
                    DoubleTabView()
                        .navigationTitle("WELCOME!")
                        .transition(.opacity.animation(.easeInOut))
                }
            }
            .onAppear
            {
                if(self.account=="1234" && self.password=="4321")
                {
                    self.confirm=true
                }
                else
                {
                    self.showError.toggle()
                }
            }
            .alert("Invalid account or password.", isPresented: self.$showError)
            {
                Button("DISMISS")
                {
                    self.dismiss()
                }
            }
        }
    }
}
