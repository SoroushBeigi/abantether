# abantether

## 🚀 Setup & Installation  

### Prerequisites  
- Flutter SDK installed ([Installation guide](https://docs.flutter.dev/get-started/install))  
- Android Studio/Xcode (for emulators) or a physical device.  
- Git (optional, for cloning the repository).  

### Option 1: Install via APK  
1. Download the `app-release.apk` file from the repository files.  
2. Transfer the APK to your Android device.  
3. Enable **"Install from unknown sources"** in your device settings.  
4. Open the APK file and follow the prompts to install.  

### Option 2: Build from Source  
1. **Clone the repository**:  
   ```bash  
   git clone https://github.com/your-username/your-repo-name.git  
   cd your-repo-name
 2. **Install dependencies:**:  
   ```bash  
   flutter pub get
 3. **Run the app:**:  
   ```bash  
   flutter run

## 🏗️ Architecture & State Management
This app follows **Clean Architecture** to enforce separation of concerns, scalability, and testability. Here’s the breakdown:  

1. **Cubit (Bloc)**:  
   - Used for state management to decouple business logic from UI.  
   - Follows the **Single Responsibility Principle** (SRP) by isolating state handling.  
   - Enables predictable state transitions and easy debugging.  

2. **Freezed**:  
   - Generates immutable data models and union classes.  
   - Reduces boilerplate and enforces **immutability**, aligning with the **Open/Closed Principle** (code open for extension, closed for modification).  

3. **GetIt**:  
   - Lightweight dependency injection (DI) for managing service classes.  
   - Supports **Dependency Inversion Principle** (DIP) by decoupling high-level modules from low-level implementations.  

4. **Clean Architecture Layers**:  
   - **Domain**: Business logic (entities, use cases, logic for validation).  
   - **Data**: Repositories, data sources (abstracted for flexibility).  
   - **Presentation**: UI, widgets, and state management (Cubit).  
   - Promotes **SOLID** compliance via strict layer boundaries and inversion of control.  

### **Why These Tools?**  
- **Testability**: Mocking dependencies (via GetIt) and isolated layers simplify unit/UI testing.  
- **Maintainability**: Freezed/Clean Architecture reduce code entropy.  
- **Scalability**: New features can be added without breaking existing logic. 

### **Example of choices:**
- Using two different @Named Dio instances seemes enough for the scale of this project, but DioFactory to create different instances based on different baseUrls could be a possible choice for bigger projects.
- Mappers for models and entities used to minimize layers dependency and coupling
- Widgets were separated to smaller reusable widgets for code readability and performance
- Final values and const widgets/class constructors used for minimal rebuilds and performance improvemenets
- Added app_constants file for consistency and maintainability

## **Additional features:**
- **Dark/Light theme**: ThemeCubit implemented to change app theme globally. a const ThemeSwitch widget was created to handle theme changes across the app
- **Secure token storage**: Used flutter_secure_storage for storing sensitive data.  
- **Modern UI and animations**: Implemented splash screen, used lottie for performant and beautiful animations, flutter animations for modern looks and smooth page transitions
- **Error handling**: Handled server errors and used default errors for network, database,... errors. used regex for validating email, phone number and password
- **Testing**: Wrote unit tests for regex validations and updated regex to handle edge cases
- **CI**: Used github actions for automated unit tests on each push


      
