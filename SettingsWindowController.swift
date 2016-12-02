//
//  SettingsWindowController.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 02/12/16.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class SettingsWindowController: NSWindowController {
    override init(window _: NSWindow?) {
        let window = NSWindow(contentRect: NSRect(x: 500, y: 500, width: 300, height: 200),
                              styleMask: [.titled, .closable, .miniaturizable, .resizable],
                              backing: .buffered,
                              defer: false)

        super.init(window: window)

        windowFrameAutosaveName = "SettingsWindow"

        createControllers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension SettingsWindowController {
    func createControllers() {
        contentViewController = SettingsListViewController()
    }
}
