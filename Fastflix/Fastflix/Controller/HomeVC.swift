//
//  HomeVC.swift
//  Fastflix
//
//  Created by hyeoktae kwon on 2019/07/10.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import Kingfisher

class HomeVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.backgroundColor = #colorLiteral(red: 0.158669099, green: 0.158669099, blue: 0.158669099, alpha: 1)
      tableView.separatorStyle = .none
      registerTableViewCell()

    }
  
  private func registerTableViewCell() {
    
    tableView.register(MainImageTableCell.self, forCellReuseIdentifier: "MainImageTableCell")
    tableView.register(PreviewTableCell.self, forCellReuseIdentifier: "PreviewTableCell")

  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "MainImageTableCell", for: indexPath) as! MainImageTableCell
      cell.selectionStyle = .none
      cell.mainImage.kf.setImage(with: URL(string: ImagesData.shared.imagesUrl[0]), options:
              [.processor(CroppingImageProcessor(size: CGSize(width: 414, height: 510))), .scaleFactor(UIScreen.main.scale)])
      
      cell.logoImage.kf.setImage(with: URL(string: ImagesData.shared.imagesUrl[1]), options: [.processor(DownsamplingImageProcessor(size: CGSize(width: 200, height: 200))), .cacheOriginalImage])

      return cell
      
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewTableCell", for: indexPath) as! PreviewTableCell
      cell.delegate = self
      

      cell.selectionStyle = .none
      return cell
    default:
      return UITableViewCell()
    }
  
  }
  
}
extension HomeVC: PreviewTableCellDelegate {
  func tossImageViewInfo(cell: PreviewCollectionCell) {

  }

}
