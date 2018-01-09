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
        let view1 = UIView(frame: CGRect(x: 20, y: 64, width: 200, height: 200))
        
        view1.tc_backgroundColor = TCColorName(rawValue: 3)
        self.view.addSubview(view1)
        view1.tc_backgroundColor = .ColorNameRed
        view1.tc_themeBlock = {
            (view , type) in
            if type == .themeDay {
                view.layer.cornerRadius = 10
            } else {
                view.layer.cornerRadius = 30
            }
            
            
        }
        
        let bb = UIButton(frame: CGRect(x: 20, y: 400, width: 80, height: 80))
        
        bb.tc_backgroundColor = .ColorNameBlue
        bb.setTitle("switch", for: .normal)
        bb.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(bb)
        bb.addTarget(self, action: #selector(ViewController.switchTheme), for: .touchUpInside)
        
        bb.tc_setImage("favored", for: .normal)
        bb.tc_setImage("home", for: .highlighted)
        let imageView = UIImageView(frame: CGRect(x: 300, y: 300, width: 40, height: 40))
        self.view.addSubview(imageView)
        imageView.tc_imageName = "favored"
        
    }
    
    @objc func switchTheme() {
        ThemeManager.sharedManager.switchThemeInTwoType()
    }
}
