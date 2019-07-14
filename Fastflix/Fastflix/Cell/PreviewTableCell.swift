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
  func tossImageViewInfo(cell: PreviewCollectionCell)
}

class PreviewTableCell: UITableViewCell {
  
  let layout = UICollectionViewFlowLayout()
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  weak var delegate: PreviewTableCellDelegate?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    
    self.addSubview(collectionView)
    backgroundColor = .blue
    layout.scrollDirection = .horizontal
    
    //collectionView register
    collectionView.register(PreviewCollectionCell.self, forCellWithReuseIdentifier: "PreviewCollectionCell")
    collectionView.dataSource = self
    collectionView.delegate = self
    self.collectionView.collectionViewLayout = layout
    snp()
    
  }
  private func collectionviewSetUp() {
    layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    layout.minimumLineSpacing = 15
    layout.minimumInteritemSpacing = 15
    layout.itemSize = CGSize(width: 170, height: 170)
    
  }
  
  private func snp() {
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(200)
    }
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
  

}

extension PreviewTableCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewCollectionCell", for: indexPath) as! PreviewCollectionCell
    cell.delegate = self
    cell.preImageView.kf.setImage(with: URL(string: ImagesData.shared.imagesUrl[2]), options:
      [.processor(CroppingImageProcessor(size: CGSize(width: 200, height: 300))),
      .scaleFactor(UIScreen.main.scale)])
    delegate?.tossImageViewInfo(cell: cell.self)
    return cell
  }
  
  
  
}

extension PreviewTableCell: UICollectionViewDelegate {
  
}

extension PreviewTableCell: PreviewCollectionCellDelegate {
  func tossInfo(cell: PreviewCollectionCell) {
    
  }
  
}
