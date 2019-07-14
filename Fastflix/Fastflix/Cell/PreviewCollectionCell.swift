//
//  PriviewCollectionCell.swift
//  Fastflix
//
//  Created by Jeon-heaji on 12/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit

protocol PreviewCollectionCellDelegate: class {
  func tossInfo(cell:PreviewCollectionCell )
}
class PreviewCollectionCell: UICollectionViewCell {
  
  let preImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = imageView.frame.height / 2
    imageView.layer.borderWidth = 1.5
    imageView.layer.borderColor = UIColor.blue.cgColor
    imageView.clipsToBounds = true
    return imageView
  }()
  
  weak var delegate: PreviewCollectionCellDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    self.addSubview(preImageView)
    snp()
    delegate?.tossInfo(cell: self)
    
  }
  
  private func snp() {
    preImageView.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview()
      
    }
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
