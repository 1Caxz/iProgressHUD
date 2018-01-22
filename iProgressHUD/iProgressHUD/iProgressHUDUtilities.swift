//
//  iProgressHUDUtilities.swift
//  iProgressHUD
//
//  Created by Saiful I. Wicaksana on 13/01/18.
//  Copyright © 2018 icaksama. All rights reserved.
//

import Foundation

internal class iProgressHUDUtilities {
    
    internal static func blurEffect(view: UIImageView, corner: CGFloat) {
        let boxCenter = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        blurView.frame = view.frame
        blurView.center = boxCenter
        blurView.alpha = 0.8
        blurView.backgroundColor = view.backgroundColor?.withAlphaComponent(0.5)
        blurView.contentView.addSubview(vibrancyView)
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = corner
        view.insertSubview(blurView, at: 0)
    }
    
    internal static func getSizeUILabel(label: UILabel) -> CGSize {
        let uiLabel = UILabel(frame: CGRect(x: 0, y: 0, width: label.frame.width, height: .greatestFiniteMagnitude))
        uiLabel.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        uiLabel.adjustsFontSizeToFitWidth = true
        uiLabel.lineBreakMode = .byWordWrapping
        uiLabel.numberOfLines = label.numberOfLines
        uiLabel.text = label.text
        uiLabel.sizeToFit()
        return uiLabel.bounds.size
    }
    
    internal static func getXPercent(view: UIView, percent: CGFloat) -> CGFloat {
        return view.bounds.width - (view.bounds.width * ((100 - percent) / 100))
    }
    
    internal static func getYPercent(view: UIView,percent: CGFloat) -> CGFloat {
        return view.bounds.height - (view.bounds.height * ((100 - percent) / 100))
    }
    
    internal static func getWidthPercent(view: UIView,percent: CGFloat) -> CGFloat {
        return view.bounds.width * (percent / 100)
    }
    
    internal static func getHeightPercent(view: UIView,percent: CGFloat) -> CGFloat {
        return view.bounds.height * (percent / 100)
    }
    
    internal static func getWidthScreen() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    internal static func getHeightScreen() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
