![author](https://img.shields.io/badge/author-fernando%20salom-red)

# Combine

## Getting started

This is an example of how to use combine in a MVVM architecture with protocols, repositories and network clients

The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events. Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers.

https://developer.apple.com/documentation/combine


## How it works

In a clean architecture that should accomplish SOLID principles adding combine is sometimes complicated. In this example you will find an MVVM architecture that have all its dependencies injected through protocols.

Information move through the applications as follow:

Network client > Repository > Use Case > ViewModel > Viewcontroller

### Use Case
```swift
func getList() -> AnyPublisher<[CryptoDTO], Error> {
    return self.repository.getList()
}
```

### Repository
```swift
func getList() -> AnyPublisher<[CryptoDTO], Error> {
    return networkClient.getList()
}
```

### Network Client
```swift
func getList() -> AnyPublisher<[CryptoDTO], Error> {
    let url = URL(string: "https://api.coincap.io/v2/assets")!
    let request = URLRequest(url: url)
    print("☎️ Llamada a \(url.absoluteString)")
    return URLSession.shared.dataTaskPublisher(for: request)
        .tryMap { data, response in
            guard let response = response as? HTTPURLResponse else {
                throw CryptoNetworkError.invalidResponse
            }
            if (200..<300).contains(response.statusCode) {
                let decoder = JSONDecoder()
                do {
                    let json = try decoder.decode(DataNetworkResponse<[CryptoDTO]>.self, from: data)
                    print("📥 Recibimos \(json.data?.count ?? 0) cryptos")
                    return json.data ?? []
                } catch {
                    print("💥 ERROR: deconding \(error)")
                    throw CryptoNetworkError.decodeError
                }
            } else {
                print("💥 ERROR: badResponse code: \(response.statusCode)")
                throw CryptoNetworkError.badResponse
            }
        }
        .eraseToAnyPublisher()
    }
```
