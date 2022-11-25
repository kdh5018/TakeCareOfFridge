//
//  TableViewCell.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/14.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodCategory: UILabel!
    
    @IBOutlet weak var foodDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
