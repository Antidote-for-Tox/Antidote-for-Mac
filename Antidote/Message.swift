//
//  Message.swift
//  Antidote
//
//  Created by Yoba on 04/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

// This model is for development purposes only
// Will be changed to OCT* after actual connection is implemented

class Message: NSObject {
    enum MessageContent {
        case text(String)
        case image(NSImage)
        case audio(NSData)
    }
    
    var sender: Friend
    var date: NSDate
    var content: MessageContent
    
    init(sender: Friend, content: MessageContent) {
        self.sender = sender
        self.content = content
        self.date = NSDate()
    }
}
