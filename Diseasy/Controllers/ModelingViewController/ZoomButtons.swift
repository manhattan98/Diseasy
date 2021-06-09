//
//  ZoomButtonsExtension.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 09.06.2021.
//

import UIKit

extension ModelingViewController {
    func drawZoomButtons(size: CGFloat, indent: CGFloat, backgroundColor: UIColor, labelColor: UIColor, pressedColor: UIColor, action selector: Selector, plus: inout UIButton?, minus: inout UIButton?) {
        let indent: CGFloat = 16
        let width: CGFloat = size
        let height: CGFloat = width * 2
        
        let frameWidth = view.frame.width
        
        let background = UIView(frame: CGRect(origin: CGPoint(x: frameWidth - width - indent, y: indent), size: CGSize(width: width, height: height)))
        
        background.addSubview(makeZoomButton(
                                frame: CGRect(x: 0, y: 0, width: width, height: width),
                                label: "+",
                                labelColor: labelColor,
                                pressedColor: pressedColor,
                                action: selector))
        
        background.addSubview(makeZoomButton(
                                frame: CGRect(x: 0, y: width, width: width, height: width),
                                label: "−",
                                labelColor: labelColor,
                                pressedColor: pressedColor,
                                action: selector))
        
        background.layer.cornerRadius = miscViewCornerRadius
        background.backgroundColor = backgroundColor
        
        background.makeSomeShadow(opacity: 0.3, radius: 10.0)
        
        plus = (background.subviews[0] as! UIButton)
        minus = (background.subviews[1] as! UIButton)
        
        self.view.addSubview(background)
    }
    
    private func makeZoomButton(frame: CGRect, label: String, labelColor: UIColor, pressedColor: UIColor, action selector: Selector) -> UIButton {
        let zoomButton = UIButtonCustom(frame: frame)
        zoomButton.setTitle(label, for: .normal)
        zoomButton.setTitleColor(labelColor, for: .normal)
        zoomButton.setTitleColor(pressedColor, for: .highlighted)
        zoomButton.titleLabel?.font = .systemFont(ofSize: zoomButton.frame.width / 1.5)
        zoomButton.addTarget(self, action: selector, for: .touchUpInside)
        
        return zoomButton
    }
}
