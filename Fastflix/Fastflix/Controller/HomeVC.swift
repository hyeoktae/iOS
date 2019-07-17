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
  
  let streamingCell = StreamingCell()
  let mainImageCell = MainImageTableCell()
  let preViewCell = PreviewTableCell()
  let originalCell = OriginalTableCell()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.backgroundColor = #colorLiteral(red: 0.07762928299, green: 0.07762928299, blue: 0.07762928299, alpha: 1)
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
    tableView.showsVerticalScrollIndicator = false
    registerTableViewCell()
    
  }
  
  private func registerTableViewCell() {
    
//    tableView.register(MainImageTableCell.self, forCellReuseIdentifier: MainImageTableCell.identifier)
//    tableView.register(PreviewTableCell.self, forCellReuseIdentifier: PreviewTableCell.identifier)
//    tableView.register(OriginalTableCell.self, forCellReuseIdentifier: OriginalTableCell.identifier)
//
//    tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    
    streamingCell.configure(url: "http://movietrailers.apple.com/movies/lucasfilm/star-wars-the-last-jedi/the-last-jedi-worlds-of-the-last-jedi_i320.m4v")
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = mainImageCell
      cell.selectionStyle = .none
      cell.mainImage.kf.setImage(with: URL(string: ImagesData.shared.imagesUrl[0]), options: [.processor(CroppingImageProcessor(size: CGSize(width: 414, height: 600))), .scaleFactor(UIScreen.main.scale)])
      
      cell.logoImage.kf.setImage(with: URL(string: ImagesData.shared.imagesUrl[1]), options: [.processor(DownsamplingImageProcessor(size: CGSize(width: 200, height: 200))), .cacheOriginalImage])
      
      return cell
      
    case 1:
      let cell = preViewCell
      cell.delegate = self
      cell.selectionStyle = .none
      
      return cell
      
    case 5:
      let cell = streamingCell
      return cell
      
    case 7:
      let cell = originalCell
      cell.selectionStyle = .none
      cell.delegate = self
      return cell
      
    default:
      let cell = MainCell()
      cell.configure(url: imageUrls, title: "\(indexPath)")
      
      return cell
    }
    
  }
  
//  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    if indexPath == [0,0] {
//      return 630
//    } else if indexPath == [0,1] {
//      return 110
//    } else if indexPath == [0,5] {
//      return self.view.frame.height / 2.5
//    } else if indexPath == [0,7] {
//      return 400
//    } else {
//      return self.view.frame.height / 3.5
//    }
//  }
  
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
//    let detailVC = DetailTableVC()
    let detailVC = DetailVC()
    print("present DetailVC")
    present(detailVC, animated: true)
  }
  
}
