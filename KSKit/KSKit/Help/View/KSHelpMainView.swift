//
//  KSHelpMainView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/20.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSHelpMainView: NSView {
    lazy var deskView: KSItDeskView = {
       let deskView = KSItDeskView()
        return deskView
    }()
    lazy var netAboutView: KSItDeskView = {
       let deskView = KSItDeskView()
        return deskView
    }()
    lazy var innerSystemView: KSItDeskView = {
       let deskView = KSItDeskView()
        return deskView
    }()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.clear.cgColor
        addChildViews()
        setupContrians()
        setupDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addChildViews(){
        addSubview(deskView)
        addSubview(netAboutView)
        addSubview(innerSystemView)
    }
    func setupContrians(){
        deskView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(88 + 14)
        }
        netAboutView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(134 + 14)
            make.top.equalTo(deskView.snp.bottom).offset(0)
        }
        innerSystemView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(88 + 14)
            make.top.equalTo(netAboutView.snp.bottom).offset(0)
        }
    }
    func setupDataSource(){
        let titleArray = ["新人入职(IT篇）","Adobe2019安装说明","邮箱安全小帖士"]
        deskView.setupData(dataArr: titleArray,btnTitle:"IT桌面")
        var netTitleArray = [String]()
        for _ in 0...5{
            netTitleArray.append("如何关闭IPv6")
        }
        netAboutView.setupData(dataArr: netTitleArray,btnTitle: "网关相关")
        let innerArray = ["视频会议手册","视频会议手册","视频会议手册"]
        innerSystemView.setupData(dataArr: innerArray,btnTitle:"内部系统")
    }
}
