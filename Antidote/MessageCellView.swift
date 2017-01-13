//
//  MessageCellView.swift
//  Antidote
//
//  Created by Yoba on 02/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

// MARK: init methods and properties

class MessageCellView : NSTableCellView {
    var senderAvatar: RoundedImageView!
    var senderLabel: LabelView!
    var messageContent: LabelView!
    var sentDateLabel: LabelView!
    
    struct Constants {
        static let senderAvatarCornerRadius = CGFloat(18)
        static let senderAvatarSize = CGFloat(36)
        static let sentDateLabelWidth = 70
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        autoresizingMask = .viewHeightSizable
        translatesAutoresizingMaskIntoConstraints = true
        
        createSubviews()
        setupConstraints()
    }
}

// MARK: subviews handling

fileprivate extension MessageCellView {
    func createSubviews() {
        senderAvatar = RoundedImageView(withImageRadius: Constants.senderAvatarCornerRadius)
        addSubview(senderAvatar)
        
        senderLabel = LabelView()
        senderLabel.textColor = NSColor.purple // we can randomize sender color just for fun
        senderLabel.font = NSFont.boldSystemFont(ofSize: BaseConstants.secondaryFontSize)
        addSubview(senderLabel)
        
        messageContent = LabelView(withFontSize: BaseConstants.primaryFontSize)
        messageContent.lineBreakMode = .byWordWrapping
        addSubview(messageContent)
        
        sentDateLabel = LabelView()
        sentDateLabel.textColor = NSColor(white: 0.3, alpha: 0.5)
        sentDateLabel.alignment = .right
        addSubview(sentDateLabel)
    }
    
    func setupConstraints() {
        senderAvatar.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.left.equalTo(self).offset(BaseConstants.offset)
            
            $0.height.width.equalTo(Constants.senderAvatarSize)
        }
        
        senderLabel.snp.makeConstraints {
            $0.top.equalTo(senderAvatar)
            $0.left.equalTo(senderAvatar.snp.right).offset(BaseConstants.offset)
            $0.right.equalTo(sentDateLabel.snp.left).offset(BaseConstants.offset)
        }
        
        sentDateLabel.snp.makeConstraints {
            $0.top.equalTo(senderAvatar)
            $0.right.equalTo(self).offset(-BaseConstants.edgeOffset)
            $0.width.equalTo(Constants.sentDateLabelWidth)
        }
        
        messageContent.snp.makeConstraints {
            $0.top.equalTo(senderLabel.snp.bottom)
            $0.left.equalTo(senderLabel)
            $0.right.equalTo(sentDateLabel.snp.left)
        }
    }
}
