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
    
    init(parent: UIViewController, selector: Selector, fontSize: CGFloat, buttonHeight: CGFloat, verticalIndent: CGFloat, horizontalIndent: CGFloat, backgroundColor: UIColor) {
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
        
        
        // make some shadow
        footerButton.layer.shadowColor = UIColor.black.cgColor
        footerButton.layer.shadowOffset = CGSize.zero
        footerButton.layer.shadowOpacity = 0.5
        footerButton.layer.shadowRadius = 15.0
        footerButton.layer.masksToBounds =  false
        
        
        self.footerView = UIView()
        self.footerView.addSubview(footerButton)
    }
}
