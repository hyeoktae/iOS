//
//  MainTabBarController.swift
//  Fastflix
//
//  Created by hyeoktae kwon on 2019/07/16.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  let homeVC = HomeVC()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    
    tabBar.backgroundImage = UIImage(named: "black")
    
    self.viewControllers = [homeVC]
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
