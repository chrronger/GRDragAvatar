//
//  ViewController.swift
//  GRDragAvatar
//
//  Created by 希 Guan on 2016/12/6.
//  Copyright © 2016年 ower[]. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "background")
        view.backgroundColor = UIColor(patternImage: image!)
        
        let avatar = GRImageView(frame:
            CGRect(x: (view.frame.size.width-80)/2, y: 64, width: 80, height: 80))
        avatar.image = UIImage(named: "avatar")
        view .addSubview(avatar)
        avatar.isUserInteractionEnabled = true
        avatar.addDrag()
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

