//
//  TabController.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/05/14.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class TabController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true) // 뒤로 가기 버튼 삭제
        
        /*탭 바 첫 번째 아이콘 홈 아이콘 설정 코드*/
        let arrayOfImageNameForSelectedState = ["homeSelectedIc"]
        let arrayOfImageNameForUnselectedState = ["homeUnselectedIc"]
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count-2) { // 홈 아이콘만 외부 이미지 가져와서 사용하므로 홈 탭에만 해당하도록 for문 설정하였음
                let imageNameForSelectedState   = arrayOfImageNameForSelectedState[i]
                let imageNameForUnselectedState = arrayOfImageNameForUnselectedState[i]

                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
                self.tabBar.items?[i].image = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysOriginal)
            }
        }
             
        // tabBarItem.badgeValue = "123" , 어플 옆에 알림 몇갠지 보여주는 배지 설정
        let selectedColor = UIColor(red: 47.0/255.0, green: 54.0/255.0, blue: 62.0/255.0, alpha: 1.0)
        let unselectedColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        // 탭 바 text 색깔 지정하기
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        }
        
    
}

