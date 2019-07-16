//
//  HomeVC.swift
//  Fastflix
//
//  Created by hyeoktae kwon on 2019/07/10.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import Kingfisher
import AVKit

class HomeVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.backgroundColor = #colorLiteral(red: 0.07762928299, green: 0.07762928299, blue: 0.07762928299, alpha: 1)
      tableView.separatorStyle = .none
      registerTableViewCell()

    }
  
  private func registerTableViewCell() {
    
    tableView.register(MainImageTableCell.self, forCellReuseIdentifier: "MainImageTableCell")
    tableView.register(PreviewTableCell.self, forCellReuseIdentifier: "PreviewTableCell")
    tableView.register(OriginalTableCell.self, forCellReuseIdentifier: "OriginalTableViewCell")

  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "MainImageTableCell", for: indexPath) as! MainImageTableCell
      cell.selectionStyle = .none
      cell.mainImage.kf.setImage(with: URL(string: ImagesData.shared.imagesUrl[0]), options: [.processor(CroppingImageProcessor(size: CGSize(width: 414, height: 600))), .scaleFactor(UIScreen.main.scale)])

      cell.logoImage.kf.setImage(with: URL(string: ImagesData.shared.imagesUrl[1]), options: [.processor(DownsamplingImageProcessor(size: CGSize(width: 200, height: 200))), .cacheOriginalImage])

      return cell
      
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewTableCell", for: indexPath) as! PreviewTableCell
      cell.delegate = self
      cell.selectionStyle = .none
      
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: "OriginalTableViewCell", for: indexPath) as! OriginalTableCell
      cell.selectionStyle = .none
      cell.delegate = self
      return cell
    default:
      return UITableViewCell()
    }
  
  }
  
}
extension HomeVC: PreviewTableCellDelegate {
  func didSelectItemAt(indexPath: IndexPath) {
      let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/test-64199.appspot.com/o/%E1%84%82%E1%85%A6%E1%86%BA%E1%84%91%E1%85%B3%E1%86%AF%E1%84%85%E1%85%B5%E1%86%A8%E1%84%89%E1%85%B3%E1%84%86%E1%85%B5%E1%84%85%E1%85%B5%E1%84%87%E1%85%A9%E1%84%80%E1%85%B5%E1%84%80%E1%85%A1%E1%84%8B%E1%85%A9%E1%84%80%E1%85%A2%E1%86%AF2.mp4?alt=media&token=96a3f3ef-3ff9-4f05-9675-2f13232a72cf")!
      
      let playerVC = AVPlayerViewController()
      let player = AVPlayer(url: url)
      playerVC.player = player
      
      present(playerVC, animated: true) {
        playerVC.player?.play()
      }
  }
}

extension HomeVC: OriginalTableCellDelegate {
  func originalDidSelectItemAt(indexPath: IndexPath) {
    let detailVC = DetailTableVC()
    present(detailVC, animated: true)
  }
  
}
