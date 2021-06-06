//
//  AnimatedButton.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 04.06.2021.
//

import UIKit

@IBDesignable
class UIButtonCustom: UIButton {
    @IBInspectable
    var normalBackground: UIColor = .clear {
        didSet {
            backgroundColor = self.normalBackground
        }
    }

    @IBInspectable
    var highlightBackground: UIColor = .clear
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? highlightBackground : normalBackground
        }
    }

    func setBackgroundColor(_ c: UIColor, forState: UIControl.State) -> Void {
        if forState == UIControl.State.normal {
            normalBackground = c
        } else if forState == UIControl.State.highlighted {
            highlightBackground = c
        } else {
            // implement other states as desired
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        //commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //commonInit()
    }
    
    
    // MARK: - Animation
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let duration = 0.15
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: nil, completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let duration = 0.15
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: nil, completion: nil)
        
        super.touchesEnded(touches, with: event)
    }
}
