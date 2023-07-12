import Combine
import Dependencies
import DummyAPI
@testable import HomeFeature
import SharedModels
import SharedModelsMocks
import XCTest

class HomeViewModelTests: XCTestCase {

    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testFetchFirstPage() {
        // GIVEN some products will be returned by the products client
        let viewModel = withDependencies {
            $0.pathMonitorClient = .satisfied
            $0.dummyAPIClient.getProducts = { (_, _) in
                let products: [Product] = [
                    .iPhoneX,
                    .iPhone9,
                    .samsungUniverse
                ]
                let page = ProductsPage(products: products, total: 10, skip: 0, limit: 3)
                return Just(page)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
        } operation: {
            HomeViewModel()
        }
        
        // AND the products will be updated
        let expectation = XCTestExpectation(description: "Products were updated")
        viewModel.$products
            .dropFirst()
            .sink { result in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // WHEN the ViewModel is initialised
        wait(for: [expectation], timeout: 1.0)
        
        // THEN there are some products to display
        XCTAssertEqual(viewModel.products.count, 3)
        XCTAssertNil(viewModel.error)
    }

}

