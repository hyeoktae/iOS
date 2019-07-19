//
//  BeforeLoginVC.swift
//  Fastflix
//
//  Created by HongWeonpyo on 20/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import SnapKit

class BeforeLoginVC: UIViewController, UIScrollViewDelegate {
    
    // 스크롤뷰
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .black
        return sv
    }()
    
    // 네이게이션뷰
    lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(logoView)
        view.addSubview(customerCenterButton)
        return view
    }()
    
    // 로고
    let logoView: UIImageView = {
        let image = UIImage(named: "fastflix")
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleToFill
        return view
    }()
    
    // 고객센터 버튼
    lazy var customerCenterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("고객 센터", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(customerCenterTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    // 스크롤되는 화면
    let firstView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()
    let introView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "intro1")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let introView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "intro2")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let introView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "intro3")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // 첫화면 안내문구
    let introlabel1: UILabel = {
        let label = UILabel()
        label.text = "찾아주셔서 감사합니다."
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let introlabel2: UILabel = {
        let label = UILabel()
        label.text = """
        앱 내에서는 Netflix에 가입할 수
        없습니다. 번거로우시겠지만, 회원 가입
        완료 후 앱을 통해 TV 프로그램과 영화를
        시청하세요.
        """
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 4
        return label
    }()
    
    // 하단 로그인 버튼
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .red
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(loginButtonDidTap(_:)), for: .touchUpInside)
        return button
    }()
    
    // 페이지 컨트롤
    lazy var pageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.tintColor = UIColor.gray
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.currentPage = 0
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewSetting()
        makeConstraints()
        navigationBarSetting()
    }
    
    private func makeConstraints() {
        
        [scrollView, loginButton, navigationView, pageControl].forEach { view.addSubview($0) }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.bottom.equalTo(view.snp.bottom)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(45)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(UIScreen.main.bounds.height * 0.11)
        }
        
        logoView.snp.makeConstraints {
            $0.bottom.equalTo(navigationView.snp.bottom).offset(8)
            $0.centerX.equalTo(navigationView.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.height.equalTo(logoView.snp.width).multipliedBy(0.70)
        }
        
        customerCenterButton.snp.makeConstraints {
            $0.centerY.equalTo(logoView.snp.centerY)
            $0.trailing.equalTo(view.snp.trailing).offset(-15)
        }
        
        pageControl.snp.makeConstraints {
            $0.bottom.equalTo(loginButton.snp.top).offset(-10)
            $0.centerX.equalTo(loginButton.snp.centerX)
            $0.width.equalTo(50)
            $0.height.equalTo(30)
        }
        
        //스크롤뷰 관련
        [firstView, introView1, introView2, introView3].forEach { scrollView.addSubview($0) }
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(scrollView.snp.height)
            $0.bottom.equalTo(scrollView.snp.bottom)
        }
        
        introView1.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.top)
            $0.leading.equalTo(firstView.snp.trailing)
            $0.width.equalTo(firstView.snp.width)
            $0.height.equalTo(firstView.snp.height)
            $0.bottom.equalTo(firstView.snp.bottom)
        }
        
        introView2.snp.makeConstraints {
            $0.top.equalTo(introView1.snp.top)
            $0.leading.equalTo(introView1.snp.trailing)
            $0.width.equalTo(introView1.snp.width)
            $0.height.equalTo(introView1.snp.height)
            $0.bottom.equalTo(introView1.snp.bottom)
        }
        
        introView3.snp.makeConstraints {
            $0.top.equalTo(introView2.snp.top)
            $0.leading.equalTo(introView2.snp.trailing)
            $0.width.equalTo(introView2.snp.width)
            $0.height.equalTo(introView2.snp.height)
            $0.bottom.equalTo(introView2.snp.bottom)
            $0.trailing.equalTo(scrollView.snp.trailing)
        }
        
        [introlabel1, introlabel2].forEach { firstView.addSubview($0) }
        
        introlabel1.snp.makeConstraints {
            $0.centerX.equalTo(firstView.snp.centerX)
            $0.centerY.equalTo(view.snp.top).offset(370)
        }
        
        introlabel2.snp.makeConstraints {
            $0.top.equalTo(introlabel1.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        
    }
    
    
    private func navigationBarSetting() {
        let navCon = navigationController!
        navCon.isNavigationBarHidden = true
    }
    
    private func scrollViewSetting() {
        scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 3, height: self.scrollView.frame.size.height)
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
    }
    
    @objc private func loginButtonDidTap(_ sender: UIButton) {
        let loginVC = LoginVC()
        navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    
    @objc private func customerCenterTapped(_ sender: UIButton) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // contentOffset은 현재 스크롤된 좌표
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        //        pageControl.currentPage = Int(pageNumber)
    }
}
