//
//  LabelView.swift
//  Antidote
//
//  Created by Yoba on 04/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class LabelView: NSTextField {
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        
        self.isBezeled = false
        self.drawsBackground = false
        self.isEditable = false
        self.isSelectable = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
