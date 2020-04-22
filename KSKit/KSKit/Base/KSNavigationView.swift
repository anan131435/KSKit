//
//  KSNavigationView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/22.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSNavigationView: NSView {
    lazy var icon: NSImageView = {
        let icon = NSImageView()
        icon.image = NSImage.init(named: NSImage.Name.init("questionIcon"))?.resize(CGSize.init(width: 16, height: 16))
        return icon
    }()
    lazy var verticalLine: NSView = {
       let lineView = NSView()
        lineView.wantsLayer = true
        lineView.layer?.backgroundColor = NSColor.colorWithHex("d8d8d8").cgColor
        return lineView
    }()
    lazy var headerIcon: NSImageView = {
        let icon = NSImageView()
        icon.image = NSImage.init(named: NSImage.Name.init("headerIcon"))?.resize(CGSize.init(width: 28, height: 28))
        icon.wantsLayer = true
        icon.layer?.cornerRadius = 14
        return icon
    }()
    lazy var nameView: NSTextField = {
        let titleView = NSTextField.init(frame: CGRect.init(x: 37, y: 14, width: 480, height: 17))
        let nsmutablString = NSMutableAttributedString.init(string: "小神龙", attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor : NSColor.colorWithHex("333333")])
        titleView.attributedStringValue = nsmutablString
        titleView.backgroundColor = .clear
        titleView.isBordered = false
        titleView.isEditable = false
        return titleView
    }()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addChildViews()
        setupConstrains()
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addChildViews(){
        self.addSubview(icon)
        addSubview(verticalLine)
        addSubview(headerIcon)
        addSubview(nameView)
    }
    func setupConstrains(){
        nameView.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.top.equalTo(18)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        headerIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameView)
            make.width.height.equalTo(28)
            make.right.equalTo(nameView.snp.left).offset(-8)
        }
        verticalLine.snp.makeConstraints { (make) in
            make.centerY.equalTo(headerIcon)
            make.width.equalTo(1)
            make.height.equalTo(20)
            make.right.equalTo(headerIcon.snp.left).offset(-12)
        }
        icon.snp.makeConstraints { (make) in
            make.centerY.equalTo(headerIcon)
            make.width.height.equalTo(16)
            make.right.equalTo(verticalLine.snp.left).offset(-12)
        }
    }
}
