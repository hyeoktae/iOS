//
//  PreviewCell.swift
//  Fastflix
//
//  Created by Jeon-heaji on 12/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

protocol PreviewTableCellDelegate: class {
  func didSelectItemAt(indexPath: IndexPath)
}

class PreviewTableCell: UITableViewCell {
  
  static let identifier = "PreviewTableCell"
  
  let layout = UICollectionViewFlowLayout()
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  let sectionHeaderlabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = "미리보기"
    label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    return label
  }()
  
  weak var delegate: PreviewTableCellDelegate?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.backgroundColor = .clear
 
    //collectionView register
    collectionView.register(PreviewCollectionCell.self, forCellWithReuseIdentifier: PreviewCollectionCell.identifier)
    addSubViews()
    snpLayout()
    collectionviewSetUp()
  }
  
  // MARK: - addSubViews
  private func addSubViews() {
    [collectionView, sectionHeaderlabel].forEach { self.addSubview($0)}
  }
  // MARK: - collectionViewSetUp
  private func collectionviewSetUp() {
    layout.scrollDirection = .horizontal
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .clear
    self.collectionView.collectionViewLayout = layout
    layout.sectionInset = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.itemSize = CGSize(width: 110, height: 110)
    
    layout.sectionHeadersPinToVisibleBounds = true
    collectionView.showsHorizontalScrollIndicator = false
  }
  // MARK: - snpkitLayout
  private func snpLayout() {
    collectionView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(180)
      $0.top.equalToSuperview()
    }
    sectionHeaderlabel.snp.makeConstraints {
      $0.top.trailing.equalToSuperview().offset(10)
      $0.leading.equalTo(10)
      $0.height.equalTo(5)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
}

extension PreviewTableCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ImagesData.shared.originalImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCollectionCell.identifier, for: indexPath) as! PreviewCollectionCell
    cell.preImageView.image = UIImage(named: "preViewFace2")
    return cell
  }
  
}

extension PreviewTableCell: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("indexPath.row: ", indexPath.row)
    delegate?.didSelectItemAt(indexPath: indexPath)
    
  }
}
