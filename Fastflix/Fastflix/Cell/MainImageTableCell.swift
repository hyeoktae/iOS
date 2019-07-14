//
//  MainImageCell.swift
//  Fastflix
//
//  Created by Jeon-heaji on 11/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class MainImageTableCell: UITableViewCell {
  
  var stackView = UIStackView()
  var textStackView = UIStackView()
  
  let mainImage: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    return image
  }()
  
  let logoImage: UIImageView = {
    let image = UIImageView()
    return image
  }()
  
  let movieDetailLabel: UILabel = {
    let label = UILabel()
    label.text = " 환생 ･ 한국 작품 ･ 판타지 영화 ･ 타임리미트 ･ 블록버스터 "
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    return label
  }()
  
  lazy var pokeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "add"), for: .normal)
    button.setImage(UIImage(named: "poke"), for: .selected)
    button.addTarget(self, action: #selector(pokeBtnDidTap(_:)), for: .touchUpInside)
    return button
  }()
  
  let playButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "play"), for: .normal)
    return button
  }()
  
  let infoButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "info"), for: .normal)
    return button
  }()
  
  let textBelowPokeBtn: UILabel = {
    let text = UILabel()
    text.font = UIFont.systemFont(ofSize: 9, weight: .regular)
    text.textColor = .gray
    text.text = "내가 찜한 콘텐츠"
    text.textAlignment = .center
    return text
  }()
  
  let textBelowinfoBtn: UILabel = {
    let text = UILabel()
    text.font = UIFont.systemFont(ofSize: 9, weight: .regular)
    text.textColor = .gray
    text.text = "정보"
    text.textAlignment = .center
    return text
  }()
  let blurImage: UIImageView = {
    let blurImage = UIImageView()
    blurImage.image = UIImage(named: "navshadow")
    return blurImage
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubViews()
    snpLayout()
    
    // stackView
    stackView = UIStackView(arrangedSubviews: [pokeButton, playButton, infoButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 50
    
    textStackView = UIStackView(arrangedSubviews: [textBelowPokeBtn, textBelowinfoBtn])
    textStackView.axis = .horizontal
    textStackView.distribution = .fillEqually
    textStackView.spacing = 205
    
    self.addSubview(stackView)
    self.addSubview(textStackView)
    
    stackView.snp.makeConstraints {
      $0.top.equalTo(movieDetailLabel.snp.bottom).offset(20)
      $0.centerX.equalToSuperview()
    }
    
    textStackView.snp.makeConstraints {
      $0.top.equalTo(stackView.snp.bottom)
      $0.centerX.equalTo(self)
    }

  }
  // addSubViews
  private func addSubViews() {
    let views = [mainImage, movieDetailLabel, logoImage , blurImage]
    views.forEach { self.addSubview($0)}
    
  }
  // snp
  private func snpLayout() {
    mainImage.snp.makeConstraints {
      $0.left.right.bottom.equalToSuperview()
      $0.top.equalToSuperview().offset(-44)
      $0.height.equalTo(600)

    }
    logoImage.snp.makeConstraints {
      $0.top.equalTo(self).offset(320)
      $0.centerX.equalTo(self)
      $0.height.equalTo(100)
      $0.width.equalTo(230)
    
    }
    movieDetailLabel.snp.makeConstraints {
      $0.top.equalTo(logoImage.snp.bottom).offset(15)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(30)
    }

    blurImage.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(-80)
      $0.bottom.equalToSuperview()
      $0.width.equalTo(650)
      $0.top.equalTo(logoImage.snp.top).offset(-50)
      
    }
    
  }
  
  @objc func pokeBtnDidTap(_ sender: UIButton) {
    print("나온나")
    UIView.animate(withDuration: 0.3) {
      self.pokeButton.alpha = 0
    }
    sender.isSelected.toggle()
    UIView.animate(withDuration: 0.3) {
      self.pokeButton.alpha = 1
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
