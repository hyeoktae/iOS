//
//  MainTabBarController.swift
//  Fastflix
//
//  Created by hyeoktae kwon on 2019/07/16.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AVKit

final class MainTabBarController: UITabBarController {
  
  private let homeVC = HomeVC()
  private let preVC = PreViewPlayerVC()
  private let launchVC = LaunchScreenVC()
  private let detailVC = DetailVC()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabBar.tintColor = .white
    homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "tabBarhome2"), tag: 0)
    

    detailVC.tabBarItem = UITabBarItem(title: "더 보기", image: UIImage(named: "tabBarSeeMore1"), tag: 3)
    
    let item =  UITabBarItem(title: "저장한 콘텐츠 목록", image: UIImage(named: "tabBarDownLoad1"), tag: 2)
    
//    item.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 4)], for: .normal)
    item.badgeValue = "☁︎"
    
    item.badgeColor = .blue
    
    launchVC.tabBarItem = item
    
    func playBounceAnimation(_ icon : UIImageView) {
      
      let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
      bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
      bounceAnimation.duration = 2
      bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
//      bounceAnimation.calculationMode = kCAAnimationCubic
      
      icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
      
    }
    tabBar.tintColor = .white
    
    tabBar.backgroundImage = UIImage(named: "black")
    
    let url = URL(string: preViewUrl2)!
    
    let playerVC = AVPlayerViewController() 
    let player = AVPlayer(url: url)
    playerVC.player = player
    
    playerVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(named: "tabBarSearch1"), tag: 1)
    
    self.viewControllers = [homeVC, playerVC, launchVC, detailVC]
  }
}
