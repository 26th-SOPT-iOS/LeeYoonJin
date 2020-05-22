//
//  SignUpViewController.swift
//  SOPT_Firstweek_HW_2
//  회원가입 뷰 컨트롤러 구현부
//  Created by 이윤진 on 2020/04/18.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signAdmitted: UIButton!
    @IBOutlet weak var idTextField: UITextField! // 이메일 입력란
    @IBOutlet weak var pwTextField: UITextField! // 비번 입력란
    @IBOutlet weak var nameTextField: UITextField! // 이름 입력란
    @IBOutlet weak var useridTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var name: UIView!
    @IBOutlet weak var email: UIView!
    @IBOutlet weak var password: UIView!
    
    @IBOutlet weak var id: UIView!
    
    @IBOutlet weak var phoneNum: UIView!
    
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
        id.layer.cornerRadius = 22.0
        phoneNum.layer.cornerRadius = 22.0
        
        
        
    }
    
 
    // 네비게이션 상단 바 투명하게 바꾸기
    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    @IBAction func doSignUp(_ sender: Any) {
        
        guard let signName = nameTextField.text else {return} //이름
        guard let signEmail = idTextField.text else{return} //이메일
        guard let signPwd = pwTextField.text else{return} //비밀번호
        guard let signUserid = useridTextField.text else {return} //아이디
        guard let signPhone = phoneTextField.text else {return} //전번
        
        
        SignupService.shared.signup(id: signUserid, pwd: signPwd, name: signName, email: signEmail, phone: signPhone) { networkResult in
            
            switch networkResult {
                
            case .success(_): //성공. 토큰을 디폴트 데이터베이스에 저장한 후, 다음 화면으로 전환하게 된다
                guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "mainViewController") as? MainViewController else {return}
                receiveViewController.modalPresentationStyle = .fullScreen
                self.present(receiveViewController, animated: true, completion: nil)
                
                receiveViewController.idTextField.text = signUserid
                receiveViewController.pwTextField.text = signPwd
                receiveViewController.AutoLogin()
        
                print("\(signUserid)")
                print("\(signPwd)")
                
            case .requestErr(let message): // 실패
                
                guard let message = message as? String else { return }
                // 알림창 구현하기(회원가입 실패)
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("")
            case .serverErr: print("")
            case .networkFail: print("") }
        }
    }

    
    
}
