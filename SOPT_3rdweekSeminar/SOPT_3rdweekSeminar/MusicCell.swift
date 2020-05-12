//
//  MusicCell.swift
//  SOPT_3rdweekSeminar
//
//  Created by 이윤진 on 2020/05/09.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell{
    
    static let identifier: String = "MusicCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    func set(_ musicInformation: Music){
        
        albumImageView.image = musicInformation.albumImg
        titleLabel.text = musicInformation.musicTitle
        singerLabel.text = musicInformation.singer
        
    }
}
