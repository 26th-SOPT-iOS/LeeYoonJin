//
//  IndigoViewController.swift
//  SOPT_FirstweekSeminar
//
//  Created by 이윤진 on 2020/04/18.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class IndigoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dissmissView(_ sender: Any) {
    // IBAction함수명은 동사형으로 지정하는 게 좋다
    // 드래그 시 viewDidLoad 바깥에 연결시키도록 하기
    // sender -> 버튼
        self.dismiss(animated: true, completion: nil)
        // 작동방식을 true로 지정, completion은 작동 후 방식 지정
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
