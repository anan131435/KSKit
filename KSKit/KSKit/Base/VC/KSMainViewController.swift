//
//  KSMainViewController.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa
class KSMainViewController: KSBaseVC {
    lazy var navigationView: KSNavigationView = {
       let navigationView = KSNavigationView()
        navigationView.wantsLayer = true
        navigationView.layer?.cornerRadius = 12
        return navigationView
    }()
    lazy var vpnMainView: KSVpNMainView = {
       let menuView = KSVpNMainView()
        menuView.wantsLayer = true
        menuView.layer?.cornerRadius = 12
        return menuView
    }()
    lazy var treasureView: KSTreasureMainView = {
       let treasureView = KSTreasureMainView()
        treasureView.isHidden = true
        return treasureView
    }()
    lazy var helpCenterView: KSHelpMainView = {
       let treasureView = KSHelpMainView()
        treasureView.isHidden = true
        return treasureView
    }()
    
    lazy var menuView: KSMenuView = {
       let menuView = KSMenuView()
        return menuView
    }()
    lazy var item: NSStatusItem = {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.image = NSImage.init(named: NSImage.Name.init("statusIcon"))
        return item
    }()
    lazy var indicator: NSProgressIndicator = {
           let cator = NSProgressIndicator(frame: CGRect(x: 0, y: 0, width: 680, height: 444))
            cator.style = NSProgressIndicator.Style.spinning //条形样式, 菊花样式
           cator.controlSize = NSControl.ControlSize.regular //大小, 可选 regular small  mini
           cator.sizeToFit()     //size适配菊花大小,多余的舍弃
           return cator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = NSMenu()
        menu.title = "KSKit"
        menu.addItem(NSMenuItem.init(title: "最小化", action: #selector(miniItemMenuClick), keyEquivalent: "s"))
        menu.addItem(NSMenuItem.init(title: "连接", action: #selector(connectItemMenuClick), keyEquivalent: "d"))
        menu.addItem(NSMenuItem.init(title: "断开", action: #selector(NSApp.terminate(_:)), keyEquivalent: "q"))
        view.addSubview(navigationView)
        view.addSubview(vpnMainView)
        view.addSubview(treasureView)
        view.addSubview(helpCenterView)
        view.addSubview(menuView)
        item.menu = menu
        closeBtn =  NSWindow.standardWindowButton(.closeButton, for: .borderless)
        miniBtn =  NSWindow.standardWindowButton(.miniaturizeButton, for: .borderless)
        view.addSubview(closeBtn)
        view.addSubview(miniBtn)
        updateConstrains()
        bindUI()
        
    }
    func updateConstrains(){
        navigationView.snp.makeConstraints{ (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(56)
        }
        vpnMainView.snp.makeConstraints { (make) in
            make.left.equalTo(menuView.snp.right)
            make.right.bottom.equalTo(0)
            make.top.equalTo(navigationView.snp.bottom)
        }
        treasureView.snp.makeConstraints { (make) in
            make.left.equalTo(menuView.snp.right)
            make.right.bottom.equalTo(0)
            make.top.equalTo(navigationView.snp.bottom)
        }
        helpCenterView.snp.makeConstraints { (make) in
            make.left.equalTo(menuView.snp.right)
            make.right.bottom.equalTo(0)
            make.top.equalTo(navigationView.snp.bottom)
        }
        menuView.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
            make.width.equalTo(140)
        }
        closeBtn.snp.makeConstraints { (make) in
                   make.left.equalTo(8)
                   make.top.equalTo(8)
                   make.width.height.equalTo(12)
        }
       miniBtn.snp.makeConstraints { (make) in
           make.left.equalTo(closeBtn.snp.right).offset(6)
          make.top.equalTo(8)
          make.width.height.equalTo(12)
       }
        
    }
    override func loadView() {
        let mainview = NSView.init(frame: CGRect.init(x: 0, y: 0, width: 680, height: 444))
        mainview.wantsLayer = true
        mainview.layer?.backgroundColor = NSColor.colorWithHex("f3f5fb").cgColor
        mainview.layer?.cornerRadius = 12
        self.view = mainview
        
    }
    private func bindUI(){
        menuView.clickBlock = {[weak self] (value: Any) in
            guard let self = self else {return}
            if let type = value as? KSMenuViewType{
                switch type {
                case .vpn:
                    self.vpnMainView.isHidden = false
                    self.treasureView.isHidden = true
                    self.helpCenterView.isHidden = true
                case .treasure:
                    self.vpnMainView.isHidden = true
                    self.treasureView.isHidden = false
                    self.helpCenterView.isHidden = true
                case .help:
                    self.vpnMainView.isHidden = true
                    self.treasureView.isHidden = true
                    self.helpCenterView.isHidden = false
                }
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(pressVpnBtnDidClick(notifiaction:)), name: NSNotification.Name.init(pressBtnNotificationName), object: nil)
       
    }
    
    //最小化
    @objc func miniItemMenuClick(){
        self.view.window?.miniaturize(self)
    }
    //链接
    @objc func connectItemMenuClick(){
        
    }
    @objc func pressVpnBtnDidClick(notifiaction: NSNotification){
        if let dict = notifiaction.userInfo as? [String : Any],let button = dict["pressBtn"]{
            self.view.addSubview(indicator)
            indicator.snp.makeConstraints { (make) in
                make.center.equalTo(self.view)
                make.width.height.equalTo(30)
            }
            indicator.startAnimation(nil)
            self.indicator.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.indicator.stopAnimation(nil)
                self.indicator.isHidden = true
            }
        }
    }
    
    
    
    deinit {
        NSLog("KSMainViewController deinit")
    }
    
    
}
