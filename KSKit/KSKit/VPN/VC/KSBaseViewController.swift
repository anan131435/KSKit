//
//  KSBaseViewController.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa
class KSBaseViewController: NSViewController {
    lazy var vpnMainView: KSVpNMainView = {
       let menuView = KSVpNMainView()
        return menuView
    }()
    lazy var treasureView: KSTreasureMainView = {
       let treasureView = KSTreasureMainView()
        treasureView.isHidden = true
        return treasureView
    }()
    
    lazy var menuView: KSMenuView = {
       let menuView = KSMenuView()
        return menuView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(vpnMainView)
        view.addSubview(treasureView)
        self.view.addSubview(menuView)
        updateConstrains()
        bindUI()
    }
    func updateConstrains(){
        vpnMainView.snp.makeConstraints { (make) in
            make.left.equalTo(menuView.snp.right)
            make.top.right.bottom.equalTo(0)
        }
        treasureView.snp.makeConstraints { (make) in
            make.left.equalTo(menuView.snp.right)
            make.top.right.bottom.equalTo(0)
        }
        menuView.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
            make.width.equalTo(140)
        }
        
    }
    override func loadView() {
        let mainview = NSView.init(frame: CGRect.init(x: 0, y: 0, width: 680, height: 444))
        mainview.wantsLayer = true
        mainview.layer?.backgroundColor = NSColor.colorWithHex("f3f5fb").cgColor
        self.view = mainview
        
    }
    private func bindUI(){
        menuView.clickBlock = {[weak self] (value: Any) in
            guard let self = self else {return}
            if let type = value as? KSMenuViewType{
                switch type {
                case .vpn:
                    self.vpnMainView.isHidden = false
                    self.treasureView.isHidden = true
                case .treasure:
                    self.vpnMainView.isHidden = true
                    self.treasureView.isHidden = false
//                case .treasure
                default:
                    break
                }
            }
        }
    }
    deinit {
        NSLog("KSBaseViewController deinit")
    }
    
    
}
