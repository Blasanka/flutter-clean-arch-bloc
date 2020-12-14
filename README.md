# customers_manager

Customer Management flutter app initially started to showcase
as a practical test and lately implemented as an Open Source resource.
Achieved within 12 hours.

### What contains:

 - Clean architecture
 - Dependency Injection using Injector
 - Bloc for state management
 - Dark theme
 - Localization
 - Sqflite CRUD (local service)
 - Navigator v1
 
### TODO (features):
 - Remote service
 - Theme switcher
 - Authentication
 - Flutter Web and Desktop support
 - Tests
 - Device (image for the customer)
 - Etc.

### Caveats:

 - Some rules of architecture have not achieved for the time being.
 - Blocs are not disposed :D
 
### How to run:
 
  - Clone the repo
  - If terminal,
    - Navigate to project root dir
    - Do `flutter pub get`
    - `flutter run --release`

APK can be found [here](apk/app-release.apk)

### Screenshots:

   ![Home Screen](screenshots/home.png?raw=true "All customers list")
   
   ![Update Screen](screenshots/update.png?raw=true "Update customer")
   
   ![Add Screen](screenshots/add.png?raw=true "Add customer")
   
   ![Detail Screen](screenshots/detail.png?raw=true "View customer details")