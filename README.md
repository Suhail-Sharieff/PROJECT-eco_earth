# 🌍 Eco_Earth

## Web view: [project-eco-earth.vercel.app](https://project-eco-earth.vercel.app/#/landing/)

## 🔍 Project Overview

Eco_Earth is a part of the Google Solution Challenge 2025 and focuses on 🌱 sustainable ♻️ waste management and recycling solutions.

## 📖 App Overview
EchoEarth is an innovative app aimed at promoting eco-friendly practices by encouraging recycling and the reuse of materials. It provides a platform where users can interact with vendors, report environmental pollution, locate recycling centers, and get rewarded for their contributions to the environment.

## Techstack details
- MVVM model with clean and manageable code
- GetX for efficient state management
- Firebase for authentication 
- Supabase for database storage

## 🔑 Key Features

### 🏠 Homepage
The homepage serves as a hub for users to access several features that promote sustainability.

### ♻️ Reusables
- Users can view available reusable items at affordable prices.
- If an item is in stock, users can click on it to see more details and opt to "Buy Now."
- The "Buy Now" option sends a notification to the vendor or product owner, requesting the purchase of the item.

### 📝 Complaint Registration
- Users can register complaints about environmental pollution, including e-waste, plastic, or any other type of waste.
- They can upload a photo, provide the location, and describe the pollution.
- Complaints will be publicly visible to municipalities and authorities for action.

### 🏭 Recycling Centers Near Me
- Displays nearby recycling centers with categories of materials they accept (e.g., e-waste, metal, plastic).
- Centers are rated out of five stars.
- Users can view the owner's name, location, accepted material categories, and rating by clicking on a recycling center.
- Option to "Request Services" by entering the weight of recyclable material, and a notification will be sent to the vendor for team collection.

### 📊 User Dashboard
- Users can track their history, including previous orders and contributions.
- Contributions (such as the number of recycled items) earn the user points.
- A leaderboard is displayed to showcase top contributors.

### 🤖 AI Waste Classifier (Gemini API)
- Users can take a picture of any waste and classify it using the Gemini API.
- Classifies waste into recyclable, reusable, or other types.

### 🏪 Vendor Registration
- Users can register as vendors by filling out a form.
- Vendor profiles are publicly visible to users for engagement.

### 🌍 Discover Section
- Users can explore other waste management portals, both government and private, for additional recycling opportunities.

### 🏆 Leaderboard
- Displays rankings based on points earned from recycling and environmental contributions.

### 🔔 Notifications
- Users are notified about rewards earned, ecological events participated in, or any other important updates.

## 🌿 Additional Information
EchoEarth combines convenience, user engagement, and environmental sustainability into one app. The platform promotes a circular economy by encouraging reuse, recycling, and responsible waste management.

# 🤝 How to Collaborate

To contribute to this project, follow these steps:

- **📥 Clone the Repository**: `git clone https://github.com/Suhail-Sharieff/PROJECT-eco_earth.git`
- **🔧 Install Dependencies** `pub get`
- **🔥 Connect to Firebase**:
  - 📜 Follow the instructions in the Firebase Console.
  - ⚡ Activate Firebase CLI.
