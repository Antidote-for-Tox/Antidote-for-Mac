//
//  Friends.swift
//  Antidote
//
//  Created by Yoba on 03/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class FriendManager: NSObject {
    static var friends: [Friend] {
        return [
            Friend(name: "user 1", hash: "user 1"),
            Friend(name: "user 2", hash: "user 1"),
            Friend(name: "user 3", hash: "user 1"),
            Friend(name: "user 4", hash: "user 1"),
            Friend(name: "user 5", hash: "user 1"),
            Friend(name: "user 6", hash: "user 1"),
            Friend(name: "user 7", hash: "user 1"),
            Friend(name: "user 8", hash: "user 1"),
            Friend(name: "user 9", hash: "user 1"),
        ]
    }
}

class Friend {
    var name: String
    var hash: String
    var avatar: NSImage
    
    var messageHistory = [Message]()
    
    init(name: String, hash: String, avatar: NSImage = #imageLiteral(resourceName: "avatarPlaceholder")) {
        self.name = name
        self.hash = hash
        self.avatar = avatar
        
        self.messageHistory.append(Message(sender: self, content: .text("\(self.name) \(self.hash)")))
    }
}
