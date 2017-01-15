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

class ContactListViewController: NSViewController {
    let listView = ListView()
    
    override func loadView() {
        listView.tableView.delegate = self
        listView.tableView.dataSource = self
        
        listView.scrollView.verticalScroller?.alphaValue = 0
        view = listView
    }
}

extension ContactListViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        // TODO: fill with real data
        let cell = ContactCellView()
        
        // Example:
        cell.usernameLabel.stringValue = "Будда Шакьямуни"
        cell.userAvatar.image = NSImage(named: "placeholder")
        cell.lastMessageTextLabel.stringValue = "Твоя карма плоха, нам нужно ее подправить"
        cell.lastMessageDateLabel.stringValue = "543 BC"
        cell.lastSeenLabel.stringValue = row % 2 == 0 ? "last seen 543 BC" : "online"
        cell.lastSenderAvatar.image = NSImage(named: "placeholder")
        
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return CGFloat(ContactCellView.Constants.cellHeight)
    }
}

extension ContactListViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        // TODO: fill with real data
        return 10
    }
}
