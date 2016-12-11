//
//  MessagesTableViewController.swift
//  Antidote
//
//  Created by Yoba on 03/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

/*
 * MessagesTableViewController is responsible for getting friend object from parent controller 
 * (or elsewhere ???) and correctly displaying current user message history.
 */

class MessagesTableViewController: BaseTableViewController {
    var friend: Friend!
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return FriendManager.friends.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = MessageCellView()
        
        let message = self.friend?.messageHistory[row]
        
        if let content = message?.content {
            
            // TODO: handle all message types
            switch content {
            case .text(let msg):
                cell.textField?.stringValue = msg
            case .image:
                cell.textField?.stringValue = "image"
            case .audio:
                cell.textField?.stringValue = "audio"
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 72
    }
}
