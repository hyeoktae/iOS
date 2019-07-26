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
    seeMoreView.delegate = self
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
extension SeeMoreVC: SeeMoreViewDelegate {
  func logoutCellDidTap(indexPath: IndexPath) {
    switch indexPath {
    case IndexPath(row: 0, section: 0): break
      
    case IndexPath(row: 0, section: 1): break
      
    case IndexPath(row: 0, section: 2):
      print("앱설정")
    case IndexPath(row: 4, section: 2):
      print("로그아웃")
      
      let path = UserDefaults.standard
      path.removeObject(forKey: "token")
      AppDelegate.instance.checkLoginState()
      
      print("로그아웃됨")
    
    default:
      break
    }
  }
  
}
