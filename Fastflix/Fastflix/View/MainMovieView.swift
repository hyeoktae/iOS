//
//  MainMovieView.swift
//  Fastflix
//
//  Created by Jeon-heaji on 23/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class MainMovieView: UIView {
  
  private let tableView = UITableView()
  
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    addSubViews()
    setupSNP()
    setupTableView()
    registerTableViewCell()
  }
  
  private func setupTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = #colorLiteral(red: 0.07762928299, green: 0.07762928299, blue: 0.07762928299, alpha: 1)
    tableView.separatorStyle = .none
    tableView.allowsSelection = false

  }
  
  private func registerTableViewCell() {
    tableView.register(MainImageTableCell.self, forCellReuseIdentifier: MainImageTableCell.identifier)
    tableView.register(PreviewTableCell.self, forCellReuseIdentifier: PreviewTableCell.identifier)
    tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    
  }
  
  private func addSubViews() {
    [tableView]
      .forEach { self.addSubview($0) }
  }

  private func setupSNP() {
    tableView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  

}

extension MainMovieView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: MainImageTableCell.identifier, for: indexPath) as! MainImageTableCell
      cell.selectionStyle = .none
      cell.movieDetailLabel.text = " 음악 ･ 마법을 걸어요 ･ 동화 ･ 사랑 ･ 걸파워 ･ 할리우드 영화 "
      cell.configure(imageURLString: ImagesData.shared.imagesUrl[5], logoImageURLString: ImagesData.shared.imagesUrl[6])
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: PreviewTableCell.identifier, for: indexPath) as! PreviewTableCell
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as! MainCell
      cell.configure(url: imageUrls, title: "\(indexPath)")
      return cell
    }
  }
  
  
}

extension MainMovieView: UITableViewDelegate {
  
}
