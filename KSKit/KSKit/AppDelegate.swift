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
//    var contentVC: KSBaseViewController!
    var contentVC: NSViewController!
    var windowVC: KSWindowController!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let _ =  NSUserDefaultsController.shared.defaults.value(forKey: "accoutn"){//登录过
            contentVC = KSBaseViewController.init()
            window = NSWindow.init(contentViewController: contentVC!)
            window.title = ""
            let windowController = NSWindowController.init(window: window!)
            windowController.showWindow(self)
        }else{//未登录过
            window = KSWindow.init(contentRect: CGRect.init(x: 0, y: 0, width: 300, height: 400), styleMask: [.closable,.miniaturizable], backing: .buffered, defer: false)
                   
                   window.title = ""
                    
                   window.contentViewController = KSLoginVC()
                   windowVC = KSWindowController.init(window: window!)
                   window.center()
                   windowVC.showWindow(self)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

