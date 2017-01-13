//
//  ChatViewController.swift
//  Antidote
//
//  Created by Yoba on 02/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class ChatViewController: NSViewController {
    let chatView = ChatView()
    var heightCaches = [Int: CGFloat]()
    
    override func loadView() {
        chatView.tableView.delegate = self
        chatView.tableView.dataSource = self
        view = chatView
    }
    
    override func viewDidLoad() {
        chatView.tableView.scrollRowToVisible(chatView.tableView.numberOfRows-1)
        
        if let headerBar = chatView.headerBar as? HeaderBarView {
            headerBar.usernameLabel.stringValue = "Будда Шакьямуни"
            headerBar.lastSeenLabel.stringValue = "last seen 543 BC"
        }
    }
}

extension ChatViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = MessageCellView()
        
        // TODO: fill with real data
        // Example:
        cell.senderAvatar.image = NSImage(named: "placeholder")
        cell.senderLabel.stringValue = "Будда Шакьямуни"
        cell.sentDateLabel.stringValue = "3:45 PM"
        cell.messageContent.stringValue = "Ваша карма повышена на \(row)"
        
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        // TODO: dynamic row height
        return 48
    }
    
    func selectionShouldChange(in tableView: NSTableView) -> Bool {
        // Actually we need selection to reply or forward messages.
        return false
    }
}

extension ChatViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        // TODO: fill with real data
        return 100
    }
}
