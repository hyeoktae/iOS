//
//  ProfileSelectVC.swift
//  Fastflix
//
//  Created by HongWeonpyo on 24/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ProfileSelectVC: UIViewController {

  // 네이게이션뷰
  lazy var navigationView: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    view.addSubview(logoView)
    view.addSubview(changeButton)
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
  
  // 변경 버튼
  lazy var changeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("변경", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(changeButtonTapped(_:)), for: .touchUpInside)
    return button
  }()
  
  // 안내문구
  let introlabel: UILabel = {
    let label = UILabel()
    label.text = "Netflix를 시청할 프로필을 선택하세요."
    label.font = UIFont.systemFont(ofSize: 20, weight: .light)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  
  var profileImageView1 = UserView()
  var profileImageView2 = UserView()
  var profileImageView3 = UserView()
  var profileImageView4 = UserView()
  var profileImageView5 = UserView()
  var addProfileView = AddProfileView()
  
  var numberOfUsers: Int = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    addSubViews()
    navigationBarSetting()
    setUsers()
    setFuntions()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupSNP()
    setupProfileLayout()
  }
  
  private func configure() {
    view.backgroundColor = .black
  }
  
  private func addSubViews() {
    [navigationView, introlabel, profileImageView1, profileImageView2, profileImageView3, profileImageView4, profileImageView5, addProfileView].forEach { view.addSubview($0) }
  }
  
  private func setupSNP() {
    
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
    
    changeButton.snp.makeConstraints {
      $0.centerY.equalTo(logoView.snp.centerY)
      $0.trailing.equalTo(view.snp.trailing).offset(-15)
    }
    
    introlabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(navigationView.snp.bottom).offset(35)
    }
    
    profileImageView1.snp.makeConstraints {
      $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
      $0.centerX.equalToSuperview().offset(-70)
      $0.top.equalTo(introlabel.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
    }
    
    profileImageView2.snp.makeConstraints {
      $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
      $0.centerX.equalToSuperview().offset(70)
      $0.top.equalTo(introlabel.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
    }
    
    profileImageView3.snp.makeConstraints {
      $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
      $0.centerX.equalToSuperview().offset(-70)
      $0.top.equalTo(profileImageView1.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
    }
    
    profileImageView4.snp.makeConstraints {
      $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
      $0.centerX.equalToSuperview().offset(70)
      $0.top.equalTo(profileImageView1.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
    }
    
    profileImageView5.snp.makeConstraints {
      $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
      $0.centerX.equalToSuperview()
      $0.top.equalTo(profileImageView3.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
    }
  }
  
  func setupProfileLayout() {
    
    switch numberOfUsers {
    case 1:
      profileImageView2.isHidden = true
      profileImageView3.isHidden = true
      profileImageView4.isHidden = true
      profileImageView5.isHidden = true
      addProfileView.snp.makeConstraints {
        $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
        $0.centerX.equalToSuperview().offset(70)
        $0.top.equalTo(introlabel.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
      }
    case 2:
      profileImageView3.isHidden = true
      profileImageView4.isHidden = true
      profileImageView5.isHidden = true
      addProfileView.snp.makeConstraints {
        $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
        $0.centerX.equalToSuperview()
        $0.top.equalTo(profileImageView1.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
      }
    case 3:
      profileImageView4.isHidden = true
      profileImageView5.isHidden = true
      addProfileView.snp.makeConstraints {
        $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
        $0.centerX.equalToSuperview().offset(70)
        $0.top.equalTo(profileImageView1.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
      }
    case 4:
      profileImageView5.isHidden = true
      addProfileView.snp.makeConstraints {
        $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
        $0.centerX.equalToSuperview()
        $0.top.equalTo(profileImageView3.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
      }
    case 5:
      addProfileView.snp.makeConstraints {
        $0.width.equalTo(UIScreen.main.bounds.width * 0.32)
        $0.centerX.equalToSuperview()
        $0.top.equalTo(profileImageView3.snp.bottom).offset(UIScreen.main.bounds.height * 0.03)
      }
      addProfileView.isHidden = true
    default:
      addProfileView.isHidden = true
    }
  }
  
  func setUsers() {
    let users = APICenter.shared.path.array(forKey: "Users")
    numberOfUsers = users?.count ?? 1
  
//    profileImageView1.profileUserName = users?[0].id ?? "테스트"
//    profileImageView2.profileUserName = user2 ?? "테스트"
//    profileImageView3.profileUserName = user3 ?? "테스트"
//    profileImageView4.profileUserName = user4 ?? "테스트"
//    profileImageView5.profileUserName = user5 ?? "테스트"
  
  }
  
  
  private func navigationBarSetting() {
    let navCon = navigationController!
    navCon.isNavigationBarHidden = true
  }
  
  @objc private func changeButtonTapped(_ sender: UIButton) {
    
  }
  
}

extension ProfileSelectVC: UserViewDelegate {
  private func setFuntions() {
    profileImageView1.delegate = self
    profileImageView2.delegate = self
    profileImageView3.delegate = self
    profileImageView4.delegate = self
    profileImageView5.delegate = self
  }
  
  func didSelectUser(id: String) {
    let tabBar = MainTabBarController()
    present(tabBar, animated: false)
  }
}
