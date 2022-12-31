//
//  HomeBuilder.swift
//  ios-combine
//
//  Created by Fernando Salom Carratala on 30/12/22.
//

import Foundation

final class HomeBuilder: HomeBuilderProtocol {
    func build() -> HomeViewController {
        let viewController = HomeViewController()        
        let networkClient = CryptoNetworkClient()
        let respository = CryptoRepository(networkClient: networkClient)
        let useCase = CryptoUseCase(repository: respository)
        let router = HomeRouter(viewController: viewController)
        let viewModel = HomeViewModel(router: router, cryptoUseCase: useCase)
        viewController.viewModel = viewModel
        return viewController
    }
}
