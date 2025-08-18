# MySwiftUI

A SwiftUI-based iOS app for browsing and viewing movie details, using modern SwiftUI patterns and async networking.

---

## Features

- Browse a list of now-playing movies
- View detailed information for each movie
- See cast, crew, production companies, and ratings
- Responsive UI with SwiftUI components
- Preview and test data for development

---

## Project Structure

```
MySwiftUI/
├── Helpers/                # Extensions and error helpers
├── Model/                  # Codable model definitions
├── NetworkInterface/       # Networking and persistence logic
├── ViewModels/             # ObservableObject view models
├── Views/                  # SwiftUI views and reusable components
├── Assets.xcassets/        # App icons and images
├── Preview Content/        # Test data and preview assets
├── MySwiftUIApp.swift      # App entry point
├── MySwiftUI.entitlements  # App entitlements
```

---

## Requirements

- Xcode 15 or later
- iOS 17.0+
- Swift 5.9+

---

## Setup Instructions

1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/MySwiftUI.git
   cd MySwiftUI
   ```

2. **Open in Xcode**
   - Double-click `MySwiftUI.xcodeproj` or open the folder in Xcode.

3. **Build and Run**
   - Select a simulator or your device.
   - Press `Cmd+R` to build and run.

4. **Testing**
   - Use the included preview data for SwiftUI previews.
   - Add your API keys or adjust network endpoints in `NetworkInterface/Interface.swift` if needed.

---

## Customization

- **API Endpoints:**  
  Update endpoints in `NetworkInterface/Interface.swift` as needed.
- **Preview Data:**  
  Modify files in `Preview Content/` for custom preview scenarios.
- **Assets:**  
  Add or replace images in `Assets.xcassets`.

---

## Contributing

Pull requests are welcome! Please open an issue first to discuss major changes.

---

## License

[MIT](LICENSE)
