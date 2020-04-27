//
//  KSGlobalDefine.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/20.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Foundation

/// 全局的Closure  用于传参回调
public typealias KSParamClosure = (_ value: Any? )-> Void
/// 全局的Closure  用于传参数和回调
public typealias KSParamValueClosure = (_ value: Any? ) -> Any?

public typealias KSNoParamClosure = ()-> Void

let pressBtnNotificationName: String = "pressBtnNotificationName"
