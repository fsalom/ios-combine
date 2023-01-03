import Foundation
import Combine

protocol HomeViewModelProtocol {
    var cryptos: [CryptoDTO] { get }
    var cryptosPublished: Published<[CryptoDTO]> { get }
    var cryptosPublisher: Published<[CryptoDTO]>.Publisher { get }

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

