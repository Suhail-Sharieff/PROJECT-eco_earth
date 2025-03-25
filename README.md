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



