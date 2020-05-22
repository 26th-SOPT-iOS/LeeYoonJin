//
//  ViewController.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/04/18.
//  Copyright © 2020 이윤진. All rights reserved.


import UIKit
import BEMCheckBox

class MainViewController: UIViewController {
// 앱 실행 시 초기 화면(로그인창)
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var email: UIView!
    @IBOutlet weak var password: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        login.layer.cornerRadius = 24.0
        //signin.layer.cornerRadius = 22.0
        email.layer.cornerRadius = 22.0
        password.layer.cornerRadius = 22.0
        //self.setNavigationBar()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear// 네비게이션 바 투명하게 만들기
    }

    
    @IBAction func moveTab(_ sender: UIButton) {
        
        /*로그인 액션 설정하기*/
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in // 미리 정의해둔 싱글톤 객체 통해 데이터 생성
            switch networkResult {
                
            case .success(let token): //성공. 토큰을 디폴트 데이터베이스에 저장한 후, 다음 화면으로 전환하게 된다
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "Tab") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                
            case .requestErr(let message): // 실패
                    
                    guard let message = message as? String else { return }
                    // 알림창 구현하기(로그인 실패)
                    let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail") }
        }
        
    }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    func AutoLogin(){
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "Tab") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr") case .networkFail: print("networkFail")
                
            }
        }
        
        
    }
}

