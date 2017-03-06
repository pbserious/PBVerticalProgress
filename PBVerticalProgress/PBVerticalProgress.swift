//
//  PBVerticalProgress.swift
//  PBVerticalProgress
//
//  Created by Rattee Warriyawhutthiwat on 3/6/2560 BE.
//  Copyright © 2560 Rattee. All rights reserved.
//

import UIKit

@IBDesignable class PBVerticalProgress:UIView {
    var iconImageView = UIImageView()
    var progressLabel = UILabel()
    var progress = UIView()
    var progressTrack = UIView()
    
    @IBInspectable var iconImage:UIImage?
    @IBInspectable var progressValue:Float = 0.0 {
        didSet {
            
        }
    }
}
