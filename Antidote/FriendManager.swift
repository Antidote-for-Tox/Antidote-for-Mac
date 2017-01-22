//
//  FriendManager.swift
//  Antidote
//
//  Created by Yoba on 22/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

class FriendManager {
    static func getFriends() -> [OCTFriend] {
        var friends = [OCTFriend]()
        let users = 10
        
        for i in 0..<users {
            let friend = OCTFriend()
            friend.nickname = "User \(i)"
            friends.append(friend)
        }
        
        return friends
    }
}
