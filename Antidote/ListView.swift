//
//  ListView.swift
//  Antidote
//
//  Created by Yoba on 03/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

// MARK: init methods and properties

class ListView: NSView {
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: NSZeroRect)
        
        createSubviews()
        setupConstraints()
    }
}

// MARK: subview handling

fileprivate extension ListView {
    func createSubviews() {
        tableView = NSTableView()
        tableView.addTableColumn(NSTableColumn())
        tableView.headerView = nil
        
        scrollView = NSScrollView()
        scrollView.borderType = .noBorder
        scrollView.hasVerticalScroller = true
        scrollView.documentView = tableView
        addSubview(scrollView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
}
