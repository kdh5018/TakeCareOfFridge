//
//  ExpandTableViewCell.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/25.
//

import UIKit

class ExpandingTableViewCellContent {
    var expanded: Bool
    
    init() {
        self.expanded = false
    }
}

class ExpandTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgViewHeightConstraint: NSLayoutConstraint!
    

    @IBOutlet weak var guideTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func settingData(isClicked : ExpandingTableViewCellContent ) {
        if isClicked.expanded == true {
            self.guideTextLabel.text = "다시 누르면 축소"
            self.imgView.isHidden = false
            self.imgView.alpha = 1
            self.imgViewHeightConstraint.constant = 133
        } else {
            self.guideTextLabel.text = "누르면 확장"
            self.imgView.isHidden = true
            self.imgView.alpha = 0
            self.imgViewHeightConstraint.constant = 0
        }
    }
    
}
