//
//  MyContentView.swift
//  Fastflix
//
//  Created by Jeon-heaji on 25/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

// 내가 찜한 콘텐츠 뷰 - data 추가
protocol MyContentViewDelegate {
  func backBtnDidTap(backBtn: UIButton)
  func scrollViewDidScroll(scrollView: UIScrollView)
}

class MyContentView: UIView {
  
  var delegate: MyContentViewDelegate?
  
  private let layout = UICollectionViewFlowLayout()
  
  let collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    return collectionView
  }()
  
  let topView: UIView = {
    let topView = UIView()
//    topView.backgroundColor = #colorLiteral(red: 0.07762928299, green: 0.07762928299, blue: 0.07762928299, alpha: 1)
    return topView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "내가 찜한 콘텐츠"
    label.textColor = .white
    return label
  }()
  
  lazy var backBtn: UIButton = {
    let buttton = UIButton(type: .system)
//    buttton.setTitle("뒤루가여", for: .normal)
    buttton.setImage(UIImage(named: "leftarrow"), for: .normal)
    buttton.tintColor = .white
    buttton.addTarget(self, action: #selector(backBtnDidTap(_:)), for: .touchUpInside)
    buttton.setTitleColor(.white, for: .normal)
    return buttton
  }()
  
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    self.backgroundColor = .clear
    addSubViews()
    setupSNP()
    setupCollectionView()
    registerCollectionViewCell()
    
  }
  
  private func addSubViews() {
    [collectionView, titleLabel]
      .forEach { self.addSubview($0) }
//    [titleLabel, backBtn]
//      .forEach { topView.addSubview($0) }
  }
  
  private func setupSNP() {
    collectionView.snp.makeConstraints {
//      $0.top.equalTo(topView.snp.bottom)
      $0.top.leading.trailing.bottom.equalToSuperview()
    }

//    topView.snp.makeConstraints {
//      $0.top.leading.width.trailing.equalToSuperview()
//      $0.height.equalToSuperview().multipliedBy(0.11)
//    }

//    backBtn.snp.makeConstraints {
//      $0.top.equalTo(UIScreen.main.bounds.height * 0.05)
//      $0.leading.equalToSuperview().inset(30)
//    }

    titleLabel.snp.makeConstraints {
      $0.top.equalTo(UIScreen.main.bounds.height * 0.05)
      $0.centerX.equalToSuperview()

    }
  }
      // MARK: - setupCollectionView
  private func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    layout.scrollDirection = .vertical
    collectionView.backgroundColor = .clear
    self.collectionView.collectionViewLayout = layout
    layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 20
     layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 4.3, height: UIScreen.main.bounds.height / 4)
    
    layout.sectionHeadersPinToVisibleBounds = true
    collectionView.showsHorizontalScrollIndicator = false
    
  }
  // registerCollectionView
  private func registerCollectionViewCell() {
    collectionView.register(MyContentCollectionCell.self, forCellWithReuseIdentifier: MyContentCollectionCell.identifier)
  }
  
  @objc func backBtnDidTap(_ sender: UIButton) {
    print("뒤로 가주세여.......")
    delegate?.backBtnDidTap(backBtn: sender)
  }

}

extension MyContentView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ImagesData.shared.myContentImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyContentCollectionCell.identifier, for: indexPath) as! MyContentCollectionCell
    cell.configure(imageUrlString: ImagesData.shared.myContentImages[indexPath.row])
    return cell
  }
  
}
extension MyContentView: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    print("indexPath.row: ", indexPath.row)
//    delegate?.didSelectItemAt(indexPath: indexPath)
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    delegate?.scrollViewDidScroll(scrollView: scrollView)
    
  }
}
