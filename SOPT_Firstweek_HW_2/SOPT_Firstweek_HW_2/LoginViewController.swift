//
//  LoginViewController.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/04/18.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        // Do any additional setup after loading the view.
    }
    var id: String? //아이디 값
    var pw: String? //비밀번호 값
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    @IBAction func DoLogout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setLabels(){
        guard let id = self.id else{return}
        guard let pw = self.pw else{return}
        
        idLabel.text = id
        pwLabel.text = pw
        
        
        
    }
}
