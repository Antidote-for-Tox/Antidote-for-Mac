//
//  InitialViewController.swift
//  Antidote
//
//  Created by Yoba on 12/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

/*
 * InitialViewController is showed when app is already launched, but no contact is selected.
 * May containt some useful information for user, like ice melting temperature or "how to click a button".
 */

class InitialViewController: NSViewController {

    override func loadView() {
        view = NSView()
    }
    
}
