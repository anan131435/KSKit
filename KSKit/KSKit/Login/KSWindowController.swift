//
//  KSWindowController.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/21.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSWindowController: NSWindowController,NSWindowDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.window?.delegate = self
    }
    
}
