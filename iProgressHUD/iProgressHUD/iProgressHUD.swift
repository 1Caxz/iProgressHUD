//
//  iProgressHUD.swift
//  iProgressHUD
//
//  Created by Saiful I. Wicaksana on 12/01/18.
//  Copyright © 2018 icaksama. All rights reserved.
//

import Foundation
import UIKit

/** List of iProgressHUD Styles */
public enum iProgressHUDStyles {
    case vertical
    case horizontal
}

open class iProgressHUD {
    
    fileprivate var view: UIView?
    
    /** Setting indicator style. Default is ballClipRotatePulse. */
    open var indicatorStyle: NVActivityIndicatorType = .ballClipRotatePulse
    /** Setting iprogress style in vertical or horizontal. Default is vertical. */
    open var iprogressStyle: iProgressHUDStyles = .vertical
    /** Get the indicator view. */
    open var indicatorView: NVActivityIndicatorView!
    /** Get the modal view. You can set image on modal view. */
    open let modalView: UIImageView = UIImageView()
    /** Get the box view. You can set image on box view. */
    open let boxView: UIImageView!
    /** Get the caption view. */
    open let captionView: UILabel!
    /** Setting the indicator size in percent of box view. Default is 60%. */
    open var indicatorSize: CGFloat = 60
    /** Setting the alpha of modal view. Default is 0.7 */
    open var alphaModal: CGFloat = 0.7
    /** Setting the alpha of box view. Default is 0.7 */
    open var alphaBox: CGFloat = 0.7
    /** Setting box size in percent of width view. Default is 50%. */
    open var boxSize: CGFloat = 50
    /** Setting the corner radius of box view. Default is 12. */
    open var boxCorner: CGFloat = 12
    /** Setting the caption distance with indicator view. Default is 0. */
    open var captionDistance: CGFloat = 0
    /** Show or hide the caption view. Default is true. */
    open var isShowCaption: Bool = true
    /** Show or hide the modal view. Default is true. */
    open var isShowModal: Bool = true
    /** Show or hide the box view. Default is true. */
    open var isShowBox: Bool = true
    /** Give blur effect in modal view. Default is false. */
    open var isBlurModal: Bool = false
    /** Give blur effect in box view. Default is false. */
    open var isBlurBox: Bool = false
    /** Make the progress touchable. Default is false. */
    open var isTouchDismiss: Bool = false
    /** Change the modal view color. Default is white. */
    open var modalColor: UIColor = .white
    /** Change the box view color. Default is black. */
    open var boxColor: UIColor = .black
    /** Change the text color of caption. Default is white. */
    open var captionColor: UIColor = .white
    /** Change the indicator view color. Default is white. */
    open var indicatorColor: UIColor = .white
    /** Change the font size of caption. Default is 20. */
    open var captionSize: CGFloat = 20
    /** Setting the delegete. */
    open var delegete: iProgressHUDDelegete? = nil
    
    public init() {
        self.indicatorView = NVActivityIndicatorView(frame: .zero)
        self.boxView = UIImageView(frame: .zero)
        self.captionView = UILabel(frame: .zero)
    }
    
    public init(style: NVActivityIndicatorType) {
        self.indicatorView = NVActivityIndicatorView(frame: .zero)
        self.boxView = UIImageView(frame: .zero)
        self.captionView = UILabel(frame: .zero)
        self.indicatorView.type = style
    }
    
    /** get sharedInstance class of iProgressHUD */
    open static func sharedInstance() -> iProgressHUD {
        let iPHUD = iProgressHUD()
        return iPHUD
    }
    
    /** Attach the iProgressHUD in views */
    open func attachProgress(toViews: UIView...) {
        for view in toViews {
            let reinit = self.copy()
            reinit.view = view
            reinit.setupProgress(view: view)
            view.iprogressHud = reinit
        }
    }
    
    /** Attach the iProgressHUD in array views */
    open func attachProgress(toViews: [UIView]) {
        for view in toViews {
            let reinit = self.copy()
            reinit.view = view
            reinit.setupProgress(view: view)
            view.iprogressHud = reinit
        }
    }
    
    /** Attach the iProgressHUD in single view */
    open func attachProgress(toView: UIView) {
        let reinit = self.copy()
        reinit.view = toView
        reinit.setupProgress(view: toView)
        toView.iprogressHud = reinit
    }
    
    /** Check the progress is show or not. */
    open func isShowing() -> Bool {
        return indicatorView.isAnimating
    }
    
    /** Show iProgressHUD */
    open func show() {
        modalView.isHidden = false
        boxView.isHidden = false
        self.indicatorView.startAnimating()
        if delegete != nil {
            delegete?.onShow!(view: view!)
        }
    }
    
    /** Dismiss iProgressHUD */
    open func dismiss() {
        modalView.isHidden = true
        boxView.isHidden = true
        self.indicatorView.stopAnimating()
        if delegete != nil {
            delegete?.onDismiss!(view: view!)
        }
    }
    
