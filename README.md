# 📈 Flutter Stocks App

Welcome to the **Flutter Stocks App**! This app brings you real-time stock updates, pulling live data from **Finnhub APIs**, with real-time price updates and a smooth search feature. The design takes inspiration from **Apple's Stocks app**.

## 🎥 Preview

[👀 Watch the Preview](https://drive.google.com/file/d/1VwJ7D-u9kdgrD6Ru3yjGyi3jVMqZp61M/view?usp=sharing)

## 🚀 Experience the App!

Exciting news! The app has been pushed to iOS **TestFlight**, and you can now experience it directly on your iPhone. 📱

[Join the TestFlight](https://testflight.apple.com/join/hs89kU7P)

## 📄 Architecture Design Document

Want to dive deeper into the technical details? Check out the [Architecture Design Document](https://drive.google.com/file/d/1T0B4RApH-NVkK5Mlsmc8D0RuN_ixaxIi/view?usp=sharing) for insights into the design choices made for this project.

## 🛠 Project Structure

The project is structured for **clean code** and **scalability**:

- `data_layer/`: Handles all the data communication logic, including repository implementations and data sources.
- `domain_layer/`: Manages business logic, including entities, use cases, and repository abstract classes.
- `lib/`: The main application code (Presentation layer).
    - `config/`: Environment settings and dependency injection configs.
    - `core/`: Core utilities and the presentation layer.
        - `presentation/`: UI widgets and state management (screens, Cubits/blocs).
        - `util/`: Helper functions and utilities.

This modular structure ensures easy testing, maintainability, and reusability of the `data_layer` and `domain_layer` in other apps with minimal changes.

## 🚀 Getting Started

### ⚙️ Pre-setup Steps

- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK**: Included with Flutter.
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### 📦 Installation and Running the App

1. **Clone the repository:**

    ```bash
    git clone https://github.com/mufayed/flutter-stocks-app.git
    ```

2. **Install dependencies:**

    ```bash
    cd flutter-stocks-app
    flutter pub get
    ```

3. **Create a Finnhub.io API token:**

    - Visit [Finnhub.io](https://finnhub.io/) and sign up.
    - Get your API token and add it to the app as an environment variable: `apiToken`.

4. **Run all tests across the project:**

    ```bash
    flutter test
    ```

5. **Run the application:**

    ```bash
    flutter run --dart-define=apiToken=[Your finnhub.io API token]
    ```

## ⚠️ Important Notes

- **Background Task Handling**:  
  The app currently does not manage background tasks efficiently. When the app goes to the background, the socket connection remains open and should be paused. Upon returning to the foreground, the socket should resume to ensure real-time updates.

- **Connection Issues**:  
  If the socket connection drops after some time, the app does not automatically reconnect. This needs fixing to keep the stock data updated without manual refresh.

- **Localization**:  
  All text strings should be moved to a single `.arb` file for easy localization and support for multiple languages in the future.

> These improvements could not be fully implemented due to time constraints.
