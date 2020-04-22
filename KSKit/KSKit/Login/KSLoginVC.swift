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
        loginView.layer?.backgroundColor = NSColor.red.cgColor
        return loginView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViews()
        setupConstrains()
        bindUIEvent()
    }
    func addChildViews(){
        self.view.addSubview(loginMainView)
    }
    func setupConstrains(){
        loginMainView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
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
//        mainView.layer?.backgroundColor = NSColor.yellow.cgColor
        mainView.layer?.cornerRadius = 4
        mainView.layer?.masksToBounds = true
        self.view = mainView
        
    }
    func jumpToNewWindow(){
        let window = KSWindow.init(contentRect: CGRect.init(x: 0, y: 0, width: 200, height: 400), styleMask: [.closable,.miniaturizable], backing: .buffered, defer: false)
        window.title = "second"
        
        if let appdelegate = NSApplication.shared.delegate as? AppDelegate{
            appdelegate.window = window
            window.makeKey()
            window.orderFront(nil)
            window.center()
            self.view.window?.orderOut(self)
        }
//         NSUserDefaultsController.shared.defaults.set("account", forKey: "account")
//        NSUserDefaultsController.shared.defaults.synchronize()
        
        
    }
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem{
        let item = NSCollectionViewItem.init()
        item.imageView?.image = NSImage.init(named: NSImage.Name.init(""))
        return item
    }
    
    
}
