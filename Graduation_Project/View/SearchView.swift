//
//  SearchView.swift
//  Graduation_Project
//
//  Created by 朝陽資管 on 2023/9/12.
//

import SwiftUI

struct SearchView: View
{
    
    @Binding var isSearching: Bool
    private let Searchtag: [String]=["玉米濃湯","壽司","親子丼","炸雞腿","泡菜"]
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Button(action:
                        {
                    // 關閉視圖
                    isSearching = false
                    
                }) {
                    
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color(red: 0.995, green: 0.477, blue: 0.33))
                }
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 0.995, green: 0.477, blue: 0.33))
                    .frame(width: 300, height: 35, alignment:  .leading)
                    .overlay
                {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment:  .trailing)
                        .frame(height: 20)
                        .padding(.horizontal, 10)
                }
                //                    Spacer()
            }
        }
        .padding(10)
        .font(.system(size: 26))
        
        VStack(spacing: 20)
        {
            HStack(spacing: 20)
            {
                ForEach(0..<3)
                {
                    index in
                    Capsule()
                        .fill(Color("tagcolor"))
                        .frame(width: 100, height: 30)
                        .shadow(color: .gray, radius: 3, y: 3)
                        .overlay(Text(self.Searchtag[index]))
                }
            }
            HStack(spacing: 20)
            {
                ForEach(3..<5)
                {index in
                    Capsule()
                        .fill(Color("tagcolor"))
                        .frame(width: 100, height: 30)
                        .shadow(color: .gray, radius: 3, y: 3)
                        .overlay(Text(self.Searchtag[index]))
                }
            }
        }
    }
}


//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView((isSearching: $isSearching))
//    }
//}
