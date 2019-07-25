//
//  SeeMoreVC.swift
//  Fastflix
//
//  Created by Jeon-heaji on 18/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
// 
import UIKit
import SnapKit

class SeeMoreVC: UIViewController {
  
  var profileCount = 0
  var viewArr: [ProfileView] = []
  

  override func loadView() {
    let seeMoreView = SeeMoreView()
    self.view = seeMoreView
//    seeMoreView.profileStackView.addArrangedSubview(viewArr)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // profile 생성
  func makeProfileView() {
    // 0일때 5일때 예외처리
    for idx in 0...profileCount {
      let view: ProfileView = {
        let view = ProfileView()
        //        view.configure(image: <#T##UIImage?#>, name: <#T##String?#>)
        return view
      }()
      viewArr.append(view)
    }
  }


}
  
