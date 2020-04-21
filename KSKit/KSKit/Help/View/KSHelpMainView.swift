//
//  KSHelpMainView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/20.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSHelpMainView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.yellow.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
