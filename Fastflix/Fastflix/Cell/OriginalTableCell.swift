//
//  OriginalTableCell.swift
//  Fastflix
//
//  Created by Jeon-heaji on 15/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//


import UIKit
import SnapKit
import Kingfisher

protocol OriginalTableCellDelegate: class {
  func originalDidSelectItemAt(indexPath: IndexPath)
}

class OriginalTableCell: UITableViewCell {
  
  static let identifier = "OriginalTableCell"
  
  let sectionHeaderlabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = "Netflix 오리지널 >"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    return label
  }()
  
  let layout = UICollectionViewFlowLayout()
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  weak var delegate: OriginalTableCellDelegate?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = .clear
    addSubViews()
    snpLayout()
    collectionviewSetUp()
    collectionView.register(OriginalCollectionCell.self, forCellWithReuseIdentifier: OriginalCollectionCell.identifier)
  }
  
  // MARK: - addSubViews
  private func addSubViews() {
    [collectionView, sectionHeaderlabel].forEach { self.addSubview($0)}
  }
  
  // MARK: - snapKitLayout
  private func snpLayout() {
    
    contentView.snp.makeConstraints {
      $0.height.equalTo(370)
    }
    
    sectionHeaderlabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalTo(10)
    }
    
    collectionView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.top.equalTo(sectionHeaderlabel.snp.bottom).offset(10)
    }
    
  }
  
  private func collectionviewSetUp() {
    layout.scrollDirection = .horizontal
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .clear
    self.collectionView.collectionViewLayout = layout
    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    layout.minimumLineSpacing = 7
    layout.minimumInteritemSpacing = 7
    layout.itemSize = CGSize(width: 170, height: 370)
    
    layout.sectionHeadersPinToVisibleBounds = true
    collectionView.showsHorizontalScrollIndicator = false
  }
  
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
extension OriginalTableCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ImagesData.shared.originalImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OriginalCollectionCell.identifier, for: indexPath) as! OriginalCollectionCell
    cell.originalImageView.kf.setImage(with: URL(string: ImagesData.shared.originalImages[indexPath.row]), options: [.processor(CroppingImageProcessor(size: CGSize(width: 170, height: 300))), .scaleFactor(UIScreen.main.scale)])
    return cell
  }
  
  
}

extension OriginalTableCell: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("indexPath.row: ", indexPath.row)
    delegate?.originalDidSelectItemAt(indexPath: indexPath)
    
  }
}

