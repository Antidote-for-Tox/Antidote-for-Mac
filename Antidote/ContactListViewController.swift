//
//  ContactListViewController.swift
//  Antidote
//
//  Created by Yoba on 18/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

/**
    ContactsTableViewController is a controller which handles tableView containing user's contacts.
    
    It's responsible for handling tableView's events and for communication with parent splitViewController.
 */

protocol ConstactListViewControllerDelegate {
    func contactSelected(contact: OCTFriend)
}

class ContactListViewController: NSViewController {
    let contactView = ContactListView()
    let friends = FriendManager.getFriends()
    var delegate: ConstactListViewControllerDelegate?
    
    override func loadView() {
        contactView.tableView.delegate = self
        contactView.tableView.dataSource = self
        
        contactView.scrollView.verticalScroller?.alphaValue = 0
        view = contactView
    }
}

extension ContactListViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = ContactCellView()
        
        // Example:
        // TODO: fill with real data
        cell.usernameLabel.stringValue = friends[row].nickname
        cell.userAvatar.image = NSImage(named: "placeholder")
        cell.lastMessageTextLabel.stringValue = "Last message"
        cell.lastMessageDateLabel.stringValue = "Date"
        cell.lastSeenLabel.stringValue = "last seen"
        cell.lastSenderAvatar.image = NSImage(named: "placeholder")
        
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 68
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if let tableView = notification.object as? NSTableView {
            let friend = friends[tableView.selectedRow]
            delegate?.contactSelected(contact: friend)
        }
    }
}

extension ContactListViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        // TODO: fill with real data
        return friends.count
    }
}
