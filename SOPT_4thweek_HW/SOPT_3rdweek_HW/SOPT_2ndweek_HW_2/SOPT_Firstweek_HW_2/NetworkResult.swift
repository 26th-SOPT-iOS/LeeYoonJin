//
//  NetworkResult.swift
//  
//
//  Created by 이윤진 on 2020/05/16.
//

import Foundation

enum NetworkResult<T> { // 서버 통신 결과 정리
    
    case success (T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    
    
}
