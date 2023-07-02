# DummyApp
DummyApp is a simple demo app written with SwiftUI and Combine, consuming the [dummyJSON](https://dummyjson.com) API. The app allows users to browse a list of products and add them to a shopping cart.

## Set Up
To run the application, you can follow these steps:
1.	Clone the repository to your local machine.
2.	Open the project in Xcode 15.x.
3.	Build and run the app using the simulator or a connected device.

## Features
DummyApp has the following features:
-	Browse a list of products.
-	View product details, including title, description, price, and images.
-	Add products to a shopping cart.
-	View the shopping cart, including the list of products, the total price, and the total quantity.

## Architecture
- Modularised project structure, using SPM packages to encapsulate modules.
- Follows the Model-View-ViewModel (MVVM) screen architecture pattern.
- Uses the [swift-dependencies](https://github.com/pointfreeco/swift-dependencies) library to manage dependencies.
- Uses the Combine framework to handle asynchronous operations, such as network requests and data binding.
