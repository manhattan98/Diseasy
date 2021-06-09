//
//  FooterButtonProvider.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 04.06.2021.
//

import UIKit

class FooterButtonProvider {
    let footerView: UIView
    let footerHeight: CGFloat
    
    init(parent: UIViewController, action selector: Selector, fontSize: CGFloat, buttonHeight: CGFloat, verticalIndent: CGFloat, horizontalIndent: CGFloat, backgroundColor: UIColor) {
        self.footerHeight = verticalIndent + buttonHeight
        

        // configuring button
        let footerButton = UIButtonCustom()
        
        footerButton.setTitle(K.START_MODEL, for: .normal)
        
        let buttonWidth = parent.view.frame.width - horizontalIndent * 2
        
        footerButton.frame = CGRect(x: (parent.view.frame.width - buttonWidth) / 2, y: verticalIndent, width: buttonWidth, height: buttonHeight)
        
        footerButton.setTitleColor(.white, for: .normal)
        footerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        footerButton.clipsToBounds = true
        footerButton.cornerRadius = footerButton.frame.height / 4
        
        footerButton.setBackgroundColor(backgroundColor, forState: .normal)
        footerButton.setBackgroundColor(backgroundColor.darker(by: 30), forState: .highlighted)
        
        footerButton.addTarget(parent, action: selector, for: .touchUpInside)
        
        footerButton.makeSomeShadow(opacity: 0.3, radius: 10.0)
        
        
        self.footerView = UIView()
        self.footerView.addSubview(footerButton)
    }
}
