//
//  LoginVC.swift
//  Fastflix
//
//  Created by HongWeonpyo on 18/07/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tf.placeholder = "이메일 주소 또는 전화번호"
        return tf
    }()
    
    let passwordField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tf.placeholder = "비밀번호"
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let sview = UIStackView(arrangedSubviews: [emailTextField, passwordField, loginButton])
        sview.spacing = 15
        sview.axis = .vertical
        sview.distribution = .fill
        return sview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        makeConstraints()
    }

    private func configure() {
        view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.07450980392, blue: 0.07450980392, alpha: 1)
        
    }

    private func makeConstraints() {
        [stackView].forEach { view.addSubview($0)}
        
        emailTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        passwordField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        stackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalTo(view.snp.leading).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-30)
        }
        
    }
    
    
}
