//
//  HomeProtocols.swift
//  ios-combine
//
//  Created by Fernando Salom Carratala on 28/12/22.
//

import Foundation
import Combine

protocol HomeViewModelProtocol {
    @Published (set) var response: Response? { get set }

    var infoUpdated: (() -> Void)? { get set }
    var errorOcurred: ((Error) -> Void)? { get set }

    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()

    func fetchData()
}

protocol HomeBuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeRouterProtocol {
}

