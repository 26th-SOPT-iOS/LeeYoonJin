//
//  ListViewController.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/05/14.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit

class ListViewController: UIViewController{
    private var friendInformations: [FriendInformation] = []
    @IBOutlet weak var friendTableView: UITableView!
    

    override func viewDidLoad() {
        setFriendInformations()
        friendTableView.delegate = self
        friendTableView.dataSource = self
        super.viewDidLoad()
        
        self.friendTableView.separatorStyle = UITableViewCell.SeparatorStyle.none // 테이블 셀 구분선 삭제
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    @IBAction func setList(_ sender: UIButton) {
        

        let showOption = UIAlertController(title: nil, message:nil , preferredStyle: .actionSheet)
        
        let setFriend = UIAlertAction(title: "친구 관리", style: .default)
        
        let setAll = UIAlertAction(title: "전체 설정", style: .default)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        showOption.addAction(setFriend)
        showOption.addAction(setAll)
        showOption.addAction(cancel)
        
        present(showOption, animated: true, completion: nil)

        
        
    }
    private func setFriendInformations(){
        
        let friend1 = FriendInformation(friendimage: .f1, friendname: "절미", friendstate: "졸프 던져" )
        let friend2 = FriendInformation(friendimage: .f2, friendname: "댕댕", friendstate: "멀바")
        let friend3 = FriendInformation(friendimage: .f3, friendname: "댕댕", friendstate: "교수님 미워요")
        let friend4 = FriendInformation(friendimage: .f4, friendname: "댕댕", friendstate: "🤔🤔🤔🤔")
        let friend5 = FriendInformation(friendimage: .f5, friendname: "댕댕", friendstate: "내 생일은 12월 14일")
        let friend6 = FriendInformation(friendimage: .f6, friendname: "댕댕", friendstate: "tmi")
        let friend7 = FriendInformation(friendimage: .f7, friendname: "절미", friendstate: "종강시켜달라")
        let friend8 = FriendInformation(friendimage: .f8, friendname: "랑이", friendstate: "냐나ㄴ 낭")
        let friend9 = FriendInformation(friendimage: .f9, friendname: "우치", friendstate: "애옹")
        
        friendInformations = [friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8, friend9]
    }
}

extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell else{ return UITableViewCell()}
        friendCell.setFriendInformation(friendImageName: friendInformations[indexPath.row].friendimage.getImageName(), fn: friendInformations[indexPath.row].friendname, fs: friendInformations[indexPath.row].friendstate)
        
        return friendCell
    }
    
    /*도전 과제 코드: 셀 삭제하기, https://dev-dream-world.tistory.com/49 */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            friendInformations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
   

}
extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80 }
    

    
}
