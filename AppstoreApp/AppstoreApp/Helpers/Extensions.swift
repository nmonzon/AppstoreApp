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

extension UIImageView{
    
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        backgroundColor = UIColor.lightGray
        contentMode = .scaleAspectFill
    }
}

extension UIButton {
    
    convenience init(title: String) {
        self.init(type: .system)
        setTitle(title, for: .normal)
    }
}
