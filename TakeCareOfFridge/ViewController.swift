//
//  ViewController.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    struct Food {
        var foodImage: UIImage?
        static var foodNumbers: Int = 0
        let foodID: Int!
        var foodCategory: String!
        var foodDate: String!
        
        init(foodImage: UIImage?, foodCategory: String!, foodDate: String!) {
            
            self.foodID = Food.foodNumbers == 0 ? 0 : Food.foodNumbers
            
            self.foodImage = foodImage
            self.foodCategory = foodCategory
            self.foodDate = foodDate
            
            Food.foodNumbers += 1
        }
    }
    
    var foodList: [Food] = []
    
    func getFoodList() -> [Food] {
        return foodList
    }
    func makeNewFood(_ food: Food) {
        foodList.append(food)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

