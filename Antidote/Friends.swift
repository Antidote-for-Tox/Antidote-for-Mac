//
//  Friends.swift
//  Antidote
//
//  Created by Yoba on 03/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

// These models are for development purposes only
// Will be changed to OCT* after actual connection is implemented

class FriendManager: NSObject {
    static var friends: [OCTFriend] {
        let f = OCTFriend()
        f.name = "User 1"
        let f2 = OCTFriend()
        f2.name = "User 2"
        
        return [
            f, f2
        ]
    }
}
