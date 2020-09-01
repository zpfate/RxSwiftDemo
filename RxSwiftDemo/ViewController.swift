//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Twisted Fate on 2020/8/28.
//  Copyright © 2020 Twisted Fate. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {

    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nameTipsLabel: UILabel!
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBOutlet weak var pwdTipsLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
  
        /// 用户名是否有效
        let usernameValid = nameTextField.rx.text.orEmpty.map { (text) -> Bool in
            /// 名字长度大于5
            return text.count > 5
        }.share(replay: 1, scope: SubjectLifetimeScope.forever)
                
        /// 用户名是否有效 -> 密码输入框是否可用
        usernameValid.bind(to: pwdTextField.rx.isEnabled).disposed(by: disposeBag)
        
        /// 用户名提示语是否显示
        usernameValid.bind(to: nameTipsLabel.rx.isHidden).disposed(by: disposeBag)
        
        /// 判断密码是否有效
        let passwordValid = pwdTextField.rx.text.orEmpty.map { (text) -> Bool in
            return text.count > 5
        }.share(replay: 1)
        
        /// 密码提示语是否显示
        passwordValid.bind(to: pwdTipsLabel.rx.isHidden).disposed(by: disposeBag)
        
        /// 密码提示语是否显示
        passwordValid.bind(to: pwdTipsLabel.rx.isHidden).disposed(by: disposeBag)
        
        
        let valid = Observable.combineLatest(usernameValid, passwordValid)
        
        /// 两者是否都可以
        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }.share(replay: 1)
        
        /// 用户名提示有效决定按钮是否可点击
        everythingValid.bind(to: loginBtn.rx.isEnabled).disposed(by: disposeBag)
        
    }
    
    
    func btnRxUsage() -> () {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.backgroundColor = .red
        btn.rx.tap.subscribe { (oNext) in
         print("act ++++++++++++")
        }.disposed(by: disposeBag)
        view.addSubview(btn)
    }
}

