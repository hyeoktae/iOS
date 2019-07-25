//
//  ProfileChangeVC.swift
//  Fastflix
//
//  Created by HongWeonpyo on 25/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ProfileChangeVC: UIViewController {

  // 네이게이션뷰
  lazy var navigationView: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    view.addSubview(profileChangeLabel)
    view.addSubview(saveButton)
    view.addSubview(cancelButton)
    return view
  }()
  
  // 프로필관리 레이블(edit할때 나타나는 label)
  let profileChangeLabel: UILabel = {
    let label = UILabel()
    label.text = "프로필 변경"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 17)
    return label
  }()
  
  // 저장 버튼
  lazy var saveButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("저장", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
    return button
  }()
  
  // 취소 버튼
  lazy var cancelButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("취소", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
    return button
  }()
  
  var userView = UserView()
  
  let textSurroundingView: UIView = {
    let view = UIView()
    view.layer.borderWidth = 1
    view.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    return view
  }()
  
  var subNameChangeTextField: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .black
    tf.textColor = .white
    return tf
  }()
  
  let kidsLabel: UILabel = {
    let label = UILabel()
    label.text = "키즈용"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 17)
    return label
  }()
  
  let kidsSwitchButton: UISwitch = {
    let switchButton = UISwitch()
    return switchButton
  }()
  
  lazy var kidsStackView: UIStackView = {
    var sv = UIStackView(arrangedSubviews: [kidsLabel, kidsSwitchButton])
    sv.spacing = 15
    sv.axis = .horizontal
    sv.distribution = .fill
    return sv
  }()
  
  let deleteButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("삭제", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
    return button
  }()
  
  var userName: String?
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    addSubViews()
    navigationBarSetting()
    setFuntions()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupSNP()
    subNameChangeTextField.becomeFirstResponder()
  }
  
  private func configure() {
    view.backgroundColor = .black
    userView.profileUserName = "변경"
  }
  
  private func addSubViews() {
    [navigationView, userView, textSurroundingView, subNameChangeTextField, kidsStackView, deleteButton].forEach { view.addSubview($0) }
  }
  
  private func setupSNP() {
    
    navigationView.snp.makeConstraints {
      $0.top.equalTo(view.snp.top)
      $0.leading.equalTo(view.snp.leading)
      $0.trailing.equalTo(view.snp.trailing)
      $0.height.equalTo(UIScreen.main.bounds.height * 0.11)
    }
    
    profileChangeLabel.snp.makeConstraints {
      $0.bottom.equalTo(navigationView.snp.bottom).offset(8)
      $0.centerX.equalTo(navigationView.snp.centerX)
      $0.width.equalToSuperview().multipliedBy(0.25)
      $0.height.equalTo(profileChangeLabel.snp.width).multipliedBy(0.70)
    }
    
    saveButton.snp.makeConstraints {
      $0.centerY.equalTo(profileChangeLabel.snp.centerY)
      $0.trailing.equalTo(view.snp.trailing).offset(-15)
    }
    
    cancelButton.snp.makeConstraints {
      $0.centerY.equalTo(profileChangeLabel.snp.centerY)
      $0.leading.equalTo(view.snp.leading).offset(15)
    }
    
    userView.snp.makeConstraints {
      $0.width.equalTo(UIScreen.main.bounds.width * 0.28)
      $0.centerX.equalToSuperview()
      $0.top.equalTo(navigationView.snp.bottom).offset(40)
    }
    
    textSurroundingView.snp.makeConstraints {
      $0.top.equalTo(userView.snp.bottom).offset(30)
      $0.leading.trailing.equalToSuperview().inset(45)
      $0.height.equalTo(45)
    }
    
    subNameChangeTextField.snp.makeConstraints {
      $0.top.bottom.equalTo(textSurroundingView).inset(5)
      $0.leading.trailing.equalTo(textSurroundingView).inset(10)
    }
    
    kidsStackView.snp.makeConstraints {
      $0.top.equalTo(textSurroundingView.snp.bottom).offset(30)
      $0.centerX.equalTo(textSurroundingView.snp.centerX)
    }
    
    deleteButton.snp.makeConstraints {
      $0.top.equalTo(kidsStackView.snp.bottom).offset(30)
      $0.centerX.equalTo(textSurroundingView.snp.centerX)
    }
    
  }
  
  private func navigationBarSetting() {
    let navCon = navigationController!
    navCon.isNavigationBarHidden = true
  }
  
  @objc private func saveButtonTapped(_ sender: UIButton) {
    print("새로바뀐 유저정보 저장관련 메서드 넣어야함")
    navigationController?.popViewController(animated: true)
  }
  
  
  @objc private func cancelButtonTapped(_ sender: UIButton) {
    print("취소")
    navigationController?.popViewController(animated: true)
  }
  
}


extension ProfileChangeVC: UserViewDelegate {
  func profileChangeTapped(tag: Int) {
  }
  
  private func setFuntions() {
    userView.delegate = self
  }
  
  func didSelectUser(tag: Int) {
    
    print("여러가지 프로필 선택 화면으로 이동")
    
  }
  
}
