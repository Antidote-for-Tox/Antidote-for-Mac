//
//  ChatView.swift
//  Antidote
//
//  Created by Yoba on 03/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

// MARK: init methods and properties

class ChatView: ListView {
    var headerBar: HeaderBarView!
    var bottomBar: MessageBarView!
    
    struct Constants {
        static let barHeight = 50
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init()
        
        createSubviews()
        setupConstraints()
    }
}

// MARK: subview handling

fileprivate extension ChatView {
    func createSubviews() {
        headerBar = HeaderBarView()
        addSubview(headerBar)
        bottomBar = MessageBarView()
        addSubview(bottomBar)
    }
    
    func setupConstraints() {
        headerBar.snp.makeConstraints {
            $0.top.left.right.equalTo(self)
            $0.height.equalTo(Constants.barHeight)
        }
        
        bottomBar.snp.makeConstraints {
            $0.left.right.bottom.equalTo(self)
            $0.height.equalTo(Constants.barHeight)
        }
        
        scrollView.snp.remakeConstraints {
            $0.left.right.equalTo(self)
            $0.top.equalTo(headerBar.snp.bottom)
            $0.bottom.equalTo(bottomBar.snp.top)
        }
    }
}
