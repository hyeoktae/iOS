//
//  ViewController.swift
//  TestRequest
//
//  Created by hyeoktae kwon on 2019/07/14.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Network.shared.testAccount()
  }
  
  
}

