//
//  KSItButton.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/20.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSItButton: NSButton {
    lazy var icon: NSImageView = {
       let icon = NSImageView()
        return icon
    }()
    lazy var titleView: NSButton = {
        let titleView = NSButton.init(frame: CGRect.init(x: 37, y: 14, width: 480, height: 17))
        titleView.title = ""
        titleView.font = NSFont.systemFont(ofSize: 14)
        titleView.isBordered = false
        return titleView
    }()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addSubview(icon)
        addSubview(titleView)
        setupConstrains()
    }
    private func setupConstrains(){
        icon.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.height.equalTo(34)
            make.top.equalTo(14)
        }
        titleView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(-14)
            make.width.equalTo(self)
            make.height.equalTo(20)
        }
    }
    func updateItBtn(title:String ,_ imageName: String){
        let nssAttribute = NSMutableAttributedString.init(string: title)
        nssAttribute.addAttributes([NSAttributedString.Key.foregroundColor: NSColor.colorWithHex("333333"),NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14)], range: NSRange.init(location: 0, length: title.count))
        titleView.attributedTitle = nssAttribute
        icon.image = NSImage.init(named: NSImage.Name.init(imageName))?.resize(CGSize.init(width: 34, height: 34))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
