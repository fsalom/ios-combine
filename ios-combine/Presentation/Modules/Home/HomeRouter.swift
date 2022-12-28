//
//  HomeRouter.swift
//  ios-combine
//
//  Created by Fernando Salom Carratala on 28/12/22.
//

import Foundation

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: HomeViewController!

    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
}
