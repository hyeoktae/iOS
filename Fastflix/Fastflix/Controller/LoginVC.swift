//
//  LoginVC.swift
//  Fastflix
//
//  Created by HongWeonpyo on 20/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
  
  // 네이게이션뷰
  lazy var navigationView: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    view.addSubview(logoView)
    view.addSubview(customerCenterButton)
    view.addSubview(backButton)
    return view
  }()
  
  // 로고
  let logoView: UIImageView = {
    let image = UIImage(named: "fastflix")
    let view = UIImageView()
    view.image = image
    view.contentMode = .scaleToFill
    return view
  }()
  
  // 고객센터 버튼
  lazy var customerCenterButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("고객 센터", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(customerCenterTapped(_:)), for: .touchUpInside)
    return button
  }()
  
  lazy var backButton: UIButton = {
    let button = UIButton(type: .system)
    let image = UIImage(named: "back")
    button.setImage(image, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.tintColor = .white
    button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
    return button
  }()
  
  let emailTextField: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    tf.layer.cornerRadius = 5
    tf.attributedPlaceholder
      = NSAttributedString(string: "  이메일 주소 또는 전화번호",attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
    tf.textColor = .white
    return tf
  }()
  
  let passwordField: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    tf.attributedPlaceholder
      = NSAttributedString(string: "  비밀번호",attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
    tf.layer.cornerRadius = 5
    tf.textColor = .white
    return tf
  }()
  
  let loginButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .clear
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    button.setTitle("로그인", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    button.addTarget(self, action: #selector(didTapLoginBtn(_:)), for: .touchUpInside)
    return button
  }()
  
  lazy var stackView: UIStackView = {
    let sview = UIStackView(arrangedSubviews: [emailTextField, passwordField, loginButton])
    sview.spacing = 18
    sview.axis = .vertical
    sview.distribution = .fill
    return sview
  }()
  
  let passwordButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .clear
    button.setTitle("비밀번호 재설정", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    return button
  }()
  
  let viewHeight: CGFloat = 48
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupSNP()
  }
  
  private func configure() {
    view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.07450980392, blue: 0.07450980392, alpha: 1)
    
    navigationBarSetting()
  }
  
  private func setupSNP() {
    [navigationView, stackView, passwordButton].forEach { view.addSubview($0)}
    
    emailTextField.snp.makeConstraints {
      $0.height.equalTo(viewHeight)
    }
    
    passwordField.snp.makeConstraints {
      $0.height.equalTo(viewHeight)
    }
    
    loginButton.snp.makeConstraints {
      $0.height.equalTo(viewHeight)
    }
    
    stackView.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.leading.equalTo(view.snp.leading).offset(30)
      $0.trailing.equalTo(view.snp.trailing).offset(-30)
    }
    
    passwordButton.snp.makeConstraints {
      $0.top.equalTo(stackView.snp.bottom).offset(10)
      $0.leading.equalTo(view.snp.leading).offset(30)
      $0.trailing.equalTo(view.snp.trailing).offset(-30)
      $0.height.equalTo(viewHeight)
    }
    
    navigationView.snp.makeConstraints {
      $0.top.equalTo(view.snp.top)
      $0.leading.equalTo(view.snp.leading)
      $0.trailing.equalTo(view.snp.trailing)
      $0.height.equalTo(UIScreen.main.bounds.height * 0.11)
    }
    
    logoView.snp.makeConstraints {
      $0.bottom.equalTo(navigationView.snp.bottom).offset(8)
      $0.centerX.equalTo(navigationView.snp.centerX)
      $0.width.equalToSuperview().multipliedBy(0.25)
      $0.height.equalTo(logoView.snp.width).multipliedBy(0.70)
    }
    
    customerCenterButton.snp.makeConstraints {
      $0.centerY.equalTo(logoView.snp.centerY)
      $0.trailing.equalTo(view.snp.trailing).offset(-15)
    }
    
    backButton.snp.makeConstraints {
      $0.centerY.equalTo(logoView.snp.centerY)
      $0.width.height.equalTo(14)
      $0.leading.equalTo(view.snp.leading).offset(20)
    }
  }
  
  private func navigationBarSetting() {
    let navCon = navigationController!
    navCon.isNavigationBarHidden = true
  }
  
  @objc private func didTapLoginBtn(_ sender: UIButton) {
    guard let id = emailTextField.text, let pw = passwordField.text else { return }
    APICenter.shared.login(id: id, pw: pw) {
      switch $0 {
      case .success(_):
        print("Login Success!!!")
      case .failure(let err):
        print("fail to login, reason: ", err)
      }
      DispatchQueue.main.async {
        AppDelegate.instance.checkLoginState()
      }
    }
  }
  
  @objc private func customerCenterTapped(_ sender: UIButton) {
    
  }
  
  @objc private func backButtonTapped(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
  
}
