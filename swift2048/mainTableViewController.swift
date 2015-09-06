//
//  File.swift
//  swift2048
//
//  Created by wuhan on 15/9/6.
//  Copyright (c) 2015年 wuhan-mac. All rights reserved.
//

import UIKit

class mainTableViewController:UITabBarController{
    init(){
        super.init(nibName:nil, bundle:nil)
        var viewMain = mainViewController()
        viewMain.title = "2048"
        var viewSet = setViewController()
        viewSet.title = "setting"
        
        var main = UINavigationController(rootViewController: viewMain)
        var setting = UINavigationController(rootViewController: viewSet)
        self.viewControllers = [
            main, setting
        ]
        self.selectedIndex = 0
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
