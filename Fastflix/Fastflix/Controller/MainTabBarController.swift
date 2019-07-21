//
//  MainTabBarController.swift
//  Fastflix
//
//  Created by hyeoktae kwon on 2019/07/16.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import AVKit
import SnapKit

final class MainTabBarController: UITabBarController {
  
//  private let homeVC = MainHomeVC()
  private let preVC = PreViewPlayerVC()
  private let launchVC = LaunchScreenVC()
  private let detailVC = DetailVC()
  private let seeMoreVC = SeeMoreVC()
  private let navi = UINavigationController(rootViewController: MainHomeVC())
  
  private let homeNaviView: HomeView = {
    let homeNaviView = HomeView(frame: CGRect(x: 0, y: -44, width: 0, height: 0))
    return homeNaviView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavi()
    setupLayout()
    tabBar.tintColor = .white
    navi.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "tabBarhome2"), tag: 0)
    
    
    seeMoreVC.tabBarItem = UITabBarItem(title: "더 보기", image: UIImage(named: "tabBarSeeMore1"), tag: 3)
    
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
    
    self.viewControllers = [navi, playerVC, launchVC, seeMoreVC]
    
    print("navi VIew", navi.view.frame)
    print("navi NavigationBar", navi.navigationBar.frame)
    print("self", self.viewControllers?.first?.view.frame)
  }
  
  func setupNavi() {
    navi.navigationBar.addSubview(homeNaviView)
    navi.navigationBar.barTintColor = .clear
    navi.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navi.navigationBar.shadowImage = UIImage()
    navi.navigationBar.isTranslucent = true
    self.setNeedsStatusBarAppearanceUpdate()
  }
  
  func setupLayout() {
//    homeNaviView.snp.makeConstraints {
//      print(self.view.superview?.safeAreaInsets.top)
//      $0.top.equalToSuperview().offset(-navi.view.safeAreaInsets.top)
//    }
  }
  
}
