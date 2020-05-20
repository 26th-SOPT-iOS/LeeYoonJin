//
//  FriendInformation.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/05/14.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

struct FriendInformation{
    
    var friendname: String
    var friendstate: String
    var friendimage: FImage
    
    init (friendimage: FImage, friendname: String, friendstate: String){
        self.friendimage = friendimage
        self.friendname = friendname
        self.friendstate = friendstate
    }
    
}

enum FImage {
    
    case f1
    case f2
    case f3
    case f4
    case f5
    case f6
    case f7
    case f8
    case f9
    
    func getImageName() -> String{ switch self {
        case .f1: return "profile1Img"
    case .f2:
        return "profile2Img"
    case .f3:
        return "profile3Img"
    case .f4:
        return "profile4Img"
    case .f5:
        return "profile5Img"
    case .f6:
        return "profile6Img"
    case .f7:
        return "profile7Img"
    case .f8:
        return "profile8Img"
    case .f9:
        return "profile9Img"
        }
    }
}
