//
//  MenuView.swift
//  Graduation_Project
//
//  Created by Mac on 2023/9/13.
//

import SwiftUI

struct MenuView: View
{
    var body: some View
    {
        //滑動功能
        ScrollView
        {
            VStack(spacing: 0)
            {
                Spacer()
                // MARK: 資料庫食譜照片
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 240)
                // MARK: 資料庫食譜名稱
                Spacer()
                Text("什麼炒蛋")
                    .font(.title)
                Spacer()
                // MARK: 所需食材
                ZStack()
                {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 50, height: 50)
                        .offset(x:-150)
                    
                    Text("所需食材")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .offset(x:-150)
                }

                VStack
                {
                    Spacer()
                    Text("番茄 2顆")
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    Text("雞蛋 1顆")
                        .font(.headline)
                        .foregroundColor(.orange)
                }

                // MARK: 料理方式
                Spacer()
                ZStack
                {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 50, height: 50)
                        .offset(x:-150)
                    Text("料理方式")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .offset(x:-150)
                }
                Spacer()
            }
            Spacer()
        }
    }
}


struct MenuView_Previews: PreviewProvider
{
    static var previews: some View
    {
        MenuView()
    }
}
