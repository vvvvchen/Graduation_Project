//0818更新 晏

import SwiftUI

struct DoubleTabView: View
{
    var body: some View
    {
        NavigationStack
        {
            TabView
            {
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack
                    {
                        ForEach(0..<10)
                        {_ in
                            HStack
                            {
                                ForEach(0..<3)
                                {_ in
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.gray)
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }
                    }
                }
                .tabItem
                {
                    Label("HOME", systemImage: "house")
                }
                
                ZStack
                {
                    List
                    {
                        ForEach(1..<21)
                        {index in
                            NavigationLink(destination: ProgressView())
                            {
                                Text("CLICK ME \(index)")
                            }
                        }
                    }
                }
                .tabItem
                {
                    Label("SETTING", systemImage: "gear")
                }
            }
        }
    }
}

struct DoubleTabView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DoubleTabView()
    }
}
