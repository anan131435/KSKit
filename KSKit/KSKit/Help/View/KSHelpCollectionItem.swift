//
//  KSHelpCollectionItem.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/22.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSHelpCollectionItem: NSCollectionViewItem {
    lazy var icon: NSImageView = {
        let icon = NSImageView()
        icon.image = NSImage.init(named: NSImage.Name.init("rightArrow"))?.resize(CGSize.init(width: 4, height: 7))
        return icon
    }()
    lazy var nameView: NSTextField = {
        let titleView = NSTextField.init(frame: CGRect.init(x: 37, y: 14, width: 480, height: 17))
        let nsmutablString = NSMutableAttributedString.init(string: "小神龙", attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12),NSAttributedString.Key.foregroundColor : NSColor.colorWithHex("333333")])
        titleView.attributedStringValue = nsmutablString
        titleView.backgroundColor = .clear
        titleView.isBordered = false
        titleView.isEditable = false
        return titleView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        addChildViews()
        setupContrians()
    }
    override func loadView() {
        let view = NSView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 30))
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        self.view = view
    }
    func addChildViews(){
        self.view.addSubview(icon)
        self.view.addSubview(nameView)
    }
    func setupContrians(){
        nameView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.centerY.equalTo(self.view)
            make.right.equalTo(icon.snp.left).offset(-5)
            make.height.equalTo(17)
        }
        icon.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view)
            make.right.equalTo(-5)
            make.width.equalTo(13)
            make.height.equalTo(13)
        }
    }
    func updateCell(_ title: String){
        let nsmutablString = NSMutableAttributedString.init(string: title, attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12),NSAttributedString.Key.foregroundColor : NSColor.colorWithHex("333333")])
        nameView.attributedStringValue = nsmutablString
    }
    
    
}
