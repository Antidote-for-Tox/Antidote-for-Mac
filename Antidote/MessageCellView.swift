//
//  MessageCellView.swift
//  Antidote
//
//  Created by Yoba on 04/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

/*
 * MessageCellView is used in MessagesTableView and represents a basic message.
 * It contains content of the message (text, audio, file) and metainfo about it (sender, time).
 * It also supports a few actions like selection for replying/forwading or deleting, add to favorites and so on.
 */

class MessageCellView: NSTableCellView {
    
    override init(frame: NSRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
