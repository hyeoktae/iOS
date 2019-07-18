//
//  PreViewPlayerVC.swift
//  Fastflix
//
//  Created by Jeon-heaji on 15/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//


import UIKit
import SnapKit
import AVKit

protocol PreViewPlayerVCDelegate {
  func finishVideo()
}

class PreViewPlayerVC: UIViewController {
  
  var delegate: PreViewPlayerVCDelegate?
  
  let dismissBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "x"), for: .normal)
    button.addTarget(self, action: #selector(dismissBtnDidTap(_:)), for: .touchUpInside)
    
    return button
  }()
  let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/test-64199.appspot.com/o/%E1%84%82%E1%85%A6%E1%86%BA%E1%84%91%E1%85%B3%E1%86%AF%E1%84%85%E1%85%B5%E1%86%A8%E1%84%89%E1%85%B3%E1%84%86%E1%85%B5%E1%84%85%E1%85%B5%E1%84%87%E1%85%A9%E1%84%80%E1%85%B5%E1%84%88%E1%85%A2%E1%86%BC%E1%84%87%E1%85%A1%E1%86%AB.mov?alt=media&token=3b5c22c5-5092-43a7-8400-659a4ff5d90c")!
  
  
  let playerViewController: AVPlayerViewController = {
    let playerVC = AVPlayerViewController()
    
    return playerVC
  }()
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    
    
    NotificationCenter.default.addObserver(self, selector: #selector(didFinishVideo(_:)), name: .AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
    
    let player = AVPlayer(url: url)
    playerViewController.player = player
    present(playerViewController, animated: true) {
      player.play()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(dismissBtn)
    view.backgroundColor = .clear
    snpLayout()
    
  }
  
  @objc func dismissBtnDidTap(_ sender: UIButton) {
    delegate?.finishVideo()
  }
  
  private func snpLayout() {
    dismissBtn.snp.makeConstraints {
      $0.top.equalTo(50)
      $0.centerX.equalToSuperview()
      $0.width.equalTo(40)
    }
  }
  
  @objc func didFinishVideo(_ sender: NSNotification) {
    print("run")
    dismiss(animated: true)
  }
  
  
  
}
