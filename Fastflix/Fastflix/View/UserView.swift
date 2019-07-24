//
//  UserView.swift
//  Fastflix
//
//  Created by HongWeonpyo on 24/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
  func didSelectUser(id: String)
}

class UserView: UIView {

  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "profile1")
    return imageView
  }()
  
  var profileImage: UIImage?
  
  var profileUserName: String?
  
  weak var delegate: UserViewDelegate?
  
  lazy var profileButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(profileUserName ?? "테스트", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    button.titleLabel?.textAlignment = .center
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubViews()
    setupSNP()
    setupTapGesture()
  }
  
  func setUserUI(userName: String) {
    profileUserName = userName
  }
  
  private func setupTapGesture() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
    imageView.addGestureRecognizer(tap)
    imageView.isUserInteractionEnabled = true
  }
  
  @objc private func buttonTapped() {
    delegate?.didSelectUser(id: profileUserName ?? "테스트")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func addSubViews() {
    [imageView, profileButton].forEach { self.addSubview($0) }
  }
  
  private func setupSNP(){
    imageView.snp.makeConstraints {
      $0.top.equalTo(self.snp.top)
      $0.leading.equalTo(self.snp.leading)
      $0.trailing.equalTo(self.snp.trailing)
      $0.height.equalTo(self.imageView.snp.width)
    }
    
    profileButton.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(10)
      $0.leading.equalTo(self.snp.leading)
      $0.trailing.equalTo(self.snp.trailing)
      $0.height.equalTo(18)
      $0.bottom.equalTo(self.snp.bottom)
    }
  }
}
