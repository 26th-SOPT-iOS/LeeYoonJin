//
//  SignupService.swift
//  SOPT_Firstweek_HW_2
//
//  Created by 이윤진 on 2020/05/16.
//  Copyright © 2020 이윤진. All rights reserved.
//

import Foundation
import Alamofire

struct SignupService {
    
    static let shared = SignupService() // 로그인 서비스 객체 생성 및 접근 가능(전역 변수)
    
    private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String) -> Parameters {
        return ["id": id, "password": pwd, "name": name, "email": email, "phone": phone]
    }
    
    // 회원가입 구현부
    func signup(id: String, pwd: String,name: String, email: String, phone: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"] // HTTP Header 객체, alamofire에 구현되어있는 reference변수이자 request header 생성
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, pwd,name, email,phone), encoding:JSONEncoding.default, headers: header)
        
        
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
        case 200: return isSignup(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail }
    }
    
    private func isSignup(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupData.self, from: data) else { return .pathErr }
        
        if decodedData.success {
            print("\(decodedData)")
            print(decodedData)
            return .success(data)
        }
        return .requestErr(decodedData.message)
    }
    
}
