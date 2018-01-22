//
//  iProgressHUDDelegete.swift
//  iProgressHUD
//
//  Created by Saiful I. Wicaksana on 12/01/18.
//  Copyright © 2018 icaksama. All rights reserved.
//

import Foundation

@objc public protocol iProgressHUDDelegete {
    @objc optional func onTouch(view: UIView)
    @objc optional func onShow(view: UIView)
    @objc optional func onDismiss(view: UIView)
}
