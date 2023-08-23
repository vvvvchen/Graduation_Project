//
//  MemberButton.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import SwiftUI

struct MemberButton: View {

    var image: String
    var title: String
    var itemContent: String

    var body: some View {
        Button(action: {

        })
        {
            HStack
            {
                Image(systemName: image)
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                Spacer()

                Text(itemContent)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }.padding(.vertical, 15)
        }
    }
}
