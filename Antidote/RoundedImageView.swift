//
//  RoundedImageView.swift
//  Antidote
//
//  Created by Yoba on 02/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class RoundedImageView: NSImageView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(imageRadius: CGFloat) {
        super.init(frame: NSZeroRect)
        
        self.wantsLayer = true
        self.layer?.cornerRadius = imageRadius
        self.layer?.masksToBounds = true
    }
}
