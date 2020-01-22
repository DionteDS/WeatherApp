//
//  UIView+Design.swift
//  WeatherApp
//
//  Created by Dionte Silmon on 1/21/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRadiusAndShadow()
    }
    
    
    func setRadiusAndShadow() {
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.9
        layer.shadowOffset = CGSize(width: 3, height: 0)
        layer.shadowColor = UIColor.white.cgColor
        
    }
}
