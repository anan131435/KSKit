//
//  KSMenuView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/19.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa
import SnapKit
/*左侧的边栏视图*/
class KSMenuView: NSView {
    // 背景放一张图片
        lazy var bgImg: NSImageView = {
            let view = NSImageView()
            view.wantsLayer = true
            view.image = NSImage.init(named: NSImage.Name.init("menuBg")) // 背景图片
            view.imageScaling = .scaleProportionallyDown
            return view
        }()
        
        
        // Icon + 快手KITlabel
        lazy var logoIcon: NSImageView = {
            let view = NSImageView()
            view.wantsLayer = true
            view.image = Bundle.main.image(forResource: "ksLogo") // logo图片
            return view
        }()
        
        lazy var logoLabel: NSTextField = {
            let view = NSTextField()
            view.wantsLayer = true
            view.layer?.backgroundColor = NSColor.clear.cgColor
            view.stringValue =  "快手KIT"
            view.isBordered = false
            view.isEditable = false
            view.isSelectable = false
            view.focusRingType = .none
            view.backgroundColor = NSColor.clear
            view.font = NSFont.boldSystemFont(ofSize: 14)
            view.textColor = NSColor.white
            return view
        }()
        
        // Icon + VPN 按钮
        lazy var vpnBtn: NSButton = {
            let view = NSButton()
            view.layer?.backgroundColor = NSColor.clear.cgColor
            view.isBordered = false
            view.image = NSImage.init(named: NSImage.stopProgressTemplateName)
            view.imagePosition = .imageLeft
            view.focusRingType = .none
            view.imageHugsTitle = true
            view.imageScaling = .scaleProportionallyDown
            view.attributedTitle = NSAttributedString(string: "  VPN  ", attributes: [NSAttributedString.Key.font : NSFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : NSColor.white])
            return view
            
        }()

        // Icon + 百宝箱 按钮
        lazy var toolsBtn: NSButton = {
            let view = NSButton()
            view.layer?.backgroundColor = NSColor.clear.cgColor
            view.isBordered = false
            view.focusRingType = .none
            view.imageHugsTitle = true
            view.image = NSImage.init(named: NSImage.stopProgressTemplateName)
            view.imagePosition = .imageLeft
            view.imageScaling = .scaleProportionallyDown
            view.attributedTitle = NSAttributedString(string: "  百宝箱  ", attributes: [NSAttributedString.Key.font : NSFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : NSColor.white])
            return view
            
        }()
        
        
        // Icon + 帮助中心 按钮
        
        lazy var helpBtn: NSButton = {
            let view = NSButton()
            view.wantsLayer = true
            view.layer?.backgroundColor = NSColor.clear.cgColor
            view.isBordered = false
            view.focusRingType = .none
            view.image = NSImage.init(named: NSImage.stopProgressTemplateName)
            view.imagePosition = .imageLeft
            view.imageScaling = .scaleProportionallyDown
            view.imageHugsTitle = true
            view.attributedTitle = NSAttributedString(string: "  帮助中心  ", attributes: [NSAttributedString.Key.font : NSFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : NSColor.white])
            return view
        }()
        
        
        // 有一个选中状态的半透明遮罩，点击对应的按钮时移动到相应的位置
        
        lazy var maskView: NSView = {
            let view = NSView()
            view.wantsLayer = true
            view.layer?.backgroundColor = NSColor(white: 1, alpha: 0.2).cgColor
            view.layer?.cornerRadius = 6
            
            return view
        }()
        
        override init(frame frameRect: NSRect) {
            super.init(frame: frameRect)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupUI() {
            self.addSubview(self.bgImg)
            self.addSubview(self.maskView)
            self.addSubview(self.vpnBtn)
            self.addSubview(self.toolsBtn)
            self.addSubview(self.helpBtn)
            self.addSubview(self.logoIcon)
            self.addSubview(self.logoLabel)
            
            self.bgImg.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            self.maskView.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalTo(-14)
                make.height.equalTo(40)
                make.top.equalTo(104)
            }
            self.logoIcon.snp.makeConstraints { (make) in
                make.left.equalTo(12)
                make.top.equalTo(40)
                make.width.equalTo(28)
                make.height.equalTo(32)
            }
            
            self.logoLabel.snp.makeConstraints { (make) in
                make.left.equalTo(48)
                make.centerY.equalTo(self.logoIcon)
                make.width.greaterThanOrEqualTo(50)
                make.height.greaterThanOrEqualTo(20)
            }
            
            self.vpnBtn.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalTo(-14)
                make.height.equalTo(40)
                make.top.equalTo(104)
            }
            self.toolsBtn.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalTo(-14)
                make.height.equalTo(40)
                make.top.equalTo(144)
            }
            self.helpBtn.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalTo(-14)
                make.height.equalTo(40)
                make.top.equalTo(184)
            }
            
            vpnBtn.target = self
            vpnBtn.action = #selector(vpnBtnClicked(_:))
            toolsBtn.target = self
            toolsBtn.action = #selector(toolsBtnClicked(_:))
            helpBtn.target = self
            helpBtn.action = #selector(helpBtnClicked(_:))
            
        }
        
        
        @objc func vpnBtnClicked(_ sender: NSButton) {
            sender.isHighlighted = false
            self.maskView.snp.updateConstraints { (make) in
                make.top.equalTo(104)
            }
            
        }
        
        
        @objc func toolsBtnClicked(_ sender: NSButton) {
            sender.isHighlighted = false
            self.maskView.snp.updateConstraints { (make) in
                make.top.equalTo(144)
            }
            
        }
        
        @objc func helpBtnClicked(_ sender: NSButton) {
            sender.isHighlighted = false
            self.maskView.snp.updateConstraints { (make) in
                make.top.equalTo(184)
            }
            
        }
    
}
