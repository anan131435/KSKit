//
//  KSNetInforView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa
///网络信息UI
class KSNetInforView: NSView {
    let itemWidth = 65
    let itemHeight = 17
    lazy var whiteView: NSView = {
        let whiteView = NSView.init(frame: CGRect.init(x: 0, y: 7, width: self.bounds.size.width, height: 79))
        whiteView.wantsLayer = true
        whiteView.layer?.cornerRadius = 6
        whiteView.layer?.backgroundColor = .white
        return whiteView
    }()
    lazy var netInfoBtn: NSButton = {
        let netInfoBtn = NSButton.init(title: "网络信息", image: Bundle.main.image(forResource: "netInfoIcon")!.resize(CGSize.init(width: 2, height: 12)), target: nil, action: nil)
        netInfoBtn.font = NSFont.systemFont(ofSize: 14)
        netInfoBtn.isBordered = false
        netInfoBtn.frame = CGRect.init(x: 14, y: 45, width: 72, height: 23)
        return netInfoBtn
    }()
    let dataArray: [String] = ["IP: 172.1.12","网关:171.1.1.","DNS:8.8.8.8","DNS:2.8.8.8"]
    //暂时不考虑collectionView实现
//    lazy var collectionView : NSCollectionView = {
//        let collectionLayout = NSCollectionViewLayout.init()
//        let collectionV = NSCollectionView.init(frame: CGRect.init(x: 14, y: 14, width: self.bounds.size.width, height: 20))
//        collectionV.dataSource = self
//        collectionV.register(<#T##itemClass: AnyClass?##AnyClass?#>, forItemWithIdentifier: <#T##NSUserInterfaceItemIdentifier#>)
//        return collectionV
//    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.addSubview(whiteView)
        self.whiteView.addSubview(netInfoBtn)
        for (index,title) in dataArray.enumerated(){
            let titleView = NSTextField.init(frame: CGRect.init(x: (index * itemWidth * 2) + 14, y: 14, width: itemWidth, height: itemHeight))
            titleView.isBordered = false
            titleView.textColor = NSColor.colorWithHex("666666")
            titleView.placeholderString = title
            titleView.isEditable = false
            self.whiteView.addSubview(titleView)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
