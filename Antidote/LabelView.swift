//
//  LabelView.swift
//  Antidote
//
//  Created by Yoba on 18/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

/**
    Kind of normal non-editable label without a border
 */

class LabelView: NSTextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(withFontSize fontSize: CGFloat = CGFloat(12)) {
        super.init(frame: NSZeroRect)
        
        self.isBezeled = false
        self.drawsBackground = false
        self.isEditable = false
        self.isSelectable = false
        self.lineBreakMode = .byTruncatingTail
        self.font = NSFont.systemFont(ofSize: fontSize)
    }
}
