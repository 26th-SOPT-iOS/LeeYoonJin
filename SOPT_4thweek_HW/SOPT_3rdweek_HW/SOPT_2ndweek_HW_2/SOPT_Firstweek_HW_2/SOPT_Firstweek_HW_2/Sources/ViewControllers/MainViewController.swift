//
//  ViewController.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/04/18.
//  Copyright © 2020 이윤진. All rights reserved.


import UIKit

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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
// let nextViewController = storyboard.instantiateViewController(withIdentifier: "Tab") as! TabController // main.storyboard의 지정된 identfier가진 뷰컨트롤러로 전환시켜준다.
  //      nextViewController.modalPresentationStyle = .fullScreen // 탭바 연결된 다른 뷰컨트롤러들 풀사이즈로 보여주기
//        self.present(nextViewController, animated: true, completion: nil)
//
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
    
    /*func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        //bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear

    }*/
    
    /*@IBAction func DoLogin(_ sender: Any) {
        
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}
        receiveViewController.modalPresentationStyle = .fullScreen
        //receiveViewController.id = idTextField.text
        //receiveViewController.pw = pwTextField.text
        // 알림창 구현
        /*if idTextField == nil{
            let alert = UIAlertController(title: "alert", message: "textField", preferredStyle: .alert)

            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in

            }

                    alert.addAction(ok)

                    self.present(alert, animated: true, completion: nil)
        }*/
        self.present(receiveViewController, animated: true, completion: nil)
    }*/
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    
}

