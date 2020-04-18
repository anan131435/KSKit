//
//  KSVPNChooseBtn.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSVPNChooseBtn: NSView {
    lazy var noteView: NSTextField = {
        let noteView = NSTextField.init(frame: CGRect.init(x: 14, y: 14, width: self.bounds.size.width - 28, height: 34))
        noteView.textColor = NSColor.colorWithHex("999999")
        noteView.font = NSFont.systemFont(ofSize: 12)
        noteView.maximumNumberOfLines = 2
        noteView.isBordered = false
        noteView.isEditable = false
        noteView.backgroundColor = .clear
        return noteView
    }()
    lazy var iconView: NSImageView = {
        let iconView = NSImageView.init(frame: CGRect.init(x: 14, y: 58, width: 34, height: 34))
        iconView.image = NSImage.init(named: "")
        return iconView
    }()
    lazy var titleView: NSTextField = {
        let noteView = NSTextField.init(frame: CGRect.init(x: 14 * 2 + 34, y: 65, width: 60, height: 21))
        noteView.textColor = NSColor.colorWithHex("0f66ff")
        noteView.isBordered = false
        noteView.isEditable = false
        noteView.font = NSFont.boldSystemFont(ofSize: 15)
        noteView.backgroundColor = .clear
        return noteView
    }()
    lazy var choonseView: NSImageView = {
        let iconView = NSImageView.init(frame: CGRect.init(x: self.bounds.width - 30 , y: 65, width: 16, height: 16))
        iconView.image = NSImage.init(named: "turnOn")
        iconView.wantsLayer = true
        iconView.layer?.borderColor = NSColor.red.cgColor
        iconView.layer?.borderWidth = 0.5
        return iconView
    }()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.cornerRadius = 6
        self.layer?.backgroundColor = NSColor.colorWithHex("f5f6f8").cgColor
        self.addChildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addChildView(){
        self.addSubview(noteView)
        self.addSubview(iconView)
        self.addSubview(titleView)
        self.addSubview(choonseView)
    }
    func updateChooseBtnContent(_ model: KSVpnChooseModel){
        self.noteView.placeholderString = model.note
        self.iconView.image = NSImage.init(named: NSImage.Name.init(model.imageName))?.resize(CGSize.init(width: 34, height: 34))
        let nssAttribute = NSMutableAttributedString.init(string: model.title)
        nssAttribute.addAttributes([NSAttributedString.Key.foregroundColor: NSColor.colorWithHex("0f66ff")], range: NSRange.init(location: 0, length: model.title.count))
        self.titleView.placeholderAttributedString = nssAttribute
        let imageName = model.ifOpen ? "" : ""
        self.choonseView.image = NSImage.init(named: NSImage.Name.init(imageName))
    }
    
}
