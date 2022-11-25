//
//  ViewController.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    var foodArray: [Food] = []
    
    var foodDataManager = FoodManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupTableView()
        setupData()
    }
    
//    func setupTableView() {
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        tableView.rowHeight = 120
//    }
    func setupData() {
        foodDataManager.makeFoodData()
        foodArray = foodDataManager.getFoodData()
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return foodArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return
//    }
//
//
//}
//
//extension ViewController: UITableViewDelegate {
//
//}
