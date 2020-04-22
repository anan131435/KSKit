//
//  KSTreasureMainView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/20.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSTreasureMainView: NSView {
    lazy var topService: KSItServiceView = {
       let topService = KSItServiceView()
        return topService
    }()
    lazy var secondSerVice: KSItServiceView = {
       let topService = KSItServiceView()
        return topService
    }()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addChildViews()
        setupConstrains()
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.clear.cgColor
        updateDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstrains(){
        topService.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(164)
        }
        secondSerVice.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(topService.snp.bottom).offset(0)
            make.height.equalTo(164)
        }
    }
    private func addChildViews(){
        self.addSubview(topService)
        self.addSubview(secondSerVice)
    }
    func updateDataSource(){
        let dataArray: [(String,String)] = [("netCheck","VPN"),("account","账户服务"),("dnsReset","DNS重置"),("security","安全检查"),("netCheck","网络检测")]
        topService.updateContent(dataArray)
        let secondArray: [(String,String)] = [("ssh","SSH"),("git","GIT")]
        secondSerVice.updateContent(secondArray)
    }
    
}
