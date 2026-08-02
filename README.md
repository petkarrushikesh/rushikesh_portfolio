# Rushikesh Petkar - Premium Android & Flutter Portfolio App

A premium, highly interactive, and immersive developer portfolio built entirely with **Flutter and Dart**. This app is designed to represent Rushikesh's professional experience, technical skills, and commercial applications with top-tier visual aesthetics and responsive animations.

## 🌟 Visual Theme & Design Language

The design is engineered to evoke a highly polished, professional, and dark cosmic look:
- **Atmospheric Dark Backdrop**: Colored using custom deep navy-to-slate hues (`0xFF0A0E17`).
- **Signature Accent Colors**:
    - `0xFF3DDC84` (Android Green)
    - `0xFF8B7CF6` (Vibrant Violet Accent)
    - `0xFFFFB84D` (Corner Orange Accent)
- **Fluid & Responsive Layouts**: Fully adaptive desktop-to-mobile navigation shell, sliding drawer menu, custom widgets, and smooth physics-based animations.

---

## 🛠️ Key Architectural Features

1. **Interactive Skills Node Graph**:
    - A fully interactive, math-driven node graph using Custom Painters.
    - Connections glow dynamically between related skills.
    - Tapping/hovering on nodes reveals detailed metrics, integrated SDKs/libraries, and hardware connectivity details.
2. **Interactive Phone Simulator**:
    - Simulated 3D-shaded viewport presenting live mock versions of Rushikesh's shipped apps:
        - **Infierms**: Biometric-verified geofenced shift logger.
        - **EdaWallet**: Dynamic group ledgers and balance tickers.
        - **LearningEcke**: Interactive BLE/IoT package lessons.
3. **Responsive Timeline Log**:
    - Elegant chronological pipeline showing work history and key metrics.
4. **Validating Communication Portal**:
    - Fully interactive contact form with complete form validation and feedback loops.

---

## 📁 Project Structure

The project has been organized into standard, production-ready Flutter directory structures:

```text
flutter_code/
├── pubspec.yaml               # Package manifests and asset/dependency declarations
└── lib/
    ├── main.dart              # Core shell, Hero, About, Experience, Projects, and Contact sections
    └── skills_visualization.dart  # Custom Painter canvas and interactive skills node-graph engine
```

---

## 🚀 Getting Started (How to Run Locally)

Follow these simple steps to run this Flutter portfolio on your local machine:

### 1. Prerequisites
- Install the **Flutter SDK** (v3.0.0 or higher).
- Configure your editor (VS Code, Android Studio, or IntelliJ).

### 2. Setup Project
Create a new Flutter project in your desired workspace:
```bash
flutter create rushikesh_portfolio
```

### 3. Replace Source Files
1. Copy the contents of `/flutter_code/pubspec.yaml` and overwrite the default `pubspec.yaml` in your newly created project.
2. Copy `/flutter_code/lib/main.dart` and `/flutter_code/lib/skills_visualization.dart` into your new project's `lib/` directory.

### 4. Fetch Dependencies
Install the required third-party packages (such as `url_launcher`):
```bash
flutter pub get
```

### 5. Build and Launch!
Run the application on your preferred target device (Web, Android emulator, iOS simulator, or desktop):
```bash
flutter run
```

---

## 🧪 Dependencies Used
- `url_launcher`: For opening external URLs (LinkedIn, GitHub, Resume).
- `flutter_lints`: To ensure standard code style and guidelines.
