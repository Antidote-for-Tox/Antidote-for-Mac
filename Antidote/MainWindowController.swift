//
//  MainWindowController.swift
//  Antidote
//
//  Created by Yoba on 17/12/2016.
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

    override init(window: NSWindow?) {
        let mainWindow = NSWindow(
            contentRect: NSRect(x: 100, y: 100, width: 640, height: 480),
            styleMask: [.closable, .resizable, .miniaturizable, .titled],
            backing: .buffered,
            defer: false
        )
        super.init(window: mainWindow)
        
        windowFrameAutosaveName = "MainWindow"
        mainWindow.title = "Antidote"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
