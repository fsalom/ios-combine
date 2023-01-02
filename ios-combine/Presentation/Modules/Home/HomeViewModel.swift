import Foundation
import Combine

final class HomeViewModel: HomeViewModelProtocol, ObservableObject {
    @Published var cryptos = [CryptoDTO]()
    var cryptosPublished: Published<[CryptoDTO]> { _cryptos }
    var cryptosPublisher: Published<[CryptoDTO]>.Publisher { $cryptos }
    private var disposables = Set<AnyCancellable>()

    let router: HomeRouterProtocol
    let useCase: CryptoUseCaseProtocol

    init(router: HomeRouterProtocol, cryptoUseCase: CryptoUseCaseProtocol) {
        self.router = router
        self.useCase = cryptoUseCase
    }

    func viewDidLoad() {
        fetchData()
    }

    func viewDidAppear() {
    }

    func viewDidDisappear() {
    }

    func fetchData() {
        useCase.getList()
            .receive(on: DispatchQueue.main)
            .sink(
              receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                  self.cryptos = []
                case .finished:                    
                  break
                }
              },
              receiveValue: { [weak self] listOfCryptos in
                guard let self = self else { return }
                self.cryptos = listOfCryptos
            })
            .store(in: &disposables)
    }
}
