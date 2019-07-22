//
//  SeeMoreVC.swift
//  Fastflix
//
//  Created by Jeon-heaji on 18/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//
import UIKit
import SnapKit

class SeeMoreVC: UIViewController {
  
  let datas = [" 알림설정", "내가 찜한 콘텐츠", "앱설정", "계정", "개인정보", "고객 센터", "로그아웃"]
  
  let topView: UIView = {
    let topView = UIView()
    topView.backgroundColor = #colorLiteral(red: 0.07762928299, green: 0.07762928299, blue: 0.07762928299, alpha: 1)
    return topView
  }()
  
  lazy var profileBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(profileBtnDidTap(_:)), for: .touchUpInside)
    button.setImage(UIImage(named: "profile3"), for: .normal)
    button.imageView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
    return button
  }()
  
  let profileName: UILabel = {
    let label = UILabel()
    label.text = "hea"
    label.font = UIFont.systemFont(ofSize: 15, weight: .light)
    label.textColor = .gray
    return label
  }()
  
  let profileAdminBtn: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(profileAdminBtnDidTap(_:)), for: .touchUpInside)
    button.setImage(UIImage(named: "profileEdit"), for: .normal)
    button.setTitle("  프로필 관리", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    button.setTitleColor(.gray, for: .normal)
    return button
  }()
  
//  lazy var profileAddBtn: UIButton = {
//    let button = UIButton(type: .custom)
//    button.setImage(UIImage(named: "profileAdd"), for: .normal)
//    button.addTarget(self, action: #selector(profileAddBtnDidTap(_:)), for: .touchUpInside)
//    button.imageView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
//    return button
//  }()
  
  let profileAddLabel: UILabel = {
    let label = UILabel()
    label.text = "프로필 추가"
    label.font = UIFont.systemFont(ofSize: 15, weight: .light)
    label.textColor = .gray
    return label
  }()
  
  lazy var profileView: ProfileView = {
    let view = ProfileView()
    view.configure(image: UIImage(named: "profile3"), name: "hea")
    return view
  }()
  lazy var profileAddView: ProfileView = {
    let view = ProfileView()
    view.configure(image: UIImage(named: "profileAdd"), name: "프로필 추가")
    view.profileNameLabel.textColor = .gray
    view.profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileImageTapGesture(_:))))
    view.profileImageView.isUserInteractionEnabled = true
    
    return view
  }()
  
  let tableView = UITableView()
  
  lazy var profileStackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [profileView, profileAddView])
    view.axis = .horizontal
    view.distribution = .fillEqually
    view.spacing = 20
    return view
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSubViews()
    tableViewSetUp()

  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupSNP()
    
  }
  
  @objc func profileBtnDidTap(_ sender: UIButton) {
    print("profileBtnDidTap")
  }
  @objc func profileAdminBtnDidTap(_ sender: UIButton) {
    print("@@@@profileAdminBtnDidTap")
  }
  
  @objc func profileImageTapGesture(_ sender: UITapGestureRecognizer) {
    print("#####TapTapTap")
    let createProfielVC = CreateProfileVC()
    present(createProfielVC, animated: true)
    print("######Present")
  }

  
  private func tableViewSetUp() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = #colorLiteral(red: 0.1087603109, green: 0.1087603109, blue: 0.1087603109, alpha: 1)
    
  }
  
  private func addSubViews() {
    [topView, tableView].forEach { view.addSubview($0)}
    [profileStackView, profileAdminBtn].forEach {topView.addSubview($0)}
  }
  
  private func setupSNP() {
    topView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.33)
    }
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    profileStackView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.top).offset(30)
      $0.centerX.equalTo(topView.snp.centerX)
    }
    
    profileAdminBtn.snp.makeConstraints {
      $0.top.equalTo(profileStackView.snp.bottom).offset(25)
      $0.centerX.equalToSuperview()
    }

    
//    profileBtn.snp.makeConstraints {
//      $0.top.equalToSuperview().offset(60)
//      $0.centerX.equalToSuperview()
//      $0.width.height.equalTo(60)
//
//    }
//    profileName.snp.makeConstraints {
//      $0.top.equalTo(profileBtn.snp.bottom).offset(10)
//      $0.centerX.equalToSuperview()
//    }
//
//
//    profileAddBtn.snp.makeConstraints {
//      $0.top.equalToSuperview().offset(60)
//      $0.leading.equalTo(profileBtn.snp.trailing).offset(40)
//      $0.width.height.equalTo(60)
//    }
    
//    profileAddLabel.snp.makeConstraints {
//      $0.top.equalTo(profileAddBtn.snp.bottom).offset(10)
//      $0.centerX.equalTo(profileAddBtn.snp.centerX)
//    }
    
  }
  
  
}
extension SeeMoreVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datas.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.selectionStyle = .none
    
    if indexPath.row == 0 {
      cell.imageView?.image = UIImage(named: "notification")
      cell.accessoryType = .disclosureIndicator
      
    } else if indexPath.row == 1 {
      let cell2 = UITableViewCell()
      cell.backgroundColor = .black
      return cell2
    } else if indexPath.row == 2 {
      cell.imageView?.image = UIImage(named: "check")
      cell.accessoryType = .disclosureIndicator
    } else if indexPath.row == 3 {
      let cell2 = UITableViewCell()
      cell.backgroundColor = .black
      return cell2
    }
    cell.backgroundColor = #colorLiteral(red: 0.1087603109, green: 0.1087603109, blue: 0.1087603109, alpha: 1)
    tableView.separatorStyle = .none
    cell.textLabel?.text = datas[indexPath.row]
    cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    cell.textLabel?.textColor = .lightGray
    
    return cell
  }
  
}

extension SeeMoreVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 1 || indexPath.row == 3 {
      return 2
    } else {
      return 50
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard indexPath.row == datas.count - 1 else { return }
    let path = UserDefaults.standard
    path.removeObject(forKey: "token")
    AppDelegate.instance.checkLoginState()
  }
  
}
