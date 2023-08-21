//
//  _Member.swift
//  TopicIM110
//
//  Created by 曾品瑞 on 2023/8/18.
//

import SwiftUI

extension MemberView
{
    func MemberButton(title: String) -> some View
    {
        Text(title)
            .font(.body)
            .foregroundColor(.black)
            .padding()
            .frame(width: 200)
            .background(Color(.systemGray3))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 1, y: 3)
    }
}
