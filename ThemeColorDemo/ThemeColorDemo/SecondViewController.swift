//
//  SecondViewController.swift
//  ThemeColorDemo
//
//  Created by KyleRuan on 2018/1/9.
//  Copyright © 2018年 KyleRuan. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = UIView(frame: CGRect(x: 80, y: 80, width: 150, height: 150))
        view1.tc_backgroundColor = .ColorNameRed
        self.view.addSubview(view1)
        let btn = UIButton(frame: CGRect(x: 20, y: 400, width: 80, height: 80))
        btn.tc_setTitleColor(.ColorNameBlue, for: .normal)
        btn.tc_themeBlock = {
            (view ,type) in
            guard let button = view as? UIButton else {
                return
            }
            if type == .themeDay {
                button.setTitle("day", for: .normal)
            } else {
                button.setTitle("night", for: .normal)
            }
        }
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(SecondViewController.switchTheme), for: .touchUpInside)
    }
    
    @objc func switchTheme() {
        ThemeManager.sharedManager.switchThemeInTwoType()
    }
}
