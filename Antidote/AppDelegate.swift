//
//  AppDelegate.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 26/11/16.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var mainWindowController: MainWindowController!
    var settingsWindowController: SettingsWindowController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        mainWindowController = MainWindowController()
        mainWindowController.showWindow(nil)

        settingsWindowController = SettingsWindowController()
        settingsWindowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