- **🛠️ Set Up Supabase**:
  - 🗂️ Create a schema in your Supabase project editor.
    ![supabase-schema-xvvpxcbyerznsqbbagkv](https://github.com/user-attachments/assets/99d107e5-b534-464a-a15f-1cf904d1e686)
  - Also add a Enum `OrderStatus` that I have used to track Orders
```dart
enum OrderStatus {
  Packed,
  Shipped,
  Delivered,
  Paid,
  Approved,
  Cancelled,
}
```

  - 🔐 Ensure that RLS (Row Level Security) policies are defined for at least anonymous users.
- **📄 Create a `secrets.dart` File in the `lib` Folder**:
   ```dart
   /// 🔥 Firebase Configuration Constants
   const API_KEY_ANDROID = '';
   const API_KEY_WEB = '';
   const API_KEY_IOS = '';
   
   const APP_ID_ANDROID = '';
   const APP_ID_WEB = '';
   const APP_ID_IOS = '';
   
   const MESSAGING_SENDER_ID = '';
   const PROJECT_ID = '';
   const AUTH_DOMAIN = '';
   const STORAGE_BUCKET = '';
   const MEASUREMENT_ID = '';
   
   const IOS_BUNDLE_ID = '';
   
   const SUPABASE_URL = '';
   const ANON_KEY = '';
   const SERVICE_ROLE = '';
   const JWT_SECRET = '';
   
   const GEMINI_API_KEY = '';
   ```
- **🛠️ Ensure Version Compatibility**:
  - 🦋 Flutter 3.24.5
  - 🎯 Dart 3.5.4
  - 🛠️ DevTools 2.37.3
- **⚙️ Resolve JDK Issues**:
  - 📌 Refer to [Flutter Issue #156304](https://github.com/flutter/flutter/issues/156304#issuecomment-2397707812)
- **🚀 Start and Enjoy the App!**

---
## 📸 Some Screenshots

| | | |
|:-------------------------:|:-------------------------:|:-------------------------:|
| ![Home Page 1](https://github.com/user-attachments/assets/bedf19d7-dfbf-41f1-bae9-d1f99cff7274) | ![Home Page 2](https://github.com/user-attachments/assets/124094ff-de41-4ed5-9b66-2b02719005dd) | ![Profile](https://github.com/user-attachments/assets/3f12bbdc-e2bc-4182-aa94-c68a16e8ba57) |
| ![Settings](https://github.com/user-attachments/assets/05d633eb-cda4-4ea5-a897-cf27ec831631) | ![Reusables 1](https://github.com/user-attachments/assets/7c2743c8-52ac-46af-81bf-4543b522f7ec) | ![Reusables 2](https://github.com/user-attachments/assets/5620a762-b816-4edb-ae52-d4e6cba7c121) |
| ![Reusables 3](https://github.com/user-attachments/assets/5ceee140-a35e-4512-9d4f-ee6d6744f6d1) | ![Discover](https://github.com/user-attachments/assets/18d589b4-28cc-4c89-829a-43aa1fc8c8b5)  | ![Recycling Center 1](https://github.com/user-attachments/assets/1781df46-0685-488a-80c7-6d1ce7f1ca69) |
| ![Recycling Center 2](https://github.com/user-attachments/assets/e3a6a420-1c1b-46b9-869b-cfb52baf3008) | ![Dashboard 1](https://github.com/user-attachments/assets/6b3b8315-331c-4827-89a8-22e0e5d8e6a8) | ![Dashboard 2](https://github.com/user-attachments/assets/7d454b69-63ec-427c-9415-148b3fd3bef3) |
| ![AI Classifier 1](https://github.com/user-attachments/assets/15d1af27-dec0-4105-806a-19dd6bfc5cc7) | ![AI Classifier 2](https://github.com/user-attachments/assets/76b8251a-d67a-4f3d-9d68-76dd2cae7ae5) | ![Vendor 1](https://github.com/user-attachments/assets/96e62e00-19f2-45ac-9df5-42a0b0556ba1) |
| ![Vendor 2](https://github.com/user-attachments/assets/1177dbda-daf6-4bae-b2fb-4495dd2850c6) | ![Notifications](https://github.com/user-attachments/assets/b9602b6d-09be-432b-b05c-c9c5e71b6fe1) | ![Leaderboard](https://github.com/user-attachments/assets/9f7cd336-5ac3-4823-ba30-d6207a637ad4) |
| <img width="377" alt="image" src="https://github.com/user-attachments/assets/a26344eb-cee7-4d6c-814c-09a57dd4b728" /> | ![image](https://github.com/user-attachments/assets/a0e6c793-3624-489a-a1e2-2ac0081056a1)|![image](https://github.com/user-attachments/assets/aad981af-abe7-4bb4-9693-7077bc44a0c0)||

