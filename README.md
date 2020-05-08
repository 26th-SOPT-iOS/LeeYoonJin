# LeeYoonJin
이윤진

 💻 코드 간단 정리

---
* **1주차 과제**

  **✨ Navigation Controller 응용**

  👉네비게이션 컨트롤러는 스택처럼 쌓아올린다는 구조~~

  👉 버튼을 push로 연결

  

  ✨ **로그인 화면 구현**

  <img src="./img/2-1.png" alt="2-1" style="zoom:25%;" width = "300px"/> 

  👉 로그인화면/로그인화면/회원가입화면으로 구성

  * 회원가입 화면은 네비게이션 컨트롤러로 연결
  * 로그인 - 로그아웃 과정은 버튼 연결로 구현

  ```swift
  guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}
  // storyboard id 설정 후, identifier 지정해주기
  			receiveViewController.modalPresentationStyle = .fullScreen
        receiveViewController.id = idTextField.text 
        receiveViewController.pw = pwTextField.text
        
        self.present(receiveViewController, animated: true, completion: {
            if let navController = self.navigationController {
               navController.popViewController(animated: true)
      }
  })
  ```

  👉 회원가입 화면 코드

  * navigationController에 접근하여 popViewController(animated : true) 통해 로그아웃 후에 맨 처음 화면으로 돌아갈 수 있게 설정

------

* **2주차 과제**

  ✨계산기 구현하기

  <img src="./img/calculator.png" alt="calculator" style="zoom:25%;" width = "300px" />

  

  👉 vertical stack view를 먼저 깔아주고 그 내부에 horizontal stack view 4개 설치. horizontal stack view 하나 당 버튼 4개 설치했음
  
  👉 두 stack view 모두 fill equally로 설정하였고, 간격은 동일하게 10만큼
  
  
  ✨ 버튼 둥글게 만들기
  
  👉 각 버튼 outlet 생성하여 viewController.swift에 연결
  
  ```swift
  btn0.layer.cornerRadius = 0.5*btn0.bounds.size.width //btn0은 내가 지정한 @IBOutlet
  ```
  
  👉 버튼이 둥글게 만들어지려면 일단 버튼 모양 자체가 정사각형이어야함. 그래야 온전한 동그라미로 화면에 띄워지게됨(정사각형 아니면 요상한 잎사귀 모양 나옴). 그럼 버튼의 width와 heigth을 동일하게 맞춰줘야하는데...
  
  👉 sol) 버튼 크기 하나에만 aspect ratio 1:1 값 주기 
  
  /* vertical stack view와 horizontal stack view 모두 fill equally로 설정해서 크기가 맞춰지는 것 같음*/
  
  <img src="./img/calDocument.png" alt = "calDocument" style="zoom:25%;" width="300px" />

