//
//  ViewController.swift
//  SOPT_2ndweek_HW_1
//
//  Created by 이윤진 on 2020/05/07.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //btn7.layer.cornerRadius = 0.5*btn7.bounds.size.width
        
    }
    override func viewDidAppear(_ animated: Bool) {
        btn0.layer.cornerRadius = 0.5*btn0.bounds.size.width
        btn1.layer.cornerRadius = 0.5*btn1.bounds.size.width
        btn2.layer.cornerRadius = 0.5*btn2.bounds.size.width
        btn3.layer.cornerRadius = 0.5*btn3.bounds.size.width
        btn4.layer.cornerRadius = 0.5*btn4.bounds.size.width
        btn5.layer.cornerRadius = 0.5*btn5.bounds.size.width
        btn6.layer.cornerRadius = 0.5*btn6.bounds.size.width
        btn7.layer.cornerRadius = 0.5*btn7.bounds.size.width
        btn8.layer.cornerRadius = 0.5*btn8.bounds.size.width
        btn9.layer.cornerRadius = 0.5*btn9.bounds.size.width
        btnDiv.layer.cornerRadius = 0.5*btnDiv.bounds.size.width
        btnMul.layer.cornerRadius = 0.5*btnMul.bounds.size.width
        btnMin.layer.cornerRadius = 0.5*btnMin.bounds.size.width
        btnAC.layer.cornerRadius = 0.5*btnAC.bounds.size.width
        btnEqual.layer.cornerRadius = 0.5*btnEqual.bounds.size.width
        btnAdd.layer.cornerRadius = 0.5*btnAdd.bounds.size.width
    }
   
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnDiv: UIButton!
    @IBOutlet weak var btnMul: UIButton!
    @IBOutlet weak var btnMin: UIButton!
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
}

