//
//  ContactCellView.swift
//  Antidote
//
//  Created by Yoba on 04/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

class ContactCellView: NSTableCellView {
    var userAvatar: NSImageView!
    var usernameTextField: NSTextField!
    var lastMessageTextField: NSTextField!
    var callButton: NSButton!
    var optionButton: NSButton!
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        self.createSubviews()
        //self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidMoveToSuperview() {
        setupConstraints()
    }
}

fileprivate extension ContactCellView {
    func createSubviews() {
        userAvatar = NSImageView()
        addSubview(userAvatar)
        
        usernameTextField = LabelView()
        usernameTextField.font = NSFont(name: "System Font", size: 20)
        addSubview(usernameTextField)
        
        lastMessageTextField = LabelView()
        lastMessageTextField.textColor = NSColor.gray
        addSubview(lastMessageTextField)
        
        callButton = NSButton()
        callButton.title = "Call"
        addSubview(callButton)
        
        optionButton = NSButton()
        optionButton.title = "Option"
        addSubview(optionButton)
    }
    
    func setupConstraints() {
        let defaultOffset = 6
        
        userAvatar.snp.makeConstraints {
            $0.top.equalTo(self).offset(defaultOffset)
            $0.left.equalTo(self).offset(defaultOffset)
            
            if let sv = superview {
                $0.centerY.equalTo(sv)
            }
        }
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(userAvatar)
            $0.left.equalTo(userAvatar.snp.right).offset(defaultOffset)
            $0.width.equalTo(175)
        }
        
        lastMessageTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(defaultOffset)
            $0.left.equalTo(userAvatar.snp.right).offset(defaultOffset)
            $0.width.equalTo(usernameTextField)
        }
        
        callButton.snp.makeConstraints {
            $0.top.equalTo(self).offset(defaultOffset)
            $0.left.equalTo(usernameTextField.snp.right).offset(defaultOffset)
            $0.width.equalTo(50)
        }
        
        optionButton.snp.makeConstraints {
            $0.top.equalTo(callButton.snp.bottom).offset(defaultOffset)
            $0.left.equalTo(callButton)
            $0.width.equalTo(callButton)
        }
    }
}
