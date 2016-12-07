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
        let image = UIImage.init(named: "background")
        view.backgroundColor = UIColor.init(patternImage: image!)
        
        let avatar = GRImageView.init(frame:
            CGRect.init(x: (view.frame.size.width-80)/2, y: 64, width: 80, height: 80))
        avatar.image = UIImage.init(named: "avatar")
        view .addSubview(avatar)
        avatar.isUserInteractionEnabled = true
        avatar.addDrag()
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

