//
//  KSItServiceView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/20.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSItServiceView: NSView {
    let btnWidth = 94
    let btnHeight = 92
    lazy var whiteView: NSView = {
        let whiteView = NSView.init(frame: CGRect.init(x: 20, y: 7, width: self.bounds.size.width - 40, height: 79))
        whiteView.wantsLayer = true
        whiteView.layer?.cornerRadius = 6
        whiteView.layer?.backgroundColor = .white
        return whiteView
    }()
    lazy var itNoteBtn: NSButton = {
        let netInfoBtn = NSButton.init(title: "IT服务", image: Bundle.main.image(forResource: "netInfoIcon")!.resize(CGSize.init(width: 2, height: 12)), target: nil, action: nil)
        netInfoBtn.font = NSFont.systemFont(ofSize: 14)
        netInfoBtn.isBordered = false
        netInfoBtn.frame = CGRect.init(x: 14, y: 45, width: 72, height: 23)
        return netInfoBtn
    }()
    let dataArray: [(String,String)] = [("netCheck","VPN"),("account","账户服务"),("dnsReset","DNS重置"),("security","安全检查"),("netCheck","网络检测")]
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addChildView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addChildView(){
        addSubview(whiteView)
        whiteView.addSubview(itNoteBtn)
        for (index,temple) in dataArray.enumerated() {
            let button = KSItButton()
            whiteView.addSubview(button)
            button.isBordered = false
            button.title = ""
            button.updateItBtn(title: temple.1, temple.0)
            button.snp.makeConstraints { (make) in
                make.left.equalTo(14 + index * btnWidth)
                make.width.equalTo(btnWidth)
                make.top.equalTo(itNoteBtn.snp.bottom).offset(14)
                make.height.equalTo(92)
            }
        }
    }
    func setupConstrains(){
        whiteView.snp.makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(14)
            make.right.equalTo(-18)
            make.bottom.equalTo(-7)
        }
        itNoteBtn.snp.makeConstraints { (make) in
            make.left.equalTo(14)
            make.top.equalTo(14)
            make.width.equalTo(48)
            make.height.equalTo(23)
        }
        
    }
    
}
