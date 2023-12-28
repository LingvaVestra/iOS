//
//  UIView+extension.swift
//  LingvaVestra
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }

    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
