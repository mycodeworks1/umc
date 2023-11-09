//
//  Model.swift
//  Week4_p
//
//  Created by 유철민 on 2023/11/10.
//

import Foundation

struct Model{
    let imageName : String
    let title : String
    let price : String
    
    init(imageName: String, title: String, price: String) {
        self.imageName = imageName
        self.title = title
        self.price = price
    }
    
}
