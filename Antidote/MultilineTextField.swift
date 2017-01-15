//
//  AutosizingTextField.swift
//  Matrix
//
//  Created by Mark Onyschuk on 2014-06-14.
//  Copyright (c) 2014 Mark Onyschuk. All rights reserved.
//

// Stolen from https://github.com/monyschuk/AutosizingTextFieldSample
// And converted to Swift 3 by clicking on red circle.

import Cocoa

class MultilineTextField: NSTextField, NSTextFieldDelegate {

    var multiline: Bool = true {
        didSet {
            let cell = self.cell as! NSTextFieldCell

            cell.wraps = multiline
            cell.isScrollable = !multiline
        }
    }

    // Lifecycle

    override init(frame: NSRect) {
        super.init(frame: frame)
        self.prepareAutosizingTextField()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.prepareAutosizingTextField()
    }

    func prepareAutosizingTextField() {
        self.isBordered = false
        self.focusRingType = .none
        self.drawsBackground = false
        self.lineBreakMode = .byTruncatingTail

        self.translatesAutoresizingMaskIntoConstraints = false

        let cell = self.cell as! NSTextFieldCell

        cell.wraps = multiline
        cell.isScrollable = !multiline

        NotificationCenter.default.addObserver(self, selector: #selector(geometryDidChange(_:)), name: NSNotification.Name.NSViewFrameDidChange, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(geometryDidChange(_:)), name: NSNotification.Name.NSViewBoundsDidChange, object: self)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NSViewFrameDidChange, object: self)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NSViewBoundsDidChange, object: self)
    }

    // Autolayout

    func geometryDidChange(_: NSNotification!) {
        if multiline {
            self.preferredMaxLayoutWidth = NSWidth(self.bounds)
            self.invalidateIntrinsicContentSize()
        }
    }

    override func textDidChange(_ notification: Notification) {
        super.textDidChange(notification)
        self.invalidateIntrinsicContentSize()
    }

    override var intrinsicContentSize: NSSize {
        var size: NSSize
        let bounds = self.bounds

        if let fieldEditor = self.currentEditor() as? NSTextView {
            let fieldEditorSuperview = fieldEditor.superview!

            if multiline {
                // the field editor may scroll slightly during edits
                // regardless of whether we specify the cell to be scrollable:
                // as a result, we fix the field editor's width prior to calculating height

                let superBounds = fieldEditorSuperview.bounds
                var frame = fieldEditor.frame

                if NSWidth(frame) > NSWidth(superBounds) {
                    frame.size.width = NSWidth(superBounds)

                    fieldEditor.frame = frame
                }
            }

            let textContainer = fieldEditor.textContainer
            let layoutManager = fieldEditor.layoutManager

            let usedRect = layoutManager?.usedRect(for: textContainer!)
            let clipRect = self.convert(fieldEditorSuperview.bounds, from: fieldEditor.superview)

            let clipDelta = NSSize(width: NSWidth(bounds) - NSWidth(clipRect), height: NSHeight(bounds) - NSHeight(clipRect))

            if multiline {
                let minHeight = layoutManager?.defaultLineHeight(for: self.font!)

                size = NSSize(width: NSViewNoIntrinsicMetric, height: max(NSHeight(usedRect!), minHeight!) + clipDelta.height)

            } else {
                size = NSSize(width: ceil(NSWidth(usedRect!) + clipDelta.width), height: NSHeight(usedRect!) + clipDelta.height)
            }
        } else {
            let cell = self.cell as! NSTextFieldCell

            if multiline {
                // oddly, this sometimes gives incorrect results -
                // if anyone has any ideas please issue a pull request

                size = cell.cellSize(forBounds: NSMakeRect(0, 0, NSWidth(bounds), CGFloat.greatestFiniteMagnitude))

                size.width = NSViewNoIntrinsicMetric
                size.height = ceil(size.height)

            } else {
                size = cell.cellSize(forBounds: NSMakeRect(0, 0, CGFloat.greatestFiniteMagnitude, CGFloat.greatestFiniteMagnitude))

                size.width = ceil(size.width)
                size.height = ceil(size.height)
            }
        }

        return size
    }
}
