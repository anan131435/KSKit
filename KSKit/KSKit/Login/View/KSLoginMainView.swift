//
//  KSLoginMainView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/21.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa
import CoreFoundation
import AppKit

class KSLoginMainView: NSView {
    var loginClick: KSNoParamClosure?
    lazy var icon: NSImageView = {
        let icon = NSImageView()
        icon.image = NSImage.init(named: NSImage.Name.init("loginLogo"))
        return icon
    }()
    lazy var emailField: NSTextField = {
        let titleView = NSTextField.init(frame: CGRect.init(x: 37, y: 14, width: 480, height: 17))
        titleView.textColor = NSColor.colorWithHex("000000")
        titleView.placeholderString = "请输入邮箱前缀"
        titleView.font = NSFont.systemFont(ofSize: 14)
        titleView.backgroundColor = .clear
        titleView.isBordered = false
        titleView.isEditable = true
        titleView.focusRingType = .none
        return titleView
    }()
    lazy var emailLine: NSView = {
       let emailLine = NSView()
        emailLine.wantsLayer = true
        emailLine.layer?.backgroundColor = NSColor.colorWithHex("d8d8d8").cgColor
        return emailLine
    }()
    var timer: Timer?
    lazy var verifiCodeField: NSTextField = {
        let titleView = NSTextField.init(frame: CGRect.init(x: 37, y: 14, width: 480, height: 17))
        titleView.textColor = NSColor.colorWithHex("000000")
        titleView.placeholderString = "请输入KIM验证码"
        titleView.font = NSFont.systemFont(ofSize: 14)
        titleView.backgroundColor = .clear
        titleView.isBordered = false
        titleView.isEditable = true
        titleView.focusRingType = .none
        return titleView
    }()
    lazy var countDownView: NSTextField = {
        let titleView = NSTextField.init(frame: CGRect.init(x: 37, y: 14, width: 480, height: 17))
        let nsmutablString = NSMutableAttributedString.init(string: "倒计时(60s)", attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor : NSColor.colorWithHex("999999")])
        titleView.attributedStringValue = nsmutablString
        titleView.backgroundColor = .white
        titleView.isBordered = false
        titleView.isEditable = false
        titleView.isHidden = true
        return titleView
    }()
    lazy var codeLine: NSView = {
       let emailLine = NSView()
        emailLine.wantsLayer = true
        emailLine.layer?.backgroundColor = NSColor.colorWithHex("d8d8d8").cgColor
        return emailLine
    }()
    lazy var verificationBtn: NSButton = {
           let netInfoBtn = NSButton()
           netInfoBtn.font = NSFont.systemFont(ofSize: 16)
            let title = "获取验证码"
            let nsAttribute =  NSMutableAttributedString.init(string: title, attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: NSColor.black])
            netInfoBtn.attributedTitle = nsAttribute
           netInfoBtn.isBordered = false
           netInfoBtn.wantsLayer = true
           netInfoBtn.target = self
           netInfoBtn.action = #selector(verifiCationBtnDidClick)
           return netInfoBtn
       }()
    lazy var loginBtn: NSButton = {
        let netInfoBtn = NSButton.init(title: "", image: Bundle.main.image(forResource: "netInfoIcon")!.resize(CGSize.init(width: 251, height: 36)), target: nil, action: nil)
        netInfoBtn.font = NSFont.systemFont(ofSize: 16)
        let title = "登录"
        let nsAttribute =  NSMutableAttributedString.init(string: title, attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: NSColor.white])
        netInfoBtn.attributedTitle = nsAttribute
        netInfoBtn.isBordered = false
        netInfoBtn.wantsLayer = true
        netInfoBtn.layer?.cornerRadius = 18
        netInfoBtn.target = self
        netInfoBtn.action = #selector(loginBtnDidClick)
        return netInfoBtn
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
        self.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addChildViews(){
        self.addSubview(icon)
        self.addSubview(emailField)
        self.addSubview(emailLine)
        self.addSubview(verifiCodeField)
        self.addSubview(verificationBtn)
        self.addSubview(countDownView)
        self.addSubview(codeLine)
        self.addSubview(loginBtn)
    }
    private func setupConstrains(){
        icon.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(62)
            make.width.equalTo(80)
            make.height.equalTo(96)
        }
        emailField.snp.makeConstraints { (make) in
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.top.equalTo(icon.snp.bottom).offset(67)
            make.height.equalTo(20)
        }
        emailLine.snp.makeConstraints { (make) in
            make.left.equalTo(emailField)
            make.right.equalTo(-20)
            make.top.equalTo(emailField.snp.bottom).offset(12)
            make.height.equalTo(1)
        }
        verifiCodeField.snp.makeConstraints { (make) in
            make.left.equalTo(emailField)
            make.width.equalTo(110)
            make.top.equalTo(emailLine.snp.bottom).offset(14)
            make.height.equalTo(20)
        }
        verificationBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(verifiCodeField)
            make.right.equalTo(emailLine.snp.right)
        }
        countDownView.snp.makeConstraints { (make) in
            make.centerY.equalTo(verifiCodeField)
            make.right.equalTo(emailLine.snp.right)
        }
        codeLine.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(1)
            make.top.equalTo(verifiCodeField.snp.bottom).offset(12)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.bottom.equalTo(-24)
            make.height.equalTo(36)
        }
    }
    @objc func loginBtnDidClick(){
        if self.loginClick != nil{
            self.loginClick!()
        }
    }
    @objc func verifiCationBtnDidClick(){
        var number = 60
        verificationBtn.isHidden = true
        countDownView.isHidden = false
        let nsmutablString = NSMutableAttributedString.init(string: "倒计时(60s)", attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor : NSColor.colorWithHex("999999")])
        self.countDownView.attributedStringValue = nsmutablString
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {[weak self] (timer) in
            guard let self = self else {return}
            number = number - 1
            let nsmutablString = NSMutableAttributedString.init(string: "倒计时(\(number)s)", attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor : NSColor.colorWithHex("999999")])
            self.countDownView.attributedStringValue = nsmutablString
            if(number == 0){
                self.invalidTimer()
            }
        })
    }
    func invalidTimer(){
        self.timer?.invalidate()
        self.timer = nil
        verificationBtn.isHidden = false
        countDownView.isHidden = true
    }
    
}
