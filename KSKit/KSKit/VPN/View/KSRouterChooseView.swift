//
//  KSRouterChooseView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/20.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSRouterChooseView: NSView {
    lazy var whiteView: NSView = {
        let whiteView = NSView.init(frame: CGRect.init(x: 0, y: 7, width: self.bounds.size.width, height: 79))
        whiteView.wantsLayer = true
        whiteView.layer?.cornerRadius = 6
        whiteView.layer?.backgroundColor = .white
        return whiteView
    }()
    lazy var routerBtn: NSButton = {
        let netInfoBtn = NSButton.init(title: "线路选择", image: Bundle.main.image(forResource: "netInfoIcon")!.resize(CGSize.init(width: 2, height: 12)), target: nil, action: nil)
        netInfoBtn.font = NSFont.systemFont(ofSize: 14)
        netInfoBtn.isBordered = false
        netInfoBtn.frame = CGRect.init(x: 14, y: 45, width: 72, height: 23)
        return netInfoBtn
    }()
    lazy var autoChooseBtn: NSButton = {
        let netInfoBtn = NSButton()
        netInfoBtn.wantsLayer = true
        netInfoBtn.isBordered = false
        netInfoBtn.title = ""
        netInfoBtn.layer?.borderWidth = 1
        netInfoBtn.layer?.borderColor = NSColor.colorWithHex("e3e3e3").cgColor
        netInfoBtn.frame = CGRect.init(x: 14, y: 45, width: 72, height: 23)
        netInfoBtn.layer?.cornerRadius = 4
        return netInfoBtn
    }()
    lazy var titleView: NSTextField = {
        let titleView = NSTextField.init(frame: CGRect.init(x: 18, y: 14, width: 480, height: 17))
        titleView.backgroundColor = .clear
        titleView.isBordered = false
        titleView.isEditable = false
        let title = "自动选择"
        titleView.font = NSFont.systemFont(ofSize: 12)
        let nssAttribute = NSMutableAttributedString.init(string: title)
        nssAttribute.addAttributes([NSAttributedString.Key.foregroundColor: NSColor.colorWithHex("666666")], range: NSRange.init(location: 0, length: title.count))
        titleView.placeholderAttributedString = nssAttribute
        
        return titleView
    }()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addChildViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addChildViews(){
        addSubview(whiteView)
        whiteView.addSubview(routerBtn)
        whiteView.addSubview(autoChooseBtn)
        autoChooseBtn.addSubview(titleView)
    }
    private func setupConstrains(){
        whiteView.snp.makeConstraints { (make) in
            make.top.equalTo(7)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(-7)
        }
        routerBtn.snp.makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(14)
            make.width.equalTo(72)
            make.height.equalTo(23)
        }
        autoChooseBtn.snp.makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(routerBtn.snp.bottom).offset(14)
            make.width.equalTo(180)
            make.height.equalTo(28)
        }

        titleView.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(18)
        }
        
    }
    
}
