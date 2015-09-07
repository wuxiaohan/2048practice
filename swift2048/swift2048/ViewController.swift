//
//  ViewController.swift
//  swift2048
//
//  Created by wuhan on 15/8/27.
//  Copyright (c) 2015年 wuhan-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func  startGame(sender:UIButton){
        let alertView = UIAlertView()
        alertView.title = "START"
        alertView.message = "ARE YOU READY?"
        alertView.addButtonWithTitle("READY GO!")
        alertView.show()
        alertView.delegate = self
    }
    
    func alertView(alertView:UIAlertView, clickedButtonAtIndex buttonIndex:Int){
        self.presentViewController(mainTableViewController(), animated:true, completion:nil)
    }
}

