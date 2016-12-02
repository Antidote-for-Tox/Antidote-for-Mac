//
//  ChatViewController.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 02/12/16.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

class ChatViewController: NSViewController {
    fileprivate var textField: NSTextField!

    override func loadView() {
        view = NSView()

        createSubviews()
        installConstraints()
    }
}

fileprivate extension ChatViewController {
    func createSubviews() {
        textField = NSTextField()
        textField.stringValue = "Chats"
        view.addSubview(textField)
    }

    func installConstraints() {
        textField.snp.makeConstraints {
            $0.left.right.equalTo(view)
            $0.height.equalTo(100)
        }
    }
}
