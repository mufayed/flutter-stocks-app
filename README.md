# Flutter stocks app

This repository contains a Flutter app. It displays a list of stocks in real-time, pulling live data from Finnhub APIs, including real-time price updates and search functionality. The design is inspired by Apple's Stocks app.

## Preview

![Preview](https://test-generating.s3.us-east-1.amazonaws.com/rudy/stocks-app-prev.gif)


## Project Structure

The project is divided into multiple packages to maintain clean code and scalability:

- `data_layer/`: Handles all the data communication logics, including repositories implementation and data sources
- `domain_layer/`: Handles the business logics, including entities, use cases and repositories abstract classes
- `lib/`: The main application code (Presentation layer)
    - `config/`: Contains environment settings and DI configs
    - `core/`: Includes core utilities and the presentation layer
        - `presentation/`: Contains the UI widgets and the state management, including screens and Cubits/blocs
        - `util/`: Contains Helper functions and utilities

With this structure, testing and maintaining individual parts becomes straightforward, and the data_layer and domain_layer can be reused in other apps with little effort

## Getting Started

### Pre-setup Steps

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter installation.
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation and How to Run

1. **Clone the repository:**

    ```bash
    git clone 'url'
    ```

2. **Install dependencies:**

    ```bash
    cd [project_directory]
    flutter pub get
    ```
3. **Create a Finnhub.io API token:**

    - Go to [Finnhub.io](https://finnhub.io/) and create an account
    - Get your API token from the dashboard
    - Add the token to the app as a Dart environment variable "apiToken" in the `flutter run` command

4. **Run all tests across the project:**

    ```bash
    flutter test
    ```
   
5. **Run the application:**

    ```bash
    flutter run --dart-define=apiToken=[Your finnhub.io API token]
    ```