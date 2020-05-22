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
        //setLabels()
        // Do any additional setup after loading the view.
        //self.navigationController?.navigationBar.barTintColor = .purple
       
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.setHidesBackButton(true, animated:true); // 네비게이션 바의 뒤로가기 버튼 숨기기
        
    }
    /*func setNavigationBar(){
         let bar:UINavigationBar! =  self.navigationController?.navigationBar
         bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
         bar.backgroundColor = UIColor.clear

     }*/
     
 
   
    var id: String? //아이디 값
    var pw: String? //비밀번호 값
    
    //@IBOutlet weak var idLabel: UILabel!
    //@IBOutlet weak var pwLabel: UILabel!
    /*@IBAction func DoLogout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    private func setLabels(){
        guard let id = self.id else{return}
        guard let pw = self.pw else{return}
        
        //idLabel.text = id
        //pwLabel.text = pw
        
        
        
    }*/
}
