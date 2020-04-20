//
//  AppDelegate.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa
import AppKit
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var contentVC: KSBaseViewController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        window = KSWindow.init(contentRect: CGRect.init(x: 0, y: 0, width: 200, height: 200), styleMask: [.closable,.miniaturizable], backing: .buffered, defer: false)
        
       
        
        
        contentVC = KSBaseViewController.init()
        window = NSWindow.init(contentViewController: contentVC!)
        window.title = ""
        let windowController = NSWindowController.init(window: window!)
        windowController.showWindow(self)
        

        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

