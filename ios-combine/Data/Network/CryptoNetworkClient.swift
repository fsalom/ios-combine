import Foundation
import Combine


enum CryptoNetworkError: Error{
    case badURL
    case badResponse
    case decodeError
    case badRequest
    case invalidResponse
}

protocol CryptoNetworkClientProtocol {
    func getList() -> AnyPublisher<[CryptoDTO], Error>
}

class CryptoNetworkClient {
    init() { }
}

extension CryptoNetworkClient: CryptoNetworkClientProtocol {
    func getList() -> AnyPublisher<[CryptoDTO], Error> {
        let url = URL(string: "https://api.coincap.io/v2/assets")!
        let request = URLRequest(url: url)
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse else {
                    throw CryptoNetworkError.invalidResponse
                }
                if (200..<300).contains(response.statusCode) {
                    let decoder = JSONDecoder()
                    do {
                        let json = try decoder.decode(DataNetworkResponse<[CryptoDTO]>.self, from: data)
                        print("☎️ Llamada para obtener \(json.data?.count ?? 0) cryptos")
                        return json.data ?? []
                    } catch {
                        print("💥 ERROR: deconding \(error)")
                        throw CryptoNetworkError.decodeError
                    }
                } else {
                    print("💥 ERROR: badResponse")
                    throw CryptoNetworkError.badResponse
                }
            }
            .eraseToAnyPublisher()
    }
}
