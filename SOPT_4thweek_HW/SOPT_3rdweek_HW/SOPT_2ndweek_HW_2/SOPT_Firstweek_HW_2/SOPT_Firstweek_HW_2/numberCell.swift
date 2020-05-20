//
//  numberCell.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/05/14.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class numberCell: UITableViewCell {

    static let identifier: String = "numberCell"
    @IBOutlet weak var numOfFriend: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFriendNumber(number: String){
        
        numOfFriend.text = number
    }
}
