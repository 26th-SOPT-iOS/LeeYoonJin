//
//  FriendCell.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/05/14.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    static let identifier: String = "FriendCell"
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendState: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setFriendInformation(friendImageName: String, fn: String, fs: String){
        // fn = friendname, fs = friendstate
        friendImage.image = UIImage(named:friendImageName)
        friendName.text = fn
        friendState.text = fs
        
    }
}
