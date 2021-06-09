//
//  MakeShadow.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 09.06.2021.
//

import UIKit

extension UIView {
    func makeSomeShadow(opacity: Float, radius: CGFloat) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
}
