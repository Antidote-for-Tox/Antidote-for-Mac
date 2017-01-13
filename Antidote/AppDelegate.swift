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
    let mainWindowController = MainWindowController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWindowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

