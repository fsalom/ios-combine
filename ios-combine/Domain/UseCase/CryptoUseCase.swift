//
//  CryptoUseCase.swift
//  coredatasample
//
//  Created by Fernando Salom Carratala on 26/11/22.
//

import Foundation
import Combine

enum CryptoUseCaseError: Error{
    case badURL
    case badResponse
    case decodeError
    case badRequest
    case invalidResponse
}

final class CryptoUseCase {
    let repository: CryptoRepositoryProtocol

    init(repository: CryptoRepositoryProtocol) {
        self.repository = repository
    }
}

protocol CryptoUseCaseProtocol {
    func getList() -> AnyPublisher<[CryptoDTO], Error>
}

extension CryptoUseCase: CryptoUseCaseProtocol {
    func getList() -> AnyPublisher<[CryptoDTO], Error> {
        return self.repository.getList()
    }
}
