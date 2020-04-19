//
//  KSBaseViewController.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa
class KSBaseViewController: NSViewController {
    lazy var noteView: KSVPNNoteTitleView = {
        let noteView = KSVPNNoteTitleView.init()
        noteView.frame = CGRect.init(x: 145, y: 375, width: 500, height: 45)
        return noteView
    }()
    lazy var netInforView: KSNetInforView = {
        let netInforView = KSNetInforView.init(frame: CGRect.init(x: 145, y: 264 - 7, width: 500, height: 79 + 14))
        return netInforView
    }()
    lazy var operationView: KSVPNOperationView = {
        let operationView = KSVPNOperationView.init(frame: CGRect.init(x: 145, y: 7, width: 500, height: 126 + 14))
        return operationView
    }()
    lazy var menuView: KSMenuView = {
       let menuView = KSMenuView()
        return menuView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(noteView)
        self.view.addSubview(netInforView)
        self.view.addSubview(operationView)
        self.view.addSubview(menuView)
        updateConstrains()
    }
    func updateConstrains(){
        menuView.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
            make.width.equalTo(140)
        }
    }
    override func loadView() {
        let mainview = NSView.init(frame: CGRect.init(x: 0, y: 0, width: 680, height: 444))
        mainview.wantsLayer = true
        mainview.layer?.backgroundColor = NSColor.colorWithHex("f3f5fb").cgColor
        self.view = mainview
    }
    deinit {
        NSLog("KSBaseViewController deinit")
    }
    
    
}
