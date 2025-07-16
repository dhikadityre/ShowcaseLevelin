# ShowcaseLevelin

**ShowcaseLevelin** is a modular iOS application built with SwiftUI and Swift Package Manager (SPM). It showcases scalable architecture, reusable feature modules, and a clean structure suitable for production-grade iOS apps.

---

## 🚀 Features

- Modular architecture using Swift Package Manager
- SwiftUI-first UI architecture
- Feature modules: Home, Auth, Environment, Network, etc.
- Clean MVVM + DI approach
- Environment-based configuration (development, staging, production)
- Lightweight, testable, and easy to maintain

---

## 🛠 Requirements

- iOS 13.0+
- Swift 5.5+
- Xcode 13+
- Swift Package Manager (SPM)

## 🛠 Architecture

```
AppMain/
├── AppDIContainer/
├── AppConfig/
├── Features/
│   ├── FeatureHome/
│   ├── FeaturePromo/
│   └── FeatureAbout/ (multi-repo, modular SDK)
├── SharedUI/
├── SharedDomain/
├── CoreModules/ (multi-repo SDK)
│   ├── CoreNetwork/
│   ├── CoreSecurity/
│   ├── CoreAnalytics/
│   ├── CoreEnvironment/
│   ├── CoreRemoteConfig/
│   ├── CoreError/
│   ├── CoreStorage/
│   ├── CoreCloudKit/
│   ├── CoreSwiftData/
│   └── CoreDesignSystem/
├── MockModules/
│   ├── MockCore/
│   ├── MockDomain/
│   └── MockData/
```

## 📄 License

This project is licensed under the Apache License.

## 🙋‍♂️ Author

Developed by @dhikadityre
