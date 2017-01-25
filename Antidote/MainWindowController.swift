//
//  MainWindowController.swift
//  Antidote
//
//  Created by Yoba on 17/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

/**
    MainWindowController is an entry point in application. At least until "tutorialWindowController" is created.
 
    It contains NSSplitViewController. At left part there is always contact list.
 
    At the right part will be shown one of the controllers: InitialViewController at launch, when no contacts selected; MessagesViewController when contacts is selected; CallViewController when user wishes to call someone.
 */

// MARK: init methods and properties

class MainWindowController: NSWindowController {
    fileprivate struct Constants {
        static let minColumnThickness: CGFloat = 300.0
        static let maxColumnThickness: CGFloat = 650.0
    }
    
    fileprivate let splitViewController = NSSplitViewController()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(window: NSWindow?) {
        let mainWindow = NSWindow(
            contentRect: NSZeroRect,
            styleMask: [.closable, .resizable, .miniaturizable, .titled],
            backing: .buffered,
            defer: false
        )
        super.init(window: mainWindow)
        
        windowFrameAutosaveName = "MainWindow"
        mainWindow.title = "Antidote"
        mainWindow.delegate = self
        
        contentViewController = splitViewController
        
        createSubviews()
    }
}

// MARK: delegate methods

extension MainWindowController: NSWindowDelegate {
    func windowDidResize(_ notification: Notification) {
        let resizedWindow = notification.object as! NSWindow
        
        if resizedWindow.title == "Antidote" {
            // TODO: implement window resizing
        }
    }
}

// MARK: view setup methods

fileprivate extension MainWindowController {
    func createSubviews() {
        let contactListViewController = ContactListViewController()
        contactListViewController.delegate = self
        let contactListViewItem = NSSplitViewItem(contentListWithViewController: contactListViewController)
        contactListViewItem.minimumThickness = Constants.minColumnThickness
        contactListViewItem.maximumThickness = Constants.maxColumnThickness
        splitViewController.addSplitViewItem(contactListViewItem)
    }
}

extension MainWindowController: ConstactListViewControllerDelegate {
    func contactSelected(contact: OCTFriend) {
        if splitViewController.splitViewItems.count > 1 {
            splitViewController.removeChildViewController(at: 1)
        }
        
        let chatViewController = ChatViewController(friendObject: contact)
        let chatViewItem = NSSplitViewItem(viewController: chatViewController)
        chatViewItem.minimumThickness = 350
        splitViewController.addSplitViewItem(chatViewItem)
    }
}
