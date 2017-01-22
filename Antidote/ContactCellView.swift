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
        static let borderWidth = CGFloat(2)
        static let avatarSize = CGFloat(48)
        static let avatarCornerRadius = CGFloat(24)
        static let lastSenderAvatarSize = CGFloat(32)
        static let lastSenderAvatarCornerRadius = CGFloat(16)
    }
    
    override var backgroundStyle: NSBackgroundStyle {
        didSet {
            backgroundStyle == .light ? setColorsForLightStyle() : setColorsForDarkStyle()
        }
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
    func setColorsForLightStyle() {
        usernameLabel.textColor = NSColor.black
        lastSenderAvatar.layer?.borderColor = NSColor.green.cgColor
        lastMessageTextLabel.textColor = BaseConstants.lightGrayColor
        lastMessageDateLabel.textColor = BaseConstants.lightGrayColor
        lastSeenLabel.textColor = BaseConstants.lightGrayColor
        divider.layer?.backgroundColor = BaseConstants.lightGrayColor.cgColor
    }
    
    func setColorsForDarkStyle() {
        usernameLabel.textColor = NSColor.white
        lastSenderAvatar.layer?.borderColor = NSColor.green.cgColor
        lastMessageTextLabel.textColor = NSColor.white
        lastMessageDateLabel.textColor = NSColor.white
        lastSeenLabel.textColor = NSColor.white
        divider.layer?.backgroundColor = layer?.backgroundColor
    }
    
    func createSubviews() {
        userAvatar = RoundedImageView(withImageRadius: Constants.avatarCornerRadius)
        addSubview(userAvatar)
        
        lastSenderAvatar = RoundedImageView(withImageRadius: Constants.lastSenderAvatarCornerRadius)
        lastSenderAvatar.layer?.borderWidth = Constants.borderWidth
        addSubview(lastSenderAvatar)
        
        usernameLabel = LabelView(withFontSize: BaseConstants.primaryFontSize)
        addSubview(usernameLabel)
        
        lastMessageTextLabel = LabelView()
        addSubview(lastMessageTextLabel)
        
        lastMessageDateLabel = LabelView()
        lastMessageDateLabel.alignment = .right
        addSubview(lastMessageDateLabel)
        
        lastSeenLabel = LabelView()
        addSubview(lastSeenLabel)
        
        divider = NSView()
        divider.wantsLayer = true
        addSubview(divider)
        
        setColorsForLightStyle()
    }
    
    func setupConstraints() {
        userAvatar.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.left.equalTo(BaseConstants.offset)
            $0.height.width.equalTo(Constants.avatarSize)
        }
        
        divider.snp.makeConstraints {
            $0.left.equalTo(userAvatar.snp.right).offset(BaseConstants.offset)
            $0.height.equalTo(BaseConstants.dividerLineHeight)
            $0.right.bottom.equalTo(self)
        }
        
        lastMessageDateLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(BaseConstants.offset)
            $0.right.equalTo(self).offset(-BaseConstants.offset)
            $0.width.equalTo(BaseConstants.dateLabelWidth)
        }
        
        lastSenderAvatar.snp.makeConstraints {
            $0.right.equalTo(lastMessageDateLabel)
            $0.top.equalTo(lastMessageDateLabel.snp.bottom)
            $0.height.width.equalTo(Constants.lastSenderAvatarSize)
        }
        
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(lastMessageDateLabel)
            $0.left.equalTo(divider)
            $0.right.equalTo(lastMessageDateLabel.snp.left)
        }
        
        lastSeenLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom)
            $0.left.equalTo(divider)
            $0.bottom.equalTo(lastMessageTextLabel.snp.top)
            $0.width.equalTo(usernameLabel)
        }
        
        lastMessageTextLabel.snp.makeConstraints {
            $0.top.equalTo(lastSeenLabel.snp.bottom)
            $0.left.equalTo(divider)
            $0.right.equalTo(lastSenderAvatar.snp.left)
        }
    }
}
