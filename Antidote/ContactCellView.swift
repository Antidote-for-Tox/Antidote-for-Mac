//
//  ContactCellView.swift
//  Antidote
//
//  Created by Yoba on 04/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

/*
 * ContactCellView is used in the ContactsTableViewController and represents a cell 
 * with short information about user's contact (or friend): contact's username, last message, avatar.
 * This is also used for few actions: calling a contact, checking it's full information, call history, etc.
 */

fileprivate struct Constants {
    
    // Offset between controls
    static let offset = 6
    
    // "Call" and "Option" button width. Buttons will be changed to icons
    static let buttonWidth = 50
    
    // Width of the username label
    static let labelWidth = 175
    
    static let callButtonTitle = String(localized: "contact_cell_call_button")
    static let optionButtonTitle = String(localized: "contact_cell_option_button")
}

class ContactCellView: NSTableCellView {
    var userAvatar: NSImageView!
    var usernameLabel: LabelView!
    var lastMessageLabel: LabelView!
    var callButton: NSButton!
    var optionButton: NSButton!
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        self.createSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

fileprivate extension ContactCellView {
    func createSubviews() {
        userAvatar = NSImageView()
        addSubview(userAvatar)
        
        usernameLabel = LabelView()
        usernameLabel.font = NSFont.systemFont(ofSize: 20)
        addSubview(usernameLabel)
        
        lastMessageLabel = LabelView()
        lastMessageLabel.textColor = NSColor.gray
        addSubview(lastMessageLabel)
        
        callButton = NSButton()
        callButton.title = Constants.callButtonTitle
        addSubview(callButton)
        
        optionButton = NSButton()
        optionButton.title = Constants.optionButtonTitle
        addSubview(optionButton)
    }
    
    func setupConstraints() {
        
        userAvatar.snp.makeConstraints {
            $0.top.equalTo(self).offset(Constants.offset)
            $0.left.equalTo(self).offset(Constants.offset)
            
            $0.centerY.equalTo(self)
        }
        
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(userAvatar)
            $0.left.equalTo(userAvatar.snp.right).offset(Constants.offset)
            $0.width.equalTo(Constants.labelWidth)
        }
        
        lastMessageLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom).offset(Constants.offset)
            $0.left.equalTo(userAvatar.snp.right).offset(Constants.offset)
            $0.width.equalTo(usernameLabel)
        }
        
        callButton.snp.makeConstraints {
            $0.top.equalTo(self).offset(Constants.offset)
            $0.left.equalTo(usernameLabel.snp.right).offset(Constants.offset)
            $0.width.equalTo(Constants.buttonWidth)
        }
        
        optionButton.snp.makeConstraints {
            $0.top.equalTo(callButton.snp.bottom).offset(Constants.offset)
            $0.left.equalTo(callButton)
            $0.width.equalTo(callButton)
        }
    }
}
