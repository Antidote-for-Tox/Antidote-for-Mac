//
//  MessageListView.swift
//  Antidote
//
//  Created by Yoba on 03/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class MessageListView: NSView {
    var textField: NSTextField!
    
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        
        self.createSubviews()
        self.setupConstraints()
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MessageListView {
    func createSubviews() {
        textField = NSTextField()
        textField.stringValue = "MessageListView"
        self.addSubview(textField)
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints {
            $0.edges.equalTo(self)
            $0.height.equalTo(480)
        }
    }
}
