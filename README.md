# healthcare_app

The Healthcare App is a Flutter-based mobile application designed to make it easier for patients to find doctors, explore medical specialties, read health articles, and book appointments seamlessly.
The app uses Firebase as the backend (Authentication + Firestore) and Shared Preferences for local data caching and user session management.

🔍 Key Features
- User Onboarding & Authentication
- Splash, Onboarding, Welcome, Login, and Register screens
- Email & password authentication using Firebase Auth
- Local session storage via Shared Preferences

✔ Main Screens 

 Home:
- Search for doctors
- Browse medical specialties
- View popular doctors
- Read health-related articles
-----------------------------------------------
Favorites:
- Save and manage favorite doctors
-----------------------------------------------
Bookings:
- View upcoming appointments, delete bookings, and see real-time updates from Firestore
-----------------------------------------------
Profile:
- Edit user information and log out
-----------------------------------------------

🩺 Doctor Profile & Booking Flow

- View full doctor details
- Start booking with a guided multi-step flow:
-    Enter patient details (self or family member)
-    Choose date using an in-app calendar
-    Select appointment time
-    Set reminder
-    Confirm booking (saved to Firestore)

🛠 Tech Stack

Flutter & Dart
Firebase Authentication
Cloud Firestore
Shared Preferences
State Management (Bloc / Cubit)   

🎯 Purpose

This project aims to provide patients with a smooth healthcare experience—finding doctors, learning from articles, managing favorites, booking appointments, and controlling their profile, all through a clean and intuitive interface.

## 🎨 Figma Design
The complete UI/UX design for the Healthcare App is available on Figma:

[➡ View Figma Design] (https://www.figma.com/design/8kHjKbHZ67Wmkcdmg7jaDW/HealthCare-App-Final-Project?node-id=0-1&p=f&t=zNag8YdNAFXVEZA7-0)

