//
//  KSLoginVC.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/21.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSLoginVC: NSViewController {
    lazy var loginMainView: KSLoginMainView = {
       let loginView = KSLoginMainView()
        loginView.wantsLayer = true
        loginView.layer?.cornerRadius = 4
        loginView.layer?.masksToBounds = true
        return loginView
    }()
    var closeBtn: NSButton!
    var miniBtn: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        closeBtn =  NSWindow.standardWindowButton(.closeButton, for: .borderless)
        miniBtn =  NSWindow.standardWindowButton(.miniaturizeButton, for: .borderless)
        addChildViews()
        setupConstrains()
        bindUIEvent()
        
        
    }
    func addChildViews(){
        self.view.addSubview(loginMainView)
        view.addSubview(closeBtn)
        view.addSubview(miniBtn)
    }
    func setupConstrains(){
        loginMainView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
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
    func bindUIEvent(){
        loginMainView.loginClick = {[weak self] in
            guard let self = self else {return}
            self.jumpToNewWindow()
        }
        closeBtn.action = #selector(closeBtnDidClick)
        closeBtn.target = self
        miniBtn.target = self
        miniBtn.action = #selector(miniBtnDidClick)
    }
    override func loadView() {
        let mainView = NSView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 400))
        mainView.wantsLayer = true
        mainView.layer?.backgroundColor = NSColor.yellow.cgColor
        mainView.layer?.cornerRadius = 4
        mainView.layer?.masksToBounds = true
        self.view = mainView
        
    }
    func jumpToNewWindow(){
        let window = KSWindow.init(contentRect: CGRect.init(x: 0, y: 0, width: 680, height: 440), styleMask: [.closable,.miniaturizable], backing: .buffered, defer: false)
        window.isMovableByWindowBackground = true
        
//        let contentVC = KSMainViewController.init()
//        let  window = NSWindow.init(contentViewController: contentVC)
//        window.title = ""
//        let windowController = KSWindowController.init(window: window)
//        windowController.showWindow(self)
//        window.isMovableByWindowBackground = true
//        window.titlebarAppearsTransparent = true
        
        if let appdelegate = NSApplication.shared.delegate as? AppDelegate{
            appdelegate.window = window
            window.contentViewController = KSMainViewController.init()
            window.makeKey()
            window.orderFront(nil)
            window.center()
            self.view.window?.orderOut(self)
            NSUserDefaultsController.shared.defaults.set("account", forKey: "account")
            NSUserDefaultsController.shared.defaults.synchronize()
        }
    }
    @objc func closeBtnDidClick(){
        if let window = self.view.window{
            window.close()
        }
    }
    @objc func miniBtnDidClick(){
        
        if let window = self.view.window{
            window.miniaturize(self)
        }
    }
    
    
    
}
