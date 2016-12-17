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
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        MainWindowController().showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

