import Foundation
import Combine

protocol HomeViewModelProtocol {
    // Define name (wrapped value)
    var cryptos: [CryptoDTO] { get }
    // Define name Published property wrapper
    var cryptosPublished: Published<[CryptoDTO]> { get }
    // Define name publisher
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

