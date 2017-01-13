//
//  MessageBarView.swift
//  Antidote
//
//  Created by Yoba on 03/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

class MessageBarView: NSView {
    var textField: MultilineTextField!
    var sendButton: NSButton!
    fileprivate var divider: NSView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: NSZeroRect)
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.white.cgColor
        
        createSubviews()
        setupConstraints()
    }
}

fileprivate extension MessageBarView {
    func createSubviews() {
        textField = MultilineTextField()
        textField.placeholderString = "Write message..."
        textField.isBezeled = false
        textField.focusRingType = .none
        textField.font = NSFont.systemFont(ofSize: BaseConstants.primaryFontSize)
        textField.lineBreakMode = .byWordWrapping
        addSubview(textField)
        
        sendButton = NSButton()
        sendButton.image = NSImage(named: "placeholder")
        sendButton.isBordered = false
        addSubview(sendButton)
        
        divider = NSView()
        divider.wantsLayer = true
        divider.layer?.backgroundColor = BaseConstants.lightGrayColor.cgColor
        addSubview(divider)
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints {
            $0.centerY.equalTo(sendButton)
            $0.left.equalTo(self).offset(BaseConstants.edgeOffset)
            $0.right.equalTo(sendButton.snp.left).offset(-BaseConstants.offset)
        }
        
        sendButton.snp.makeConstraints {
            $0.height.equalTo(BaseConstants.iconButtonSize)
            $0.width.equalTo(BaseConstants.iconButtonSize)
            $0.bottom.equalTo(self).offset(-BaseConstants.offset)
            $0.right.equalTo(self).offset(-BaseConstants.edgeOffset)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(sendButton).offset(-BaseConstants.offset)
            $0.left.right.equalTo(self)
            $0.height.equalTo(BaseConstants.dividerLineHeight)
        }
    }
}
