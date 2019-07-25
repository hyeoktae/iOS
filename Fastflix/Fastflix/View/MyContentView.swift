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

// 내가 찜한 콘텐츠 뷰

class MyContentView: UIView {
  
  private let layout = UICollectionViewFlowLayout()
  
  let collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    return collectionView
  }()
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    addSubViews()
    setupSNP()
    setupCollectionView()
    registerCollectionViewCell()
  }
  
  private func addSubViews() {
    [collectionView]
      .forEach { self.addSubview($0) }
  }
  
  private func setupSNP() {
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
      // MARK: - setupCollectionView
  private func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    layout.scrollDirection = .vertical
    collectionView.backgroundColor = .clear
    self.collectionView.collectionViewLayout = layout
    layout.sectionInset = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.itemSize = CGSize(width: 110, height: 110)
    
    layout.sectionHeadersPinToVisibleBounds = true
    collectionView.showsHorizontalScrollIndicator = false
    
  }
  // registerCollectionView
  private func registerCollectionViewCell() {
    collectionView.register(MyContentCollectionCell.self, forCellWithReuseIdentifier: MyContentCollectionCell.identifier)
  }

}

extension MyContentView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyContentCollectionCell.identifier, for: indexPath) as! MyContentCollectionCell
    return cell
  }
  
  
}
extension MyContentView: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("indexPath.row: ", indexPath.row)
//    delegate?.didSelectItemAt(indexPath: indexPath)
  }
}
