//
//  ViewController.swift
//  ThemeColorDemo
//
//  Created by KyleRuan on 2018/1/9.
//  Copyright © 2018年 KyleRuan. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = UIView(frame: CGRect(x: 20, y: 64, width: 100, height: 100))
        self.view.addSubview(view1)
        view1.tc_backgroundColor = .ColorNameRed
        view1.tc_themeBlock = {
            (view , type) in
            if type == .themeDay {
                view.layer.cornerRadius = 20
                view.layer.borderWidth = 2
            } else {
                view.layer.cornerRadius = 30
                view.layer.borderWidth = 2
            }
        }
        view1.tc_borderColor = .ColorNameBlue
        
        
        let switchBtn = UIButton(frame: CGRect(x: 20, y: 200, width: 200, height: 80))
        switchBtn.tc_backgroundColor = .ColorNameBlue
        switchBtn.setTitle("switch theme", for: .normal)
        switchBtn.tc_setTitleColor(.ColorNameRed, for:  .normal)
        self.view.addSubview(switchBtn)
        switchBtn.addTarget(self, action: #selector(ViewController.switchTheme), for: .touchUpInside)
    
        
        
        let imageView = UIImageView(frame: CGRect(x: 300, y: 300, width: 40, height: 40))
        imageView.set_imageName("favored", tintColor: .ColorNameRed)
        self.view.addSubview(imageView)
        
        let imageView2 = UIImageView(frame: CGRect(x: 300, y: 400, width: 40, height: 40))
        imageView2.tc_imageName = "favored"
        self.view.addSubview(imageView2)
        
        
        let themeLabel = UILabel()
        themeLabel.text = "label change"
        themeLabel.frame = CGRect(x: 20, y: 500, width: 200, height: 200)
        themeLabel.sizeToFit()
        themeLabel.tc_textColor = .ColorNameYellow
        themeLabel.tc_backgroundColor = .ColorNameOrange
        self.view.addSubview(themeLabel)
        
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.tc_setImage("favored", for: .normal)
        button.tc_setImage("home", for: .highlighted)
        button.frame = CGRect(x: 20, y: 600, width: 300, height: 200)
    
        button.tc_setTitleColor(.ColorNameRed, for: .normal)
        button.tc_setTitleColor(.ColorNameOrange, for: .highlighted)
        self.view.addSubview(button)
      
        
    }
    
    @objc func switchTheme() {
        if  ThemeManager.sharedManager.themeType == .themeDay {
            ThemeManager.sharedManager.switchTheme(type: .themeNight)
        } else {
            ThemeManager.sharedManager.switchTheme(type: .themeDay)
        }
        
    }
}

