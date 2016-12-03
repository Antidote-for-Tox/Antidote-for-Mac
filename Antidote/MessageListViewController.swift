//
//  MessageListViewController.swift
//  Antidote
//
//  Created by Yoba on 03/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class MessageListViewController: NSViewController {

    fileprivate var textField: NSTextField!
    
    override func loadView() {
        view = MessageListView()
    }
}
