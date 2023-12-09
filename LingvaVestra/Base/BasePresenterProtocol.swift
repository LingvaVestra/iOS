//
//  BasePresenterProtocol.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 09.12.2023.
//

import Foundation

protocol BasePresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
}

extension BasePresenterProtocol {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
}
