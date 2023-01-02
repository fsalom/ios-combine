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
