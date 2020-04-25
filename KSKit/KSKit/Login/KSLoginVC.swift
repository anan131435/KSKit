//
//  KSLoginVC.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/21.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSLoginVC: KSBaseVC {
    lazy var loginMainView: KSLoginMainView = {
       let loginView = KSLoginMainView()
        loginView.wantsLayer = true
        loginView.layer?.cornerRadius = 4
        return loginView
    }()
    
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
        
        
    }
    override func loadView() {
        let mainView = NSView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 400))
        mainView.wantsLayer = true
        mainView.layer?.backgroundColor = NSColor.white.cgColor
        mainView.layer?.cornerRadius = 4
        self.view = mainView
        
    }
    func jumpToNewWindow(){
        let contentVC = KSMainViewController.init()
        let  window = KSWindow.init(contentViewController: contentVC)
        window.titleVisibility = .hidden
        window.styleMask = [.closable,.miniaturizable]
        let windowController = KSWindowController.init(window: window)
        windowController.showWindow(self)
        window.isMovableByWindowBackground = true
        window.titlebarAppearsTransparent = true
        
        if let appdelegate = NSApplication.shared.delegate as? AppDelegate{
            appdelegate.windowVC = windowController
            appdelegate.window = window
            window.makeKey()
            window.orderFront(nil)
            window.center()
            self.view.window?.orderOut(self)
            NSUserDefaultsController.shared.defaults.set("account", forKey: "account")
            NSUserDefaultsController.shared.defaults.synchronize()
        }
    }
    
    
    
    
}
