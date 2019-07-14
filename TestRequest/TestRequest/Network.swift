//
//  Network.swift
//  TestRequest
//
//  Created by hyeoktae kwon on 2019/07/14.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation

class Network {
  static let shared = Network()
  
  func request() {
    let url = URL(string: "http://52.78.134.79/movies/")!
    
    URLSession.shared.dataTask(with: url) { (data, res, err) in
      guard err == nil, let data = data else { return }
      let result = try? JSONDecoder().decode(Movie.self, from: data)
      print(result![0])
    }.resume()
  }
}
