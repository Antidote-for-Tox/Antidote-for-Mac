//
//  ContactListView.swift
//  Antidote
//
//  Created by Yoba on 16/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Cocoa

class ContactListView: ListView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init()
        
        createSubviews()
        setupConstraints()
    }
    
}

fileprivate extension ContactListView {
    func createSubviews() {}
    func setupConstraints() {}
}
