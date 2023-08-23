//
//  ContentView.swift
//  TopicIM110
//
//  Created by 0822
//

import SwiftUI

struct SwiftUIView: View
{
    @AppStorage("colorScheme") private var colorScheme: Bool=false
    @State var isDarkMode: Bool = false
    
    var body: some View
    {
        VStack
        {
            VStack
            {
                VStack
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
                        Circle()
                            .foregroundColor(Color("D"))
                            .frame(width: 105, height: 105)
                            .offset(x:10, y:5)
                    }
                }
                Toggle("",isOn: self.$colorScheme)
                    .toggleStyle(CustomToogleStyle())
                    .padding()
            }
            .background(isDarkMode ? Color("D") : Color("L"))
            .cornerRadius(20)
            .frame(width:290,height: 25)
            .shadow(color: .black.opacity(0.2), radius: 10,x:10,y:10)
            .padding(.top,-200)
            
        }
        .preferredColorScheme(self.colorScheme ? .light:.dark)
        
    }
    struct SwiftUIView_Previews: PreviewProvider
    {
        static var previews: some View
        {
            SwiftUIView()
        }
    }
}
