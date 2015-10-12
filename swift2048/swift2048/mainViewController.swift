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
        getNumber()
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
    
    func getNumber() {
        var seedNumber = [2,4]
        let randv = Int(arc4random_uniform(10))
        println(randv)
        var seed:Int = 2
        if randv == 1 {
            seed = 4
        }
        let col = Int(arc4random_uniform(UInt32(dimension)))
        let row = Int(arc4random_uniform(UInt32(dimension)))
        insertTile((row,col), value:seed)
    }
    
    
    func insertTile(pos:(Int,Int), value:Int) {
        let (row, col) = pos;
        let x = 30 + CGFloat(col) * (width + padding)
        let y = 150 + CGFloat(row) * (width + padding)
        
        let tile = TileView(pos:CGPointMake(x, y), width: width, value: value)
        self.view.addSubview(tile)
        self.view.bringSubviewToFront(tile)
        
        tile.layer.setAffineTransform(CGAffineTransformMakeScale(0.1, 0.1))
        UIView.animateWithDuration(0.3, delay:0.1, options:
            UIViewAnimationOptions.TransitionNone, animations:{
            ()-> Void in
            tile.layer.setAffineTransform(CGAffineTransformMakeScale(1, 1))
        },
            completion: {
                (finished:Bool) -> Void in
                UIView.animateWithDuration(0.08, animations: {
                    () -> Void  in
                        tile.layer.setAffineTransform(CGAffineTransformIdentity)
                })
        })
    }
}
