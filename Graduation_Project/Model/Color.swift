//
//  _Color.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import Foundation
import SwiftUI

struct CustomToogleStyle: ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20,style: .continuous)
                .frame(width:200,height: 40)
            RoundedRectangle(cornerRadius: 20,style: .continuous)
            //.foregroundColor(configuration.isOn ? Color("L") : Color("L"))
            //MARK: 有動畫效果，但是會在15被棄用
            .animation(.easeInOut)
            .frame(width: 100,height: 44)
            .offset(x:configuration.isOn ? 50 : -50)
            .shadow(color: .black.opacity(0.2), radius: 10,x:10,y:10)

            
            HStack{


                Text("淺色模式").bold().font(.system(size: 15))
                    .foregroundColor(configuration.isOn ? .gray: .white)
                
                Spacer()

                Text("深色模式").bold().font(.system(size: 15))
                    .foregroundColor(configuration.isOn ? .black : .gray)

            }
            .frame(width: 135)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)){
                configuration.isOn.toggle()
            }
        }
    }
}