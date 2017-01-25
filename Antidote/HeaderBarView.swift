//
//  HeaderBarView.swift
//  Antidote
//
//  Created by Yoba on 03/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

// MARK: init methods and properties

class HeaderBarView: NSView {
    var usernameLabel: LabelView!
    var lastSeenLabel: LabelView!
    
    var backButton: NSButton!
    var infoButton: NSButton!
    var callButton: NSButton!
    
    fileprivate var divider: NSView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: NSZeroRect)
        
        wantsLayer = true
        layer?.backgroundColor = BaseConstants.Colors.barBackgroundColor.cgColor
        
        createSubviews()
        setupConstraints()
    }
}

// MARK: subviews handling

fileprivate extension HeaderBarView {
    func createSubviews() {
        usernameLabel = LabelView(fontSize: BaseConstants.primaryFontSize)
        addSubview(usernameLabel)
        
        lastSeenLabel = LabelView()
        lastSeenLabel.textColor = BaseConstants.Colors.secondaryFontColor
        addSubview(lastSeenLabel)
        
        backButton = NSButton()
        backButton.image = NSImage(named: "placeholder")
        backButton.isBordered = false
        addSubview(backButton)
        
        infoButton = NSButton()
        infoButton.image = NSImage(named: "placeholder")
        infoButton.isBordered = false
        addSubview(infoButton)
        
        callButton = NSButton()
        callButton.image = NSImage(named: "placeholder")
        callButton.isBordered = false
        addSubview(callButton)
        
        divider = NSView()
        divider.wantsLayer = true
        divider.layer?.backgroundColor = BaseConstants.Colors.contourColor.cgColor
        addSubview(divider)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints {
            $0.left.equalTo(self).offset(BaseConstants.edgeOffset)
            $0.height.equalTo(BaseConstants.iconButtonSize)
            $0.width.equalTo(BaseConstants.iconButtonSize)
            $0.top.equalTo(self).offset(BaseConstants.offset)
        }
        
        usernameLabel.snp.makeConstraints {
            $0.left.equalTo(backButton.snp.right).offset(BaseConstants.offset)
            $0.top.equalTo(self).offset(BaseConstants.offset)
            $0.right.equalTo(infoButton.snp.left).offset(-BaseConstants.offset)
        }
        
        lastSeenLabel.snp.makeConstraints {
            $0.left.right.equalTo(usernameLabel)
            $0.top.equalTo(usernameLabel.snp.bottom)
        }
        
        callButton.snp.makeConstraints {
            $0.right.equalTo(self).offset(-BaseConstants.edgeOffset)
            $0.height.equalTo(BaseConstants.iconButtonSize)
            $0.width.equalTo(BaseConstants.iconButtonSize)
            $0.top.equalTo(backButton)
        }
        
        infoButton.snp.makeConstraints {
            $0.right.equalTo(callButton.snp.left).offset(-BaseConstants.offset)
            $0.top.equalTo(backButton)
            $0.height.equalTo(BaseConstants.iconButtonSize)
            $0.width.equalTo(BaseConstants.iconButtonSize)
        }
        
        divider.snp.makeConstraints {
            $0.left.bottom.right.equalTo(self)
            $0.height.equalTo(BaseConstants.dividerLineHeight)
        }
    }
}
