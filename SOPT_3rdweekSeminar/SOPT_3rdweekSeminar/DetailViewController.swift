//
//  DetailViewController.swift
//  SOPT_3rdweekSeminar
//
//  Created by 이윤진 on 2020/05/09.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    var imageName: String = ""
    var date: String = ""
    var subTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    private func initView(){
        weatherImageView.image = UIImage(named: imageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
    }
}
