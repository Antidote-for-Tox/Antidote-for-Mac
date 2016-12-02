//
//  MainWindowController.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 02/12/16.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    override init(window _: NSWindow?) {
        let window = NSWindow(contentRect: NSRect(x: 100, y: 100, width: 600, height: 400),
                              styleMask: [.titled, .closable, .miniaturizable, .resizable],
                              backing: .buffered,
                              defer: false)

        super.init(window: window)

        windowFrameAutosaveName = "MainWindow"

        createControllers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension MainWindowController {
    func createControllers() {
        let splitViewController = NSSplitViewController()
        contentViewController = splitViewController

        let contactItem = NSSplitViewItem(viewController: ContactListViewController())
        contactItem.minimumThickness = 100
        contactItem.maximumThickness = 200
        splitViewController.addSplitViewItem(contactItem)

        let chatItem = NSSplitViewItem(viewController: ChatViewController())
        chatItem.minimumThickness = 100
        splitViewController.addSplitViewItem(chatItem)
    }
}
