//
//  KSTurnOnBtn.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSTurnOnBtn: NSView {
    lazy var grayView: NSView = {
        let grayView = NSView.init(frame: self.bounds)
        grayView.wantsLayer = true
        grayView.layer?.backgroundColor = NSColor.colorWithHex("f5f6f8").cgColor
        grayView.layer?.cornerRadius = self.bounds.width / 2
        return grayView
    }()
    lazy var whiteView: NSView = {
        let whiteView = NSView.init(frame: CGRect.init(x: 17, y: 17, width: self.bounds.width - 17 * 2, height: self.bounds.width - 17 * 2))
        whiteView.wantsLayer = true
        whiteView.layer?.backgroundColor = NSColor.white.cgColor
        whiteView.layer?.cornerRadius = (self.bounds.width - 17 * 2) / 2
        whiteView.layer?.shadowColor = NSColor.colorWithHex("0f66ff",alpha: 0.2).cgColor
        whiteView.layer?.shadowRadius = 10
        whiteView.layer?.shadowOffset = CGSize.init(width: 5, height: 5)
        return whiteView
    }()
    lazy var pressBtn: NSImageView = {
        var pressBtn = NSImageView()
        pressBtn.image = NSImage.init(named: NSImage.Name.init("turnOn"))?.resize(CGSize.init(width: 18, height: 18))
        pressBtn.frame = CGRect.init(x: 98 / 2 - 9, y: 98 / 2 - 9, width: 18, height: 18)
        return pressBtn
    }()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addChildView()
    }
    private func addChildView(){
        addSubview(grayView)
        addSubview(whiteView)
        addSubview(pressBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func pressBtnDidClick(){
        
    }
    
    
}
