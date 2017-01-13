//
//  ContactCellView.swift
//  Antidote
//
//  Created by Yoba on 18/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

/**
    ContactCellView is used in the ContactsTableViewController and represents a cell with short information about user's contact (or friend): contact's username, last message, avatar.
 
    This is also used for few actions: calling a contact, checking it's full information, call history, etc.
 */

// MARK: init methods and properties

class ContactCellView: NSTableCellView {
    var userAvatar: RoundedImageView!
    var lastSenderAvatar: RoundedImageView!
    var usernameLabel: LabelView!
    var lastMessageTextLabel: LabelView!
    var lastMessageDateLabel: LabelView!
    var lastSeenLabel: LabelView!
    
    fileprivate var divider: NSView!
    
    struct Constants {
        static let cellHeight = CGFloat(68)
        static let avatarCornerRadius = CGFloat(24)
        
        static let lastSenderAvatarSize = CGFloat(32)
        static let lastSenderAvatarCornerRadius = CGFloat(16)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        createSubviews()
        setupConstraints()
    }
}

// MARK: subviews handling

fileprivate extension ContactCellView {
    func createSubviews() {
        userAvatar = RoundedImageView(withImageRadius: Constants.avatarCornerRadius)
        addSubview(userAvatar)
        
        lastSenderAvatar = RoundedImageView(withImageRadius: Constants.lastSenderAvatarCornerRadius)
        lastSenderAvatar.layer?.borderWidth = 1
        lastSenderAvatar.layer?.borderColor = NSColor.green.cgColor
        addSubview(lastSenderAvatar)
        
        usernameLabel = LabelView(withFontSize: BaseConstants.primaryFontSize)
        addSubview(usernameLabel)
        
        lastMessageTextLabel = LabelView()
        lastMessageTextLabel.textColor = BaseConstants.lightGrayColor
        addSubview(lastMessageTextLabel)
        
        lastMessageDateLabel = LabelView()
        lastMessageDateLabel.textColor = BaseConstants.lightGrayColor
        lastMessageDateLabel.alignment = .right
        addSubview(lastMessageDateLabel)
        
        lastSeenLabel = LabelView()
        lastSeenLabel.textColor = BaseConstants.lightGrayColor
        addSubview(lastSeenLabel)
        
        divider = NSView()
        divider.wantsLayer = true
        divider.layer?.backgroundColor = BaseConstants.lightGrayColor.cgColor
        addSubview(divider)
    }
    
    func setupConstraints() {
        userAvatar.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.left.equalTo(BaseConstants.offset)
        }
        
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(BaseConstants.offset)
            $0.left.equalTo(divider)
            $0.right.equalTo(lastMessageDateLabel.snp.left).offset(BaseConstants.offset)
        }
        
        lastSeenLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom)
            $0.left.equalTo(divider)
        }
        
        lastMessageTextLabel.snp.makeConstraints {
            $0.top.equalTo(lastSeenLabel.snp.bottom)
            $0.left.equalTo(divider)
            $0.width.equalTo(usernameLabel)
        }
        
        lastMessageDateLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel)
            $0.right.equalTo(self).offset(-BaseConstants.offset)
        }
        
        lastSenderAvatar.snp.makeConstraints {
            $0.right.equalTo(lastMessageDateLabel)
            $0.top.equalTo(lastMessageDateLabel.snp.bottom)
            
            $0.height.width.equalTo(Constants.lastSenderAvatarSize)
        }
        
        divider.snp.makeConstraints {
            $0.left.equalTo(userAvatar.snp.right).offset(BaseConstants.offset)
            $0.height.equalTo(BaseConstants.dividerLineHeight)
            $0.right.bottom.equalTo(self)
        }
    }
}
