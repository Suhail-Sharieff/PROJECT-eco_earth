# eco_earth

This project is a part of Google Solution Challenge 2025


For those who want to collaborate with this project
1. clone repo
2. Install all dependencies
3. Connect this to firebase account using instructions given in Firebase Console and activate firebase cli
4. Create schema in ur Supabase project editors:![supabase-schema-xvvpxcbyerznsqbbagkv (1)](https://github.com/user-attachments/assets/beb808df-377e-4205-b2b2-9807d75fee93), make sure u define RLS policies atleast for anon right now
5. Create a secrets.dart in lib folder like this:
```
   

/// Firebase Configuration Constants
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
const MEASUREMENT_ID = 'L';

const IOS_BUNDLE_ID = '';

const SUPABASE_URL='';
const ANON_KEY='';
const SERVICE_ROLE='';
const JWT_SECRET='';


const GEMINI_API_KEY='';
```
7. Make sure u solve version conflicts, the versions while i made this projects is:
Flutter 3.24.5 
Dart 3.5.4
DevTools 2.37.3
8. Resolve any JDK related issues wreft [ flutter/flutter#156304 (comment)](https://github.com/flutter/flutter/issues/156304#issuecomment-2397707812)
9. Enjoy the app!

## Some Screen shots
1. HomePage
   ![image](https://github.com/user-attachments/assets/bedf19d7-dfbf-41f1-bae9-d1f99cff7274)
   ![image](https://github.com/user-attachments/assets/124094ff-de41-4ed5-9b66-2b02719005dd)
2. Profile section
  ![image](https://github.com/user-attachments/assets/3f12bbdc-e2bc-4182-aa94-c68a16e8ba57)
3. Settings
   ![image](https://github.com/user-attachments/assets/05d633eb-cda4-4ea5-a897-cf27ec831631)
4. Reusables view
   ![image](https://github.com/user-attachments/assets/7c2743c8-52ac-46af-81bf-4543b522f7ec)
   ![image](https://github.com/user-attachments/assets/5620a762-b816-4edb-ae52-d4e6cba7c121)
   ![image](https://github.com/user-attachments/assets/5ceee140-a35e-4512-9d4f-ee6d6744f6d1)
5. Complaint filing
   ![image](https://github.com/user-attachments/assets/99f7c9a4-5ecd-46f7-8be7-8081c269ff23)
6. Recycling centres
   ![image](https://github.com/user-attachments/assets/1781df46-0685-488a-80c7-6d1ce7f1ca69)
   ![image](https://github.com/user-attachments/assets/e3a6a420-1c1b-46b9-869b-cfb52baf3008)
7. Every user can view thier dashboard
   ![image](https://github.com/user-attachments/assets/6b3b8315-331c-4827-89a8-22e0e5d8e6a8)
   ![image](https://github.com/user-attachments/assets/7d454b69-63ec-427c-9415-148b3fd3bef3)
8. AI image classifier
   ![image](https://github.com/user-attachments/assets/15d1af27-dec0-4105-806a-19dd6bfc5cc7)
   ![image](https://github.com/user-attachments/assets/76b8251a-d67a-4f3d-9d68-76dd2cae7ae5)
9. Vendor upon registeration can efficiently manage his contracts in realtime
    ![image](https://github.com/user-attachments/assets/96e62e00-19f2-45ac-9df5-42a0b0556ba1)
   ![image](https://github.com/user-attachments/assets/1177dbda-daf6-4bae-b2fb-4495dd2850c6)








   






