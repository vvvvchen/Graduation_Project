//
//  Information.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import Foundation

struct Information: Hashable
{
    var image: String
    var name: String
    var gender: String
    var age: Int
    var CM: CGFloat
    var KG: CGFloat
    var phone: String
   
}
class UserDataManager
{
    //變數 變數名稱: [型態]=[Information(image: 圖片名稱, name: 名字, gender: 性別, age: 0, CM: 0, KG: 0, phone: "")]
    var userDatas: [Information]=[Information(image: "", name: "", gender: "", age: 0, CM: 0, KG: 0, phone: "")]

}
