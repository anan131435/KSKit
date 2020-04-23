//
//  KSVPNOperationView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSVPNOperationView: NSView {
    var splitModel: KSVpnChooseModel!
    var fullModel: KSVpnChooseModel!
    lazy var whiteView: NSView = {
        let whiteView = NSView.init(frame: CGRect.init(x: 20, y: 7, width: self.bounds.size.width, height: 126))
        whiteView.wantsLayer = true
        whiteView.layer?.cornerRadius = 6
        whiteView.layer?.backgroundColor = .white
        return whiteView
    }()
    lazy var splitBtn: KSVPNChooseBtn = {
        let button = KSVPNChooseBtn.init(frame: CGRect.init(x: 14, y: 14, width: 172, height: 98))
        button.addGestureRecognizer(NSClickGestureRecognizer.init(target: self, action: #selector(officeNetModel)))
        return button
    }()
    lazy var fullBtn: KSVPNChooseBtn = {
        let button = KSVPNChooseBtn.init(frame: CGRect.init(x: self.splitBtn.frame.maxX + 14, y: 14, width: 172, height: 98))
         button.addGestureRecognizer(NSClickGestureRecognizer.init(target: self, action: #selector(allNetModel)))
        return button
    }()
    lazy var closeOpenIcon: KSTurnOnBtn = {
        let iconView = KSTurnOnBtn.init(frame: CGRect.init(x: self.fullBtn.frame.maxX + 14, y: 14, width: 98, height: 98))
        iconView.wantsLayer = true
        return iconView
    }()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.addChildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addChildView(){
        self.addSubview(whiteView)
        whiteView.addSubview(splitBtn)
        whiteView.addSubview(fullBtn)
        whiteView.addSubview(closeOpenIcon)
        updateVPNOperationView()
    }
    
    func updateVPNOperationView(){
        splitModel = KSVpnChooseModel()
        splitModel.note = "本模式只有在办公室网络通过VPN访问"
        splitModel.imageName = "splitIcon"
        splitModel.title = "SPLIT"
        splitBtn.updateChooseBtnContent(splitModel)
        
        fullModel = KSVpnChooseModel()
        fullModel.note = "本模式所有网络都将通过VPN访问"
        fullModel.imageName = "fullLock"
        fullModel.title = "FULL"
        fullModel.ifOpen = true
        fullBtn.updateChooseBtnContent(fullModel)
    }
    @objc func officeNetModel(){
        fullModel.ifOpen = true
        splitModel.ifOpen = false
        splitBtn.updateChooseBtnContent(splitModel)
        fullBtn.updateChooseBtnContent(fullModel)
    }
    @objc func allNetModel(){
        fullModel.ifOpen = false
        splitModel.ifOpen = true
        splitBtn.updateChooseBtnContent(splitModel)
        fullBtn.updateChooseBtnContent(fullModel)
    }
    
    
}
