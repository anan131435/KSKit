//
//  KSVPNNoteTitleView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa
import AppKit
class KSVPNNoteTitleView: NSView {
    lazy var titleView: NSTextField = {
        let titleView = NSTextField.init(frame: CGRect.init(x: 18, y: 14, width: 480, height: 17))
        titleView.textColor = NSColor.colorWithHex("c8ccs2")
        titleView.placeholderString = "同学，您好欢迎使用KIT，如果在使用过程中有任何问题，请随时联系IT小助手给予帮助！"
        titleView.font = NSFont.systemFont(ofSize: 12)
        titleView.backgroundColor = .clear
        titleView.isBordered = false
        titleView.isEditable = false
        return titleView
    }()
    lazy var iconView: NSImageView = {
        let iconView = NSImageView()
        iconView.frame = CGRect.init(x: 0, y: 16, width: 12, height: 12)
        iconView.image = Bundle.main.image(forResource: NSImage.Name.init("noteIcon"))?.resize(CGSize.init(width: 12, height: 12))
        return iconView
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.addSubview(iconView)
        self.addSubview(titleView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NSLog("KSVPNNoteTitleView deinit")
    }
    
}
