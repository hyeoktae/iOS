//
//  MyContentVC.swift
//  Fastflix
//
//  Created by Jeon-heaji on 25/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
// 내가 찜한 콘텐츠 컨트롤러

class MyContentVC: UIViewController {
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  
  override func loadView() {
    let myContentView = MyContentView()
    self.view = myContentView
    view.backgroundColor = .green
  }


}
