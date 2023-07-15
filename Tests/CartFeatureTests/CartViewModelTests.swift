import CartPersistence
import Combine
import Dependencies
@testable import CartFeature
import SharedModels
import SharedModelsMocks
import XCTest

final class CartViewModelTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testReload() {
        // GIVEN a Cart with two products
        let cart = Cart(
            items: [
                CartItem(product: .iPhoneX, quantity: 2),
                CartItem(product: .iPhone9, quantity: 1)
            ],
            totalPrice: 2347,
            totalProducts: 2,
            totalQuantity: 3
        )
        let cartPublisher = Just(cart)
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
        
        // WHEN we initialise the ViewModel
        let viewModel = withDependencies {
            $0.cartClient = .noop
            $0.cartClient.cartPublisher = cartPublisher
            $0.numberFormatter = .USD
        } operation: {
            CartViewModel()
        }
        
        // THEN the initial state will be loaded
        XCTAssertEqual(viewModel.isEmptyState, false)
        XCTAssertEqual(viewModel.items.count, 2)
        XCTAssertEqual(viewModel.totalPrice, "$2,347.00")
        XCTAssertEqual(viewModel.totalQuantity, 3)
    }
    
}
