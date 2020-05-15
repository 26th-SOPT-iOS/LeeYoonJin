//
//  SignUpViewController.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/04/18.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signAdmitted: UIButton!
    @IBOutlet weak var idTextField: UITextField! // 이메일 입력란
    @IBOutlet weak var pwTextField: UITextField! // 비번 입력란
    @IBOutlet weak var nameTextField: UITextField! // 이름 입력란
    @IBOutlet weak var name: UIView!
    @IBOutlet weak var email: UIView!
    @IBOutlet weak var password: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNavigationBar()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 7/255, green: 59/255, blue: 163/255, alpha: 1.0) // 네비게이션컨트롤러 뒤로가기 버튼 색깔 변경
        self.navigationController?.navigationBar.topItem?.title = "" //뒤로가기 버튼 텍스트 변경
        signAdmitted.layer.cornerRadius = 24.0
        name.layer.cornerRadius = 22.0
        email.layer.cornerRadius = 22.0
        password.layer.cornerRadius = 22.0
        

        
    }
    // 네비게이션 상단 바 투명하게 바꾸기
    func setNavigationBar(){
         let bar:UINavigationBar! =  self.navigationController?.navigationBar
         bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                 bar.shadowImage = UIImage()
         bar.backgroundColor = UIColor.clear
     }

    @IBAction func doSignUp(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}
           receiveViewController.modalPresentationStyle = .fullScreen
           receiveViewController.id = idTextField.text
           receiveViewController.pw = pwTextField.text
      
        self.present(receiveViewController, animated: true, completion: {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        })
    }
}
