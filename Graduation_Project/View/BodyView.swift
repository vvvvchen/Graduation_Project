//
//  BodyView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/29.
//

import SwiftUI

struct BodyView: View
{
    var body: some View
    {
        VStack(alignment: .leading, spacing: 5)
        {
            HStack(spacing: 90)
            {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 120,height: 120)
                    .padding(.top,50)
                Text("  尿酸")
                    .font(.system(size:20))
                    .offset(y: 20)
            }
            
            HStack(spacing: 90)
            {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 120,height: 120)
                    .padding(.top,50)
                Text("高血壓")
                    .font(.system(size:20))
                    .offset(y: 20)
            }
            HStack(spacing: 90)
            {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 120,height: 120)
                    .padding(.top,50)
                Text("高血糖")
                    .font(.system(size:20))
                    .offset(y: 20)
            }
            
            HStack(spacing: 90)
            {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 120,height: 120)
                    .padding(.top,50)
                Text("高血脂")
                    .font(.system(size:20))
                    .offset(y: 20)
            }
        }
        .padding()
    }
}



struct BodyView_Previews: PreviewProvider
{
    static var previews: some View
    {
        BodyView()
    }
}
