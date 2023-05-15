# DummyApp
DummyApp is a simple demo app written with SwiftUI and Combine, consuming the [dummyJSON](https://dummyjson.com) API. The app allows users to browse a list of products and add them to a shopping cart.

## Set Up
To run the application, you can follow these steps:
1.	Clone the repository to your local machine.
2.	Open the project in Xcode 14.x.
3.	Build and run the app using the simulator or a connected device.

The app has no third-party dependencies, so you should be able to run it without any additional setup.

## Features
DummyApp has the following features:
-	Browse a list of products.
-	View product details, including title, description, price, and images.
-	Add products to a shopping cart.
-	View the shopping cart, including the list of products, the total price, and the total quantity.

## Architecture
DummyApp follows the Model-View-ViewModel (MVVM) architecture pattern. 

The app also uses the Combine framework to handle asynchronous operations, such as network requests and data binding.