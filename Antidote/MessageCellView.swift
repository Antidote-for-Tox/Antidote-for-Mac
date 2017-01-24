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
    
    fileprivate struct Constants {
        static let senderAvatarCornerRadius: CGFloat = 18.0
        static let senderAvatarSize: CGFloat = 36.0
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

fileprivate extension MessageCellView {
    func createSubviews() {
        senderAvatar = RoundedImageView(imageRadius: Constants.senderAvatarCornerRadius)
        addSubview(senderAvatar)
        
        senderLabel = LabelView()
        senderLabel.textColor = BaseConstants.Colors.senderNameColor // we can randomize sender color just for fun
        senderLabel.font = NSFont.boldSystemFont(ofSize: BaseConstants.secondaryFontSize)
        addSubview(senderLabel)
        
        messageContent = LabelView(fontSize: BaseConstants.primaryFontSize)
        messageContent.lineBreakMode = .byWordWrapping
        addSubview(messageContent)
        
        sentDateLabel = LabelView()
        sentDateLabel.textColor = BaseConstants.Colors.secondaryFontColor
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
            $0.width.equalTo(BaseConstants.dateLabelWidth)
        }
        
        messageContent.snp.makeConstraints {
            $0.top.equalTo(senderLabel.snp.bottom)
            $0.left.equalTo(senderLabel)
            $0.right.equalTo(sentDateLabel.snp.left)
        }
    }
}
