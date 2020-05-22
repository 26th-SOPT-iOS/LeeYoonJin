//
//  Music.swift
//  SOPT_3rdweekSeminar
//
//  Created by 이윤진 on 2020/05/09.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

struct Music{
    
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(coverName: String, musicTitle: String, singer: String) {
        self.albumImg = UIImage(named: coverName) // 이미지의 이름이 title이라서 변수 title로 지정해주기
        self.musicTitle = musicTitle
        self.singer = singer
    }
}
