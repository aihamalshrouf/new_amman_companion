# NEW AMMAN Companion App

## Selected App Idea
**Animal / Tourism App**

## Customized Project Type
**Smart City Tourism / Visitor Guide App**

## Project Description
NEW AMMAN Companion is a Flutter application that supports my graduation project, **NEW AMMAN – The Smart District**.  
The application is not the main control system of the graduation project. Instead, it works as a professional companion visitor guide that helps users explore smart city services, check service status, read usage instructions, and submit feedback.

The idea is categorized under the Tourism App option because it works as a visitor guide for smart district places and services instead of traditional tourism places.

## Student Information
- Student: Ayham Alshrouf
- Major: Intelligent Systems Engineering
- App Name: NEW AMMAN Companion
- Project Type: Companion Support Application

## Main Features
- Smart city themed Home screen.
- Services screen using `ListView.builder`.
- Service Details screen with data passed from the Services screen.
- Search feature for services.
- Filter services by category.
- Visitor Guide screen.
- Feedback screen with rating and comments sent through email.
- About screen with project explanation.
- Bottom Navigation Bar.
- Asset images and network images.
- External packages: `google_fonts` and `url_launcher`.
- Simple MVC structure.

## Screens
1. Home Screen
2. Services Screen
3. Service Details Screen
4. Visitor Guide Screen
5. Feedback Screen
6. About Screen

## Project Structure

```text
lib/
├── main.dart
├── controllers/
│   └── smart_district_controller.dart
├── models/
│   ├── feedback_model.dart
│   ├── guide_step_model.dart
│   └── service_model.dart
├── screens/
│   ├── about_screen.dart
│   ├── feedback_screen.dart
│   ├── guide_screen.dart
│   ├── home_screen.dart
│   ├── main_screen.dart
│   ├── service_details_screen.dart
│   └── services_screen.dart
└── widgets/
    ├── service_card.dart
    └── status_badge.dart
```

## Models Used

### ServiceModel
Represents each smart city service.  
It contains title, type, description, image path, network image URL, status, location, and highlights.

### GuideStepModel
Represents each step in the visitor guide.

### FeedbackModel
Represents feedback information such as service name, rating, and comment.

## Controller
The `SmartDistrictController` class manages the app data, service categories, guide steps, and filtering logic.  
This keeps the user interface clean and supports a simple MVC structure.

## OOP Concepts Used

### 1. Classes and Objects
The project uses model classes such as `ServiceModel` and `GuideStepModel`.  
Each service in the app is created as an object from the model class.

### 2. Encapsulation
The data and filtering logic are organized inside `SmartDistrictController` instead of writing everything directly inside UI files.  
This makes the project cleaner and easier to maintain.

## Packages Used
- `google_fonts`: Used for professional typography.
- `url_launcher`: Used to open an external GitHub profile link.

## How to Run

```bash
flutter pub get
flutter run
```

## Discussion Summary
This project is a Tourism / Visitor Guide App customized for NEW AMMAN Smart District.  
It supports my graduation project by improving the visitor experience without directly controlling the main system.  
The app uses Flutter screens, navigation, model classes, controller logic, ListView.builder, search/filter, assets, network images, packages, and a clean MVC structure.


## App Images and Logos
The project includes smart-city style logo assets for each service:
- Jarvis Café logo
- Smart Fashion logo
- Robot Assistance logo
- Smart Parking logo
- Emergency Safety logo
- Smart City Information Desk logo

The project also includes:
- `assets/images/app_launcher_icon.png` for the app launcher icon.
- `assets/images/app_phone_preview.png` for the external phone mockup / presentation image.