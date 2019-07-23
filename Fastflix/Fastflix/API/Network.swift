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
  
  private let loginUrl = URL(string: "http://52.78.134.79/accounts/login/")!
  
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
      
    }, to: loginUrl, method: .post) {
      switch $0 {
      case .success(let upload, _, _):
        upload.responseJSON { (res) in
          guard let data = res.data else {
            completion(.failure(ErrorType.NoData))
            return }
          guard let origin = try? JSONDecoder().decode(Login.self, from: data) else {
            completion(.failure(ErrorType.NoData))
            return }
          let token = origin.token
          let subUserArr = origin.subUserList
          print(token)
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
  
  // MARK: - save Token at UserDefaults with Key("token")
  private func saveToken(token: String) {
    path.set(token, forKey: "token")
    print("'Token' save complete ")
  }
  
}
