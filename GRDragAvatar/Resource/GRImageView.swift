//
//  GRImageView.swift
//  GRDragAvatar
//
//  Created by 希 Guan on 2016/12/7.
//  Copyright © 2016年 ower[]. All rights reserved.
//

import UIKit

class GRImageView: UIImageView {

    var playView = UIView()
    var priDamping:CGFloat = 0.0
    var panGesture = UIPanGestureRecognizer()
    var animator = UIDynamicAnimator()
//    var snapBehavior = UISnapBehavior()
//    var attchmentBehavior = UIAttachmentBehavior()
    var centerPoint = CGPoint()
    
    lazy var snapBehavior:UISnapBehavior = {
        let snapBehavior = UISnapBehavior.init(item: self, snapTo: self.centerPoint)
        snapBehavior.damping = self.priDamping
        return snapBehavior
    }()
 
    lazy var attchmentBehavior:UIAttachmentBehavior = {
        
        
        
       let attchmentBehavior = UIAttachmentBehavior.init(item: self, offsetFromCenter: UIOffset(), attachedToAnchor: CGPoint())
        return attchmentBehavior
    }()
    
    open func addDragToView(_ toView:UIView,_ damping:CGFloat){
        
        removeDrag()
        playView = toView
        priDamping = damping
        
        initAnimator()
        addPanGesture()
        
    }

    
    func addDrag(){
        assert((self.superview != nil), "Super view is required when make view draggable")
        
        addDragToView(self.superview!, 0.4)
    }
    
     func removeDrag(){
        removeGestureRecognizer(panGesture)
        centerPoint = CGPoint.zero
    }
    
     func initAnimator(){
        animator = UIDynamicAnimator.init(referenceView: playView)
        
        updateSnapPoint()
    }
    
     func addPanGesture(){
        panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(didPanGesture(_:)))
        addGestureRecognizer(panGesture)
    }
    
     func updateSnapPoint(){
        centerPoint = self.convert(CGPoint.init(x: self.bounds.size.width/2, y: self.bounds.size.height/2), to: playView)
        snapBehavior = UISnapBehavior.init(item: self, snapTo: centerPoint)
        snapBehavior.damping = priDamping
    }
    
     func didPanGesture(_ pan:UIPanGestureRecognizer){
        let panLocation = pan.location(in: playView)
        if pan.state == .began {
            updateSnapPoint()
            let offset = UIOffset.init(horizontal: panLocation.x - centerPoint.x, vertical: panLocation.y - centerPoint.y)
            animator.removeAllBehaviors()
            attchmentBehavior = UIAttachmentBehavior.init(item: self, offsetFromCenter: offset, attachedToAnchor: panLocation)
            animator.addBehavior(attchmentBehavior)
        }else if pan.state == .changed {
            attchmentBehavior.anchorPoint = panLocation
        }else if pan.state == .ended ||
            pan.state == .cancelled ||
            pan.state == .failed {
            animator .addBehavior(snapBehavior)
            animator .removeBehavior(attchmentBehavior)
        }
    }


}
