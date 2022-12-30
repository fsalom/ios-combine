//
//  CryptoRepository.swift
//  coredatasample
//
//  Created by Fernando Salom Carratala on 26/11/22.
//

import Combine

protocol CryptoRepositoryProtocol {
    func getList() -> AnyPublisher<[CryptoDTO], Error>
}

final class CryptoRepository: CryptoRepositoryProtocol {
    private var networkClient: CryptoNetworkClientProtocol

    init(networkClient: CryptoNetworkClientProtocol){
        self.networkClient = networkClient
    }

    func getList() -> AnyPublisher<[CryptoDTO], Error> {
        return networkClient.getList()
    }
}
