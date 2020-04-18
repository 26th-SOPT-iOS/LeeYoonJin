//
//  SecondViewController.swift
//  SOPT_FirstweekSeminar
//
//  Created by 이윤진 on 2020/04/18.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setLabels() // 받아온 값 대입하는 함수 호출
    }
    var name: String? //이름 받을 변수
    var email: String? // 이메일 받을 변수
    var isOnOff : Bool? //스위치 on/off 여부 받을 변수
    var frequency: Float? //빈도를 받을 변수
    // 외부에서 직접 대입할 수 없기 때문에 다른 뷰에서 값을 받아오기 위한 변수가 필요
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //뒤로가기 기능 담당, 이전 뷰로 이동
    }
    
    // firstview로부터 받은 값을 secondview 변수에 할당하기
    private func setLabels(){
        guard let name = self.name else{return}
        guard let email = self.email else {return}
        guard let isOnOff = self.isOnOff else{return}
        guard let frequency = self.frequency else{return}
        
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "ON" : "OFF"
        // 옵셔널 바인딩, ture -> on / false -> off
        frequencyLabel.text = "\(frequency)"
        
    }
}
