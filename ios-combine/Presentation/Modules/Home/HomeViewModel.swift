//
//  HomeViewModel.swift
//  ios-combine
//
//  Created by Fernando Salom Carratala on 28/12/22.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    var infoUpdated: (() -> Void)?

    let router: HomeRouterProtocol

    var configurationsUpdated: (() -> Void)?
    var errorOcurred: ((Error) -> Void)?

    init(router: HomeRouterProtocol) {
        self.router = router
    }

    func viewDidLoad() {
    }

    func viewDidAppear() {
    }

    func viewDidDisappear() {
    }
}
