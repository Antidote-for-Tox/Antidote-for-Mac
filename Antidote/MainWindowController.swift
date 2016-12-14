//
//  MainWindowController.swift
//  Antidote
//
//  Created by Yoba on 03/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

/*
 * MainWindowController is an entry point in application. At least until "tutorialWindowController" is created.
 * It contains NSSplitViewController. At left part there is always contact list.
 * At the right part will be shown one of the controllers: InitialViewController at launch, when no contacts
 * selected; MessagesViewController when contacts is selected; CallViewController when user wishes to call someone. 
 */

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
        
        let contactsTableViewController = ContactsTableViewController()
        let contactsTableViewItem = NSSplitViewItem(contentListWithViewController: contactsTableViewController)
        contactsTableViewItem.minimumThickness = 300
        splitViewController.addSplitViewItem(contactsTableViewItem)
        
        let initialViewController = InitialViewController()
        let initialTableViewItem = NSSplitViewItem(viewController: initialViewController)
        initialTableViewItem.minimumThickness = 600
        splitViewController.addSplitViewItem(initialTableViewItem)
    }
}
