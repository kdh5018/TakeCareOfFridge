//
//  FoodManager.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/25.
//

import UIKit

class FoodManager {
    var foodArray: [Food] = []
    
    func makeFoodData() {
        foodArray = []
    }
    func getFoodData() -> [Food] {
        return foodArray
    }
}
