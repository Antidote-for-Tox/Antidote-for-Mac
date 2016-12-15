//
//  ContactsTableViewController.swift
//  Antidote
//
//  Created by Yoba on 03/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

/*
 * ContactsTableViewController is a controller which handles tableView containing user's contacts.
 * It's responsible for handling tableView's events and for communication with parent splitViewController.
 */

class ContactsTableViewController: BaseTableViewController {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return FriendManager.friends.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = ContactCellView()
        
        let friend = FriendManager.friends[row]
        
        // TODO: handle unwrap correctly
        
        if let avatarData = friend.avatarData {
            cell.userAvatar.image = NSImage(data: avatarData)
        } else {
            cell.userAvatar.image = #imageLiteral(resourceName: "avatarPlaceholder")
        }
        
        cell.usernameLabel.stringValue = friend.name ?? "No name" // How is this possible?
        cell.lastMessageLabel.stringValue = friend.statusMessage ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 72
    }
    
    func tableViewSelectionDidChange(_ tableView: NSTableView) {
        tableView.deselectRow(tableView.selectedRow)
    }
    
}
