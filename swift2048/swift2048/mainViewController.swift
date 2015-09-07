//
//  mainViewController.swift
//  swift2048
//
//  Created by wuhan on 15/9/6.
//  Copyright (c) 2015年 wuhan-mac. All rights reserved.
//

import UIKit

class mainViewController:UIViewController{
    //游戏方格维度
    var dimension:Int = 4
    //游戏过关最大值
    var maxnumber:Int = 2048
    //数字格子的宽度
    var width:CGFloat = 50
    //格子与格子的间距
    var padding:CGFloat = 6
    
    //保存背景图数据
    var backgrounds:Array<UIView>
    
    init(){
        self.backgrounds = Array<UIView>()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
    }
    
    func setupBackground(){
        var x:CGFloat = 30
        var y:CGFloat = 150
        
        for i in 0...dimension-1{
            y = 150
            for j in 0...dimension-1{
                var background = UIView(frame: CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                
                self.view.addSubview(background)
                backgrounds.append(background)
                y += padding + width
            }
            x += padding + width
        }
    }
}
