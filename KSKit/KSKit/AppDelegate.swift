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
    var window: NSWindow?
    var contentVC: NSViewController!
    var windowVC: KSWindowController!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let _ =  NSUserDefaultsController.shared.defaults.value(forKey: "accoutn"){//登录过
//            contentVC = KSMainViewController.init()
//            window = NSWindow.init(contentViewController: contentVC!)
//            window.title = ""
//            let windowController = NSWindowController.init(window: window!)
//            windowController.showWindow(self)
            window = KSWindow.init(contentRect: CGRect.init(x: 0, y: 0, width: 680, height: 440), styleMask: [.closable,.miniaturizable], backing: .buffered, defer: false)
            window?.isMovableByWindowBackground = true
            window?.contentViewController = KSMainViewController.init()
            window?.makeKey()
            window?.orderFront(nil)
            window?.center()
        }else{//未登录过
//            window = KSWindow.init(contentRect: CGRect.init(x: 0, y: 0, width: 680, height: 440), styleMask: [.closable,.miniaturizable], backing: .buffered, defer: false)
//                       window.isMovableByWindowBackground = true
//                       window.contentViewController = KSMainViewController.init()
//                       let windowController = NSWindowController.init(window: window!)
//                        windowController.showWindow(self)
            
            window = KSWindow.init(contentViewController: KSLoginVC())
            windowVC = KSWindowController.init(window: window)
            window?.titleVisibility = .hidden
            window?.styleMask = [.miniaturizable,.closable]
            window?.styleMask.insert(.fullSizeContentView)
            window?.titlebarAppearsTransparent = true
            window?.isMovableByWindowBackground = true
            windowVC.showWindow(self)
        }
    }
//    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
//        if let window = sender.windows.first{
//            if flag{
//                window.orderFront(nil)
//            }else{
//                window.makeKey()
//                window.orderFront(nil)
//            }
//        }
//        return true
//    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
   
    


}

