//
//  Network.swift
//  Fastflix
//
//  Created by hyeoktae kwon on 2019/07/10.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import Alamofire



final class APICenter {
  static let shared = APICenter()
  
  let path = UserDefaults.standard
  
  private func getToken() -> String {
    guard let token = path.string(forKey: "token") else {
      print("ERROR!!!, No Token")
      AppDelegate.instance.checkLoginState()
      return ""}
    return token
  }
  
  func getMovieData(completion: @escaping (Result<RequestMovie>) -> ()) {
//    RequestMovie.self
    let token = getToken()
    let subUserID = getSubUserID()
    let headers = [
      "Authorization": "Token \(token)",
      "subuserid": "\(subUserID)"
    ]
    
    let request = Alamofire.request(RequestString.movieURL.rawValue, method: .get, headers: headers)
    
    request.response(queue: .main) {
      guard let data = $0.data else {
        completion(.failure(ErrorType.NoData))
        return }
      guard let resultData = try? JSONDecoder().decode(RequestMovie.self, from: data) else {
        completion(.failure(ErrorType.FailToParsing))
        return }
      completion(.success(resultData))
    }
    
//    request.responseJSON(queue: .global()) {
//      switch $0.result {
//      case .success(_):
//        guard let data = $0.data else { return }
//        guard let resultData = try? JSONDecoder().decode(RequestMovie.self, from: data) else { return completion(.failure(ErrorType.FailToParsing)) }
//        completion(.success(resultData))
//      case .failure(let err):
//        completion(.failure(ErrorType.networkError))
//      }
//    }
    
  
  }
  
  
  
  // MARK: - Login Method
  func login(id: String, pw: String, completion: @escaping (Result<[SubUserList]>) -> ()) {
    
    let parameters =
      [
        "id": id,
        "pw": pw
    ]
    
    
    Alamofire.upload(multipartFormData: {
      MultipartFormData in
      for (key, value) in parameters {
        MultipartFormData.append(value.data(using: .utf8)!, withName: key)
      }
      
    }, to: RequestString.loginURL.rawValue, method: .post) {
      switch $0 {
      case .success(let upload, _, _):
        upload.responseJSON { (res) in
//          print("run", res.data as? [String: String])
          guard let data = res.data else {
            completion(.failure(ErrorType.NoData))
            return }
          guard let origin = try? JSONDecoder().decode(Login.self, from: data) else {
            completion(.failure(ErrorType.NoData))
            return }
          let token = origin.token
          let subUserArr = origin.subUserList
          print("subUser: ", subUserArr)
          self.saveToken(token: token)
          
          completion(.success(subUserArr))
        }
      case .failure(let err):
        print(err)
        completion(.failure(ErrorType.NoData))
        break
      }
    }
  }
  
  func saveSubUserID(id: Int) {
    path.set(id, forKey: "subUserID")
    print("'subUserID' save complete ")
  }
  
  func getSubUserID() -> Int {
    print("subUserID: ", path.integer(forKey: "subUserID"))
    return path.integer(forKey: "subUserID")
  }
  
  // MARK: - save Token at UserDefaults with Key("token")
  private func saveToken(token: String) {
    path.set(token, forKey: "token")
    print("'Token' save complete ")
  }
  
}
