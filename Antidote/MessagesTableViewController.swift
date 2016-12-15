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
    func numberOfRows(in tableView: NSTableView) -> Int {
        return FriendManager.friends.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = MessageCellView()
        
        let message = OCTMessageAbstract()
        
        // TODO: handle uwrap correctly
        // TODO: handle all message types
        cell.textField?.stringValue = (message.messageText?.text)!
        
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 72
    }
}
