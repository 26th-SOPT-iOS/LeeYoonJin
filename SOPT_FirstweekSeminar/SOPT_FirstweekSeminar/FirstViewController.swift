//
//  FirstViewController.swift
//  SOPT_FirstweekSeminar
//
//  Created by 이윤진 on 2020/04/18.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sampleSwitch: UISwitch!
    
    @IBOutlet weak var sampleSlider: UISlider!
    
    // 다음화면으로 넘어가는 버튼 누르면 secondview로 값 전달된다
    @IBAction func transferData(_ sender: Any) {
        
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "secondViewController")as? SecondViewController else{return}
            //as : 타입캐스팅, SecondViewController의 identifier인 secondViewController로 연결
        receiveViewController.name = nameTextField.text
        receiveViewController.email = emailTextField.text
        receiveViewController.isOnOff = sampleSwitch.isOn
        receiveViewController.frequency = sampleSlider.value
        self.present(receiveViewController, animated: true, completion: nil)
    }
}
