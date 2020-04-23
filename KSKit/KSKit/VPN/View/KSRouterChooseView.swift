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
    lazy var arrowIcon: NSImageView = {
        let icon = NSImageView()
        icon.image = NSImage.init(named: NSImage.Name.init("downArrow"))?.resize(CGSize.init(width: 12, height: 6))
        return icon
    }()
    lazy var mapIcon: NSImageView = {
        let icon = NSImageView()
        icon.image = NSImage.init(named: NSImage.Name.init("mapIcon"))?.resize(CGSize.init(width: 194, height: 87))
        return icon
    }()
    lazy var locationIconOne: NSImageView = {
        let icon = NSImageView()
        icon.image = NSImage.init(named: NSImage.Name.init("locationIcon"))?.resize(CGSize.init(width: 10, height: 15))
        return icon
    }()
    lazy var locationIconTwo: NSImageView = {
           let icon = NSImageView()
           icon.image = NSImage.init(named: NSImage.Name.init("locationIcon"))?.resize(CGSize.init(width: 10, height: 15))
           return icon
       }()
    lazy var locationIconThree: NSImageView = {
        let icon = NSImageView()
        icon.image = NSImage.init(named: NSImage.Name.init("locationIcon"))?.resize(CGSize.init(width: 10, height: 15))
        return icon
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
        autoChooseBtn.addSubview(arrowIcon)
        whiteView.addSubview(mapIcon)
        whiteView.addSubview(locationIconOne)
        whiteView.addSubview(locationIconTwo)
        whiteView.addSubview(locationIconThree)
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
        mapIcon.snp.makeConstraints { (make) in
            make.right.equalTo(-3)
            make.centerY.equalTo(self)
            make.width.equalTo(194)
            make.height.equalTo(87)
        }

        titleView.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(18)
        }
        arrowIcon.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.centerY.equalToSuperview()
            make.width.equalTo(12)
            make.height.equalTo(6)
        }
        locationIconOne.snp.makeConstraints { (make) in
            make.width.equalTo(10)
            make.height.equalTo(15)
            make.right.equalTo(-60)
            make.top.equalTo(17)
        }
        locationIconTwo.snp.makeConstraints { (make) in
               make.width.equalTo(10)
               make.height.equalTo(15)
               make.right.equalTo(-120)
               make.top.equalTo(30)
        }
        
    }
    
}