    fileprivate func setupProgress(view: UIView) {
        self.boxSetting(view: view)
        self.indicatorSetting()
        self.captionSetting()
        self.modalSetting(view: view)
        
        let boxCenter = CGPoint(x: boxView.bounds.size.width/2, y: boxView.bounds.size.height/2)
        
        self.progressStyleSetting(boxCenter: boxCenter)
        
        if !isShowBox {
            self.boxView.backgroundColor = .clear
            if isBlurBox {
                self.boxView.subviews[0].removeFromSuperview()
            }
        }
        if isBlurBox {
            iProgressHUDUtilities.blurEffect(view: boxView, corner: boxCorner)
            self.boxView.alpha = 1
            self.boxView.backgroundColor = .clear
        }
        if isBlurModal {
            iProgressHUDUtilities.blurEffect(view: modalView, corner: 0)
            self.modalView.alpha = 1
            self.modalView.backgroundColor = .clear
        }
        if !isShowModal {
            self.modalView.backgroundColor = .clear
            if isBlurModal {
                self.modalView.subviews[0].removeFromSuperview()
            }
        }
        self.boxView.addSubview(indicatorView)
        if isShowCaption {
            self.boxView.addSubview(captionView)
        } else {
            self.indicatorView.center = boxCenter
        }
        view.addSubview(modalView)
        view.addSubview(boxView)
        if let lastViews = view.subviews.last {
            modalView.bringSubview(toFront: lastViews)
        } else {
            modalView.bringSubview(toFront: view)
        }
        boxView.bringSubview(toFront: modalView)
        modalView.isHidden = true
        boxView.isHidden = true
        
        if isTouchDismiss {
            let tap = UITapGestureRecognizer(target: self, action: #selector(touched))
            modalView.addGestureRecognizer(tap)
        }
    }
    
    @objc func touched() {
        dismiss()
        if delegete != nil {
            delegete?.onTouch!(view: view!)
        }
    }
    
    fileprivate func modalSetting(view: UIView) {
        self.modalView.frame = view.bounds
        self.modalView.backgroundColor = modalColor
        self.modalView.alpha = alphaModal
        self.modalView.isUserInteractionEnabled = true
    }
    
    fileprivate func indicatorSetting() {
        self.indicatorView.type = indicatorStyle
        self.indicatorView.color = indicatorColor
        self.indicatorView.autoresizingMask = [
            .flexibleLeftMargin,
            .flexibleRightMargin,
            .flexibleBottomMargin,
            .flexibleTopMargin
        ]
        let indSize = iProgressHUDUtilities.getHeightPercent(view: boxView, percent: self.indicatorSize)
        self.indicatorView.frame.size = CGSize(width: indSize, height: indSize)
    }
    
    fileprivate func boxSetting(view: UIView) {
        let boxCenter = CGPoint(x: view.bounds.size.width / 2, y: view.bounds.size.height / 2)
        self.boxView.backgroundColor = boxColor
        self.boxView.layer.cornerRadius = boxCorner
        self.boxView.alpha = alphaBox
        var boxWidth: CGFloat = 0
        var boxHeight: CGFloat = 0
        if iProgressHUDUtilities.getWidthPercent(view: view, percent: 100) < iProgressHUDUtilities.getHeightPercent(view: view, percent: 100) {
            boxWidth = iProgressHUDUtilities.getWidthPercent(view: view, percent: self.boxSize)
            if iprogressStyle == iProgressHUDStyles.vertical {
                boxHeight = iProgressHUDUtilities.getWidthPercent(view: view, percent: self.boxSize)
            } else if iprogressStyle == iProgressHUDStyles.horizontal {
                boxHeight = iProgressHUDUtilities.getWidthPercent(view: view, percent: self.boxSize / 3)
            }
        } else {
            boxWidth = iProgressHUDUtilities.getHeightPercent(view: view, percent: self.boxSize)
            if iprogressStyle == iProgressHUDStyles.vertical {
                boxHeight = iProgressHUDUtilities.getHeightPercent(view: view, percent: self.boxSize)
            } else if iprogressStyle == iProgressHUDStyles.horizontal {
                boxHeight = iProgressHUDUtilities.getHeightPercent(view: view, percent: self.boxSize / 3)
            }
        }
        self.boxView.frame = CGRect(x: 0, y: 0, width: boxWidth, height: boxHeight)
        self.boxView.center = boxCenter
    }
    
    fileprivate func captionSetting() {
        self.captionView.text = "loading..."
        self.captionView.font = UIFont.boldSystemFont(ofSize: captionSize)
        self.captionView.textColor = captionColor
        self.captionView.textAlignment = .center
        self.captionView.adjustsFontSizeToFitWidth = true
        if iprogressStyle == iProgressHUDStyles.vertical {
            self.captionView.setWidth(width: boxView.bounds.width - 5)
            let preferredSize = iProgressHUDUtilities.getSizeUILabel(label: captionView)
            self.captionView.setHeight(height: preferredSize.height)
        } else if iprogressStyle == iProgressHUDStyles.horizontal {
            self.captionView.setWidth(width: (boxView.bounds.width - (indicatorView.frame.width * 2)))
            let preferredSize = iProgressHUDUtilities.getSizeUILabel(label: captionView)
            self.captionView.setHeight(height: preferredSize.height)
        }
    }
    
    internal func progressStyleSetting(boxCenter: CGPoint) {
        if iprogressStyle == iProgressHUDStyles.vertical {
            self.indicatorView.center.x = boxCenter.x
            self.captionView.center.x = boxCenter.x
            self.indicatorView.center.y = boxCenter.y
            let indicatorY = CGPoint(x: boxCenter.x, y: (boxCenter.y - (indicatorView.frame.size.height / 2)) - ((captionView.frame.size.height + captionDistance) / 2))
            self.indicatorView.setY(y: indicatorY.y)
            self.captionView.setY(y: (self.indicatorView.frame.maxY + captionDistance))
        } else if iprogressStyle == iProgressHUDStyles.horizontal {
            self.indicatorView.center.y = boxCenter.y
            self.captionView.center.y = boxCenter.y
            self.indicatorView.center.x = boxCenter.x
            let indicatorX = CGPoint(x: (boxCenter.x - (indicatorView.frame.size.width / 2)) - ((captionView.frame.size.width + captionDistance) / 2), y: boxCenter.y)
            self.indicatorView.setX(x: indicatorX.x)
            self.captionView.setX(x: (self.indicatorView.frame.maxX + captionDistance))
        }
    }
}
