//
//  StatisticsView.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 09.06.2021.
//

import UIKit

extension ModelingViewController {
    func drawStatisticsView(fontSize: CGFloat, indent: CGFloat, innerIndent: CGFloat, space: CGFloat, backgroundColor: UIColor, labelColor: UIColor, healthly: inout UILabel?, infected: inout UILabel?) {
        let font = UIFont.systemFont(ofSize: fontSize)
        
        // title labels
        let healthlyLabel = makeLabel(origin: CGPoint(x: innerIndent, y: innerIndent),
                                      text: K.STATS_HEALTHY,
                                      labelColor: labelColor,
                                      font: font)
        let infectedLabel = makeLabel(origin: CGPoint(x: innerIndent, y: innerIndent + healthlyLabel.frame.height + innerIndent),
                                      text: K.STATS_INFECTED,
                                      labelColor: labelColor,
                                      font: font)
        
        // value labels
        let healthlyValue = makeLabel(origin: CGPoint(x: innerIndent, y: innerIndent),
                                      text: String(model.groupSize * 10),
                                      labelColor: labelColor,
                                      font: font)
        let infectedValue = makeLabel(origin: CGPoint(x: innerIndent, y: innerIndent),
                                      text: String(model.groupSize * 10),
                                      labelColor: labelColor,
                                      font: font)
        
        let titles = [healthlyLabel, infectedLabel]
        let values = [healthlyValue, infectedValue]
        
        values.forEach { $0.text = "0" }
        
        let background = UIView(frame: CGRect(x: indent,
                                              y: indent,
                                              width: (titles.max { $0.text!.count < $1.text!.count })!.frame.width + innerIndent * 2 + healthlyValue.frame.width + space,
                                              height: CGFloat(titles.count) * (titles[0].frame.height + innerIndent) + innerIndent))
        
        
        healthlyValue.frame.origin = CGPoint(x: background.frame.width - innerIndent - healthlyValue.frame.width,
                                             y: innerIndent)
        infectedValue.frame.origin = CGPoint(x: background.frame.width - innerIndent - infectedValue.frame.width,
                                             y: innerIndent + healthlyValue.frame.height + innerIndent)
        
        background.layer.cornerRadius = miscViewCornerRadius
        background.backgroundColor = backgroundColor
                
        values.forEach { background.addSubview($0) }
        titles.forEach { background.addSubview($0) }
        
        background.makeSomeShadow(opacity: 0.3, radius: 10.0)
        
        healthly = healthlyValue
        infected = infectedValue
        
        self.view.addSubview(background)
    }
    
    private func makeLabel(origin: CGPoint, text: String, labelColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel(frame: CGRect(origin: origin,
                                          size: (text as NSString)
                                            .size(withAttributes: [NSAttributedString.Key.font: font])))
        label.text = text
        label.textColor = labelColor
        label.font = font
        
        return label
    }
}
