//
//  LoginService.swift
//  
//
//  Created by 이윤진 on 2020/05/16.
//

import Foundation
import Alamofire

// cmd + b : 런 직전 빌드만해줘서 문법만 간단하게 판단 가능
// ctl + i : syntax 수정

struct LoginService {
    
    static let shared = LoginService() // 로그인 서비스 객체 생성 및 접근 가능(전역 변수)
    
    private func makeParameter(_ id: String, _ pwd: String) -> Parameters {
        return ["id": id, "password": pwd]
    }
    
    // 로그인 구현부
    func login(id: String, pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"] // HTTP Header 객체, alamofire에 구현되어있는 reference변수이자 request header 생성
        let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(id, pwd), encoding:JSONEncoding.default, headers: header) // 원하는 형식의 HTTP Request 생성
        // signURL 요청, 로그인 시에는 post 사용. pararmeter에는 id와 pw 받아오는 함수호출(api와 키 값 일치해야함!!!!!!!)
        //
        
        
        // 데이터 통신 시작
        dataRequest.responseData { dataResponse in switch dataResponse.result { // result 값에 따른 분기 처리 진행
        case .success: // 통신 성공
            guard let statusCode = dataResponse.response?.statusCode else { return }
            guard let value = dataResponse.result.value else { return }
            let networkResult = self.judge(by: statusCode, value) // 받아온 값에 대하여 decode 진행하기
            completion(networkResult)
            
        case .failure: completion(.networkFail) // 통신 실패
            }
            
        }
    }
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
            
        }
    }
    private func isUser(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SigninData.self, from: data) else { return .pathErr }
        //print("\(decodedData)")
        guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
     
        
        return .success(tokenData.jwt)
    
    }
    
}
