//
//  KSVpNMainView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/20.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSVpNMainView: NSView {
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
    
    lazy var routerChooseView: KSRouterChooseView = {
        let operationView = KSRouterChooseView.init(frame: CGRect.init(x: 145, y: 7, width: 500, height: 126 + 14))
        return operationView
    }()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.colorWithHex("ff7767").cgColor
        addChildViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addChildViews(){
        addSubview(noteView)
        addSubview(netInforView)
        addSubview(routerChooseView)
        addSubview(operationView)
    }
    private func setupConstrains(){
        noteView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(30)
            make.right.equalTo(0)
            make.height.equalTo(31)
        }
        netInforView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(noteView.snp.bottom).offset(7)
            make.height.equalTo(79 + 14)
            make.right.equalTo(0)
        }
        routerChooseView.snp.makeConstraints { (make) in
            make.left.right.equalTo(operationView)
            make.top.equalTo(netInforView.snp.bottom).offset(7)
            make.height.equalTo(104)
        }
        operationView.snp.makeConstraints { (make) in
            make.top.equalTo(routerChooseView.snp.bottom).offset(7)
            make.right.equalToSuperview()
            make.height.equalTo(126 + 14)
            make.left.equalTo(0)
        }
        
        
    }
    
    
}
