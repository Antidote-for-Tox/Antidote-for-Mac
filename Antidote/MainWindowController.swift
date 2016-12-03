//
//  MainWindowController.swift
//  Antidote
//
//  Created by Yoba on 03/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    override init(window _: NSWindow?) {
        let mainWindow = NSWindow(
            contentRect: NSRect(x: 100, y: 100, width: 640, height: 480),
            styleMask: [.closable, .resizable, .miniaturizable, .titled],
            backing: .buffered,
            defer: false
        )
        super.init(window: mainWindow)
        
        windowFrameAutosaveName = "MainWindow"
        mainWindow.title = "Antidote"
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

fileprivate extension MainWindowController {
    func setupView() {
        let splitViewController = NSSplitViewController()
        contentViewController = splitViewController
        
        let contactListViewItem = NSSplitViewItem(contentListWithViewController: ContactListViewController())
        contactListViewItem.minimumThickness = 200
        contactListViewItem.maximumThickness = 400
        splitViewController.addSplitViewItem(contactListViewItem)
        
        let messageListViewItem = NSSplitViewItem(viewController: MessageListViewController())
        messageListViewItem.minimumThickness = 600
        splitViewController.addSplitViewItem(messageListViewItem)
    }
}