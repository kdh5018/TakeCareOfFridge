//
//  FoodManager.swift
//  TakeCareOfFridge
//
//  Created by κΉλν on 2022/11/25.
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
