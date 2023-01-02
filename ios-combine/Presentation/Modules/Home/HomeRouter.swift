import Foundation

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: HomeViewController!

    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
}
