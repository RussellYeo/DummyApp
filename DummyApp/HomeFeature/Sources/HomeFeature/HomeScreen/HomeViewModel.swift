import Combine
import Dependencies
import DummyAPI
import Foundation
import PathMonitorClient
import SharedModels

public final class HomeViewModel: ObservableObject {
    @Dependency(\.pathMonitorClient) var pathMonitorClient: PathMonitorClient
    @Dependency(\.productsClient) var productsClient: ProductsClient
    
    @Published var isConnected: Bool = true
    @Published var products: [Product] = []
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    
    public init() {
        pathMonitorClient.networkPathPublisher
            .map { $0.status == .satisfied }
            .removeDuplicates()
            .sink { [weak self] isConnected in
                guard let self else { return }
                self.isConnected = isConnected
                if self.isConnected {
                    self.fetchMore()
                } else {
                    self.products = []
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchMore() {
        guard isConnected else { return }
        productsClient
            .getProducts(products.count, 30)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] page in
                    self?.products += page.products
                }
            )
            .store(in: &cancellables)
    }
    
    func onAppearProduct(product: Product) {
        let currentIndex = products.firstIndex(where: { $0.id == product.id })
        let indexShouldFetchNextPage = products.count - 4
        
        if currentIndex == indexShouldFetchNextPage {
            fetchMore()
        }
    }
}
