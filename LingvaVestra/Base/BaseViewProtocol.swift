//
//  BaseViewProtocol.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 09.12.2023.
//

import Foundation

protocol BaseViewProtocol: AnyObject {
    func showNavigationBar()
    func hideNavigationBar()
    
    func showTabBar()
    func hideTabBar()
}

extension BaseViewProtocol {
    func showNavigationBar() {}
    func hideNavigationBar() {}
    
    func showTabBar() {}
    func hideTabBar() {}
}
