//
//  UILabel + Helpers.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 20/03/2022.
//

import UIKit

extension UILabel{
    
    convenience init(title: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = title
        self.font = font
    }
}
