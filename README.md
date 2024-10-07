# Flutter stocks app

This repository contains a Flutter app. It displays a list of stocks in real-time, pulling live data from Finnhub APIs, including real-time price updates and search functionality. The design is inspired by Apple's Stocks app.

## Preview

[Watch the Preview](https://drive.google.com/file/d/1VwJ7D-u9kdgrD6Ru3yjGyi3jVMqZp61M/view?usp=sharing)

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

1. **Clone the repositoryt:**

    ```bash
    git clone https://github.com/mufayed/flutter-stocks-app.git
    ```

2. **Install dependencies:**

    ```bash
    cd flutter-stocks-app
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


## Important Notes

- **Background Task Handling**:  
  The app doesn’t manage background tasks effectively right now. When the app goes to the background, the socket connection remains open, which should ideally be paused. When the app returns to the foreground, the socket connection should resume to ensure stock prices are updated in real-time.

- **Connection Issues**:  
  If the socket connection disconnects after a certain period, the app does not automatically reconnect. This issue should be addressed to make sure the stock data is refreshed continuously without manual intervention.

- **Localization Support**:  
  All text strings currently displayed in the app should be moved to a single `.arb` file. This would make it easier to implement support for multiple languages in the future and improve overall app maintenance.

> These areas need improvement, but due to time constraints, they have not yet been fully implemented.


