//
//  Food.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/25.
//

import UIKit

struct Food {
    var foodImage: UIImage
    let foodCategory: String
    let foodDate: String
    
    init(foodImage: UIImage, foodCategory: String, foodDate: String) {
        self.foodImage = foodImage
        self.foodCategory = foodCategory
        self.foodDate = foodDate
    }
}
