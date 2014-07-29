//
//  TileView.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. All rights reserved.
//

import UIKit

/// A view representing a single swift-2048 tile.
class TileView : UIView {
    // This should be unowned. But there is a bug preventing 'unowned' from working correctly with protocols.
    var delegate: AppearanceProviderProtocol
    var value: Int = 0 {
    didSet {
        backgroundColor = delegate.tileColor(value)
        var res:Int = getNumberImage(value)
        var image:UIImage
        if res==0 {
            image = UIImage(named:"blank.jpg")
        }else{
            image = UIImage(named:"g_\(res).jpg")
        }
        numberLabel.image = image
    }
    }
    var numberLabel: UIImageView
    
    init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate d: AppearanceProviderProtocol) {
        delegate = d
        numberLabel = UIImageView(frame: CGRectMake(0, 0, width, width))
        //numberLabel.textAlignment = NSTextAlignment.Center
        //numberLabel.minimumScaleFactor = 0.5
        //numberLabel.font = delegate.fontForNumbers()
        
        super.init(frame: CGRectMake(position.x, position.y, width, width))
        addSubview(numberLabel)
        layer.cornerRadius = radius
        
        self.value = value
        backgroundColor = delegate.tileColor(value)
        var res:Int = getNumberImage(value)
        var image:UIImage
        if res==0 {
            image = UIImage(named:"blank.jpg")
        }else{
            image = UIImage(named:"g_\(res).jpg")
        }
        
        numberLabel.image = image
    }
    
    
    //这里本应该写一个求2的幂的函数
    func getNumberImage(score:Int) ->Int {
        var titleNumber:Int = 0
        
        if score==nil || score<=0 {
            titleNumber = 0
        }else if score==2 {
            titleNumber = 1
        }else if score==4 {
            titleNumber = 2
        }else if score==8 {
            titleNumber = 3
        }else if score==16 {
            titleNumber = 4
        }else if score==32 {
            titleNumber = 5
        }else if score==64 {
            titleNumber = 6
        }else if score==128 {
            titleNumber = 7
        }else if score==256 {
            titleNumber = 8
        }else if score==512 {
            titleNumber = 9
        }else if score==1024 {
            titleNumber = 10
        }else if score==2048 {
            titleNumber = 11
        }else {
            titleNumber = 0
        }
        return titleNumber
    
    }
    
    
}
