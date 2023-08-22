//
//  _Member.swift
//  TopicIM110
//
//  Created by  2023/8/22.
//

import SwiftUI

extension MemberView
{
    func _MemberButton(image: String, title: String,itemContent: String) -> some View
    {
        Button(action: {
                }) {
                    HStack {
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
