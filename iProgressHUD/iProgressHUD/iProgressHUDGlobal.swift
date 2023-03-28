//
//  iProgressHUDGlobal.swift
//  iProgressHUD
//
//  Created by Saiful I. Wicaksana on 12/01/18.
//  Copyright © 2018 icaksama. All rights reserved.
//

import Foundation
import UIKit

internal extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

public extension UIView {
    
    private struct AssociatedKeys {
        static var iprogressHud:iProgressHUD?
    }
    
    /** Set x Position */
    internal func setX(x: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    /** Set y Position */
    internal func setY(y: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    /** Set z Position */
    internal func setZ(z: CGFloat) {
        self.layer.zPosition = z
    }
    /** Set Width */
    internal func setWidth(width: CGFloat) {
        var frame: CGRect = self.frame
        frame.size.width = width
        self.frame = frame
    }
    /** Set Height */
    internal func setHeight(height: CGFloat) {
        var frame: CGRect = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    /** Get class of iProgressHUD. Make sure to attach progress first in this view. */
    internal var iprogressHud: iProgressHUD? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.iprogressHud) as? iProgressHUD
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.iprogressHud, newValue as iProgressHUD?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    /** Show the iProgressHUD directly from this view. */
    func showProgress() {
        if iprogressHud == nil {
            print("Failed! iProgressHUD never attached in this view.")
            return
        }
        self.iprogressHud?.show()
    }
    
    /** Stop the iProgressHUD directly from this view. */
    func dismissProgress() {
        if iprogressHud == nil {
            print("Failed! iProgressHUD never attached in this view.")
            return
        }
        self.iprogressHud?.dismiss()
    }
    
    /** Update the indicator style of iProgressHUD directly from this view. */
    func updateIndicator(style: NVActivityIndicatorType) {
        if iprogressHud == nil {
            print("Failed! iProgressHUD never attached in this view.")
            return
        }
        self.iprogressHud?.indicatorStyle = style
        self.iprogressHud?.indicatorView.type = style
        self.iprogressHud?.indicatorView.setUpAnimation()
    }
    
    /** Update the caption of iProgressHUD directly from this view. */
    func updateCaption(text: String) {
        if iprogressHud == nil {
            print("Failed! iProgressHUD never attached in this view.")
            return
        }
        iprogressHud?.captionView.text = text
        iprogressHud?.captionView.sizeToFit()
        let boxCenter = CGPoint(x: (iprogressHud?.boxView.frame.size.width)! / 2, y: (iprogressHud?.boxView.frame.size.height)! / 2)
        iprogressHud?.progressStyleSetting(boxCenter: boxCenter)
    }
    
    /** Update colors of iProgressHUD. Set nil if want not to change. */
    func updateColors(modalColor: UIColor?, boxColor: UIColor?, indicatorColor: UIColor?, captionColor: UIColor?) {
        if iprogressHud == nil {
            print("Failed! iProgressHUD never attached in this view.")
            return
        }
        if modalColor != nil {
            iprogressHud?.modalColor = modalColor!
            iprogressHud?.modalView.backgroundColor = modalColor
        }
        
        if boxColor != nil {
            iprogressHud?.boxColor = boxColor!
            iprogressHud?.boxView.backgroundColor = boxColor
        }
        
        if indicatorColor != nil {
            iprogressHud?.indicatorColor = indicatorColor!
            iprogressHud?.indicatorView.color = indicatorColor!
            iprogressHud?.indicatorView.setUpAnimation()
        }
        
        if captionColor != nil {
            iprogressHud?.captionColor = captionColor!
            iprogressHud?.captionView.textColor = captionColor
        }
    }
}

internal extension iProgressHUD {
    
    func copy() -> iProgressHUD {
        let reinit = iProgressHUD()
        reinit.indicatorStyle = self.indicatorStyle
        reinit.iprogressStyle = self.iprogressStyle
        reinit.indicatorSize = self.indicatorSize
        reinit.alphaModal = self.alphaModal
        reinit.boxSize = self.boxSize
        reinit.boxCorner = self.boxCorner
        reinit.captionDistance = self.captionDistance
        reinit.isShowCaption = self.isShowCaption
        reinit.isShowModal = self.isShowModal
        reinit.isShowBox = self.isShowBox
        reinit.isBlurBox = self.isBlurModal
        reinit.isBlurBox = self.isBlurBox
        reinit.isTouchDismiss = self.isTouchDismiss
        reinit.modalColor = self.modalColor
        reinit.boxColor = self.boxColor
        reinit.captionColor = self.captionColor
        reinit.indicatorColor = self.indicatorColor
        reinit.captionSize = self.captionSize
        reinit.delegete = self.delegete
        return reinit
    }
}
