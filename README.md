# Netflix Clone - Flutter & Riverpod

A modern Netflix-style movie browsing application built with Flutter and Riverpod state management. This app demonstrates clean architecture principles, proper state management, and best practices for Flutter development.

---

### Download APK / View on web

<a href="https://github.com/chetanr25/netflix-clone-flutter/raw/refs/heads/main/assets/apk/app-release.apk">
<img src="https://camo.githubusercontent.com/2b0b605d77141fd0ff5f5aa8159f6121c4d4bd213d5ee2aba1753d678faaf28c/68747470733a2f2f692e6962622e636f2f71306d6463345a2f6765742d69742d6f6e2d6769746875622e706e67" width=350/>
</a>

<a href="https://netflix-clone-flutter.vercel.app">
<img src="https://github.com/user-attachments/assets/89ae37d2-353f-4ae4-8860-a688a6afa30a" width=350/>
</a>

---


## Screenshots

<table align="center">
  <tr>
    <td align="center"><img src="assets/screenshots/splash_screen.PNG" width="200"/><br/>Splash Screen</td>
    <td align="center"><img src="assets/screenshots/home_loading_screen.PNG" width="200"/><br/>Home Loading Screen</td>
    <td align="center"><img src="assets/screenshots/home_screen.PNG" width="200"/><br/>Home Screen</td>
    <td align="center"><img src="assets/screenshots/details_screen.PNG" width="200"/><br/>Details Screen</td>
  </tr>
  <tr>
    <td align="center"><img src="assets/screenshots/search_loading_screen.PNG" width="200"/><br/>Search Loading Screen</td>
    <td align="center"><img src="assets/screenshots/search_screen.jpeg" width="200"/><br/>Search Screen</td>
    <td align="center"><img src="assets/screenshots/search_screen_result.PNG" width="200"/><br/>Search screen results</td>
    <td align="center"><img src="assets/screenshots/no_internet_error_screen.PNG" width="200"/><br/>Error handling</td>
  </tr>
</table>

---

## Demo Video 
https://github.com/user-attachments/assets/7c0ffe77-8c44-4a09-8010-b1a63edf435c

---

## Features

- 🎬 Browse movies from TVMaze API
- 🔍 Real-time search functionality
- 💫 Smooth animations and transitions
- 🌙 Netflix-inspired dark theme
- 📱 Responsive design
- 🏗️ Clean architecture
- 🔄 State management with Riverpod
- ⚡ Fast and efficient

## Architecture

The project follows a clean architecture pattern with the following structure:

```
lib/
├── models/          # Data models
├── providers/       # Riverpod providers
├── screens/         # UI screens
├── services/        # API and business logic
├── widgets/         # Reusable UI components
└── main.dart        # App entry point
```

### Key Components

1. **Models**

   - `Movie`: Data class representing movie information
   - Handles JSON serialization/deserialization

2. **Providers**

   - `apiServiceProvider`: Provides API service instance
   - `moviesProvider`: Manages movie list state
   - `searchQueryProvider`: Manages search query state
   - `searchResultsProvider`: Manages search results state

3. **Screens**

   - `SplashScreen`: Initial loading screen
   - `MainScreen`: Bottom navigation handler
   - `HomeScreen`: Movie grid display
   - `SearchScreen`: Movie search interface
   - `DetailsScreen`: Movie details view

4. **Services**
   - `ApiService`: Handles API communication with TVMaze
5. **Widgets**
   - `MovieCard`: Reusable movie display card
   - `MovieGrid`: Grid layout for movies
   - `SearchBar`: Custom search input widget

## Setup & Installation

1. **Prerequisites**

   ```bash
   flutter --version  # Ensure Flutter is installed
   ```

2. **Dependencies**
   Add the following to your `pubspec.yaml`:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flutter_riverpod: ^2.4.0
     http: ^1.1.0
   ```

3. **Installation**

   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## Performance Considerations

- Lazy loading of images
- Image caching for faster loading and internet data savings
- SplashScreen for initial loading
- Efficient state management with Riverpod
- Minimal rebuilds using Consumer widgets
- Proper use of const constructors
