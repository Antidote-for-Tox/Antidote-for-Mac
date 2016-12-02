//
//  SettingsListViewController.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 02/12/16.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Cocoa
import SnapKit

class SettingsListViewController: NSViewController {
    fileprivate var textField: NSTextField!

    override func loadView() {
        view = NSView()

        createSubviews()
        installConstraints()
    }
}

fileprivate extension SettingsListViewController {
    func createSubviews() {
        textField = NSTextField()
        textField.stringValue = "Settings"
        view.addSubview(textField)
    }

    func installConstraints() {
        textField.snp.makeConstraints {
            $0.edges.equalTo(view)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
        }
    }
}
