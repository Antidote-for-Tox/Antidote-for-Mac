//
//  BaseConstants.swift
//  Antidote
//
//  Created by Yoba on 04/01/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

struct BaseConstants {
    static let offset = 10
    static let edgeOffset = 20
    static let dividerLineHeight: CGFloat = 1.0
    static let primaryFontSize: CGFloat = 14.0
    static let secondaryFontSize: CGFloat = 12.0
    static let iconButtonSize: CGFloat = 30.0
    static let dateLabelWidth: CGFloat = 70.0
    
    struct Colors {
        static let primaryFontColor = NSColor.black
        static let secondaryFontColor = NSColor(white: 0.3, alpha: 0.5)
        static let contourColor = NSColor(white: 0.3, alpha: 0.5)
        static let messageDeliveredBorderColor = NSColor.green
        static let messageSentBorderColor = NSColor.purple
        static let senderNameColor = NSColor.purple
        
        static let altPrimaryFontColor = NSColor.white
        static let altSecondaryFontColor = NSColor.white
        
        static let barBackgroundColor = NSColor.white
    }
}

