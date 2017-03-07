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
    
    @IBInspectable var iconImage:UIImage? {
        didSet {
            updateImageView()
        }
    }
    @IBInspectable var progressValue:Float = 0.5 {
        didSet {
            updateProgress()
        }
    }
    @IBInspectable var progressWidth:CGFloat = 3.0 {
        didSet {
            updateSlider()
        }
    }
    @IBInspectable var progressTintColor:UIColor = UIColor.red {
        didSet {
            updateSlider()
        }
    }
    @IBInspectable var progressTrackColor:UIColor = UIColor.darkGray {
        didSet {
            updateSlider()
        }
    }
    @IBInspectable var textColor:UIColor = UIColor.white {
        didSet {
            updateLabel()
        }
    }
    @IBInspectable var font:UIFont = UIFont.systemFont(ofSize: 20) {
        didSet {
            updateLabel()
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        updateImageView()
        updateProgress()
    }
    
    func updateImageView() {
        iconImageView.frame = CGRect(x: 0, y: bounds.origin.y,
                                     width: bounds.width, height: bounds.width)
        addSubview(iconImageView)
        if let iconImage = iconImage {
            iconImageView.image = iconImage
        }
    }
    
    func updateProgress() {
        updateLabel()
        updateSlider()
    }
    
    func updateLabel(){
        progressLabel.frame = CGRect(x: 0,
                                     y: iconImageView.bounds.width,
                                     width: bounds.width, height: bounds.width)
        addSubview(progressLabel)
        progressLabel.adjustsFontSizeToFitWidth = true
        progressLabel.textAlignment = .center
        progressLabel.textColor = textColor
        progressLabel.font = font
        var value = Int(progressValue*100.0)
        value = min(100, value)
        value = max(0, value)
        progressLabel.text = "\(value)"
    }
    
    func updateSlider(){
        let trackRect = CGRect(x: bounds.width/2.0 - CGFloat(progressWidth/2.0),
                               y: bounds.origin.y+bounds.width*2,
                               width: CGFloat(progressWidth), height: bounds.height - bounds.width*2.0 - 5.0)
        let diff = CGFloat(1.0 - progressValue) * trackRect.size.height
        progress.frame = CGRect(x: trackRect.origin.x,
                                y: trackRect.origin.y+diff,
                                width: trackRect.size.width,
                                height: trackRect.size.height*CGFloat(progressValue))
        progress.backgroundColor = progressTintColor
        progressTrack.frame = trackRect
        progressTrack.backgroundColor = progressTrackColor
        progress.layer.cornerRadius = progressWidth / 2.0
        progressTrack.layer.cornerRadius = progressWidth / 2.0
        addSubview(progressTrack)
        addSubview(progress)
        
    }
}
