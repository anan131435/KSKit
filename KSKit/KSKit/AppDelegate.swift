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
//            contentVC = KSBaseViewController.init()
//            window = NSWindow.init(contentViewController: contentVC!)
//            window.title = ""
//            let windowController = NSWindowController.init(window: window!)
//            windowController.showWindow(self)
            window = KSWindow.init(contentRect: CGRect.init(x: 0, y: 0, width: 680, height: 440), styleMask: [.closable,.miniaturizable], backing: .buffered, defer: false)
            window.isMovableByWindowBackground = true
            window.contentViewController = KSBaseViewController.init()
            window.makeKey()
            window.orderFront(nil)
            window.center()
        }else{//未登录过
//            window = KSWindow.init(contentRect: CGRect.init(x: 0, y: 0, width: 680, height: 440), styleMask: [.closable,.miniaturizable], backing: .buffered, defer: false)
//                       window.isMovableByWindowBackground = true
//                       window.contentViewController = KSBaseViewController.init()
//                       let windowController = NSWindowController.init(window: window!)
//                        windowController.showWindow(self)
            
            window = KSWindow.init(contentViewController: KSLoginVC())
            windowVC = KSWindowController.init(window: window)
            window.titleVisibility = .hidden
            window.styleMask = [.miniaturizable,.closable]
            window.styleMask.insert(.fullSizeContentView)
            window.titlebarAppearsTransparent = true
            windowVC.showWindow(self)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    func windowTest(){
         contentVC = KSBaseViewController.init()
                           window = NSWindow.init(contentViewController: contentVC!)
                window.titleVisibility = .hidden
        //        window.styleMask.remove(.titled)
                window.styleMask.remove(.resizable) //不可拖动
                window.isMovableByWindowBackground = true
                let visualEffect = NSVisualEffectView()
                visualEffect.blendingMode = .behindWindow
                visualEffect.state = .active
                visualEffect.material = .dark
                window.contentView = visualEffect
                window.titlebarAppearsTransparent = true
                window.styleMask.insert(.fullSizeContentView)
                
                           let windowController = NSWindowController.init(window: window!)
                           windowController.showWindow(self)
    }


}

