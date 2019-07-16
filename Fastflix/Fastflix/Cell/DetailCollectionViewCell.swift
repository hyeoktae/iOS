//
//  DetailCollectionViewCell.swift
//  Fastflix
//
//  Created by HongWeonpyo on 17/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        makeConstaints()
    }
    
    private func configure() {
        self.backgroundColor = .clear
    }
    
    private func makeConstaints() {
        self.addSubview(detailImageView)
        
        detailImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
