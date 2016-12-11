//
//  BaseTableViewController.swift
//  Antidote
//
//  Created by Yoba on 04/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class BaseTableViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    
    override func loadView() {
        tableView = NSTableView()
        tableView.addTableColumn(NSTableColumn())
        tableView.headerView = nil
        tableView.gridStyleMask = .solidHorizontalGridLineMask
        tableView.dataSource = self
        tableView.delegate = self
        
        scrollView = NSScrollView()
        scrollView.borderType = .noBorder
        scrollView.hasVerticalScroller = true
        scrollView.documentView = tableView
        view = scrollView
    }
    
}
