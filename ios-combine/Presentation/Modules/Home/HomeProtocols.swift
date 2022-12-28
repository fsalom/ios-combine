//
//  HomeProtocols.swift
//  ios-combine
//
//  Created by Fernando Salom Carratala on 28/12/22.
//

import Foundation

protocol HomeViewModelProtocol {
    var infoUpdated: (() -> Void)? { get set }
    var errorOcurred: ((Error) -> Void)? { get set }

    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()
}

protocol HomeBuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeRouterProtocol {
}

