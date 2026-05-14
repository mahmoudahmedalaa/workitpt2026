# WorkiTPT App

This project is cloned from the initial project.

Firebase setup for two different flavors with its own seperate firebase configuration is setup.

flutter pub run build_runner build --delete-conflicting-outputs

---

Inorder to run app properly, you need to run the following command:

For Dev:

```bash
flutter run --flavor dev --dart-define=flavor=dev
```

For Prod: flutter run --flavor prod --dart-define=flavor=prod

---

Inorder to build android apk properly, you need to run the following command:

For Dev: flutter build apk --flavor dev --dart-define=flavor=dev

For Prod: flutter build apk --flavor prod --dart-define=flavor=prod

For Dev .aab: flutter build appbundle --flavor dev --dart-define=flavor=dev

For Prod .aab: flutter build appbundle --flavor prod --dart-define=flavor=prod

### To Build apk:

Dev - flutter build apk --flavor dev --dart-define=flavor=dev
Prod - flutter build apk --flavor prod --dart-define=flavor=prod

---

---

## To Do [September - 6]

- [x] Icon Import - Kabin [Completed]
- [x] Fitness Goal
- [x] Flavor setup for iOS - Kabin
- [x] Preference
- [x] Certification
- [x] Dropdown - Kabin/Rujeet [Completed]
- [x] Chips Dropdown - Kabin/Rujeet [Completed]
- [x] Upload File/Image Container - Kabin/Rujeet
- [x] Forgot Password - Kabin
- [x] OTP Page - Rujeet [Completed]
- [x] Country Picker - Rujeet

---

## 1st Sprint Ends [13 September]

[All UI Tasks]

- Home Page skeleton completed
- Profile Page 1st page completed
- Login Page Completed
- Signup Page Compeleted for both Trainer and User[Select location from maps integration is not completed yet]
- Terms and Conditions Page Completed
- Success Page Completed
- Forgot Password, Reset Password and OTP Page Completed

---

[App Setup Tasks]

- App Setup for theme, typography and routing completed
- Firebase setup for android and iOS completed
- Flavor setup for both android and iOS completed
- Assets generations and App components completed
- Validator setup for text inputs completed

---

[Remaining Tasks]

- API integrations of available APIs
- Linking UI to data types
- Creation of data models, request models and api request classes
- State Management for required pages

## 2nd Sprint [13 September]

## Done

- Login State Management
- Login Bloc, repo, controller setup
- Login API integration

---

- Social Login State Management
- Social Login Bloc, repo, controller setup
- Social Login API integration
- Google Auth Completed

---

- Signup for User State Management
- Signup for User Bloc, repo, controller setup
- Signup for User API integration

---

- OTP Page State Management
- OTP Page Bloc, repo, controller setup
- OTP Page API integration

---

- Profile for User State Management
- Profile for User Bloc, repo, controller setup
- Profile for User API integration
- Profile for Trainer State Management
- Profile for Trainer Bloc, repo, controller setup
- Profile for Trainer API integration

---

- Change Password State Management
- Change Password Bloc, repo, controller setup
- Change Password API integration
- Upload File Configuration setup

## Remaining

- Signup for Trainer State Management
- Signup for Trainer Bloc, repo, controller setup
- Signup for Trainer API integration

---

- Forgot Password State Management
- Forgot Password Bloc, repo, controller setup
- Forgot Password API integration

---

- Upload file linkup with UI and API integration
- Facebook Auth Implementation
- Link up of all pages and UI with team, routing setups.

---

## September 22, [Test Case]

- Onboarding screen ma next button sticky - Done
- Forgot Password Implementation - Done
- First use pachi aunu vayena Onboarding - In Progress
- Manage State of VerifyNumberView, response entity issues - In Progress
- When go back on Signup form, first page, Gender drop down is changed to null auto - Fixed
- same on second page, emergency relation drop down - Fixed
- Change of placepicker color on app bar, behind search bar - Waiting
- Update placepicker data return with LocationResult model from PlacePicker package - Waiting
- Adding place picker to Signup form, last page - Done
- Profile Picture adding - Done
- Location issues - extractGymLocation function - In progress
- Trainer Profile Edit, certification update - Done
- Forgot password type cast fixing - Done
- Facebook Login - Waiting
- Location picker dropdown, clears field with pressed on chip - Waiting
- Edit Profile section - Update Profile button - needs to be sticky - Done
- Edit Profile - On Update Profile click - Line 259 - Date time error - Done
- Trainer Image Page - UI, Image picker Done, API remaining

## Sep 27 [Session Setup - Trainer Side]

- API integrations
- UI form design

---

# 2nd Sprint ends

- Setup on Jira

---

# 3rd Sprint starts

- Trainer Session CRUD
- Chat Setup
- Notification Setup
- Search and Filter Setup
- Seperation of UI based on Role
- Facebook Signup

## 3rd Sprint October Test Cases

Done:

- Homepage design
- Analytics page design
- Session page design
- Add session page
- Analytics chart (bar chart, pie chart done)
- Filter Design
- add sessions
- get session list
- role check for session UI display
- UI updated on session page
- UI for chat page
- Ui for Notification Page
- Basic setup for chat page
- Basic setup for Notification Page
- update session(setup completed dependent on api)
- delete session(setup completed api not working)
- Upcoming Session design
- Session detail design
- location[single selection] in add session
- session filter
- Filter API integrations [API dependent]
- new session api integrations (upcoming sessions, previous sessions)

---

# Dashain!

### Design:

Fixed home page design issues.
Designed the booking page.
Designed filters for the booking page.
Addressed design issues and added a month section to the Analytics Line graph.
Designed the Customer Home Page with a focus on responsive design.
Made UI updates to the OTP verification page.
Added a timer in OTP verification.
Added a logout confirmation dialog.
Fixed a crash issue on the additional information page (null date time issue).
Fixed a profile update issue.
Updated the calendar UI.
Added date validation to the add session feature.
Fixed a filter issue in the user session.
Added missing fields and features to the add session.

### Development and Testing:

Worked on code optimization, merging, and testing.
Updated Android and iOS builds.
Addressed Android build time issues.
Conducted a demo with the client for the app.
Resolved QA issues, including fixing an iOS runtime bug.
Conducted app testing and discussions with the team for issue fixes.

### Calendar View:

Set up the calendar view, including Day, Month, and Weekly views.
Confirmed design and had discussions with the team.
Finalized the calendar view package.
Continued design work for the calendar view.

### Notifications:

Worked on notification issues with the backend team.

### Sprint Activities:

Attended sprint retrospective and planning meetings.
Completed tasks listed for this sprint.

---

# 4th Sprint Starts

## After Demo with client

- Add the checkbox text before the check box - Done
- Add text box for online - Done
- Refresh on Upcoming session after edit - Done
- Analytics page ma weekly and monthly in filter for graphs - Done
- remove bar graphs - Done
- Update calendar view with day.week.month views - Done
- Change title for Booked sessions to Pending Payment? - For Customer View
- In Filter - Add Workout location preferences
- Issues in Filter page - Work in archived but not in main page - Done

## Targets

- Calendar View
- Trainer and Customer Listing
- Booking Feature

## Issues and Fixes

- Date validation/limitations in Creat Session
- Jira Board listed Issues

## Other Features

- Pull to refresh addition
- Load the profile data regarding locations to the sessions automatically
- View all from hompage should redirect to sessions screen

# 24 Nov

**Summary of Tasks:**

1. **UI Development:**

   - Continued updates for Payment and Withdrawal screens.
   - Completed designs, confirmed layouts, and sent builds for testing.
   - Progressed UI updates and designs for payment, withdrawal, and checkout screens.

2. **Code Management:**

   - Refactored code, removed redundancies, and fixed the splash screen problem.
   - Merged team code and sent builds for testing.
   - Focused on code optimizations and dev testing.
   - Fixed bugs and addressed remaining issues.

3. **Collaboration and Meetings:**

   - Conducted team meetings for updates and Project Reports.
   - Effectively collaborated with the team.
   - Maintained focus on meeting project targets and deadlines.

4. **Trainer API and UI Implementation:**

   - Successfully implemented Trainer API and its associated UI.
   - Added workout location options for Trainer signup.
   - Resolved file upload issues on the certification page.
   - Added a dialog on the trainer image page.
   - Addressed initial date issues in adding a session.
   - Worked on and improved the trainer approval/denial flow.

5. **Booking API Integration:**
   - Added Booking API Integration.
   - Completed Booking List API Integration.
   - Conducted a productive Sprint Planning meeting with the team.
   - Implemented changes in Booking API and Workout Location filter.
   - Fixed session list, view session response, and booking details issues.
   - Integrated view session API in the details page.
   - Implemented Preferred time in the session booking page.
   - Ensured Flexible location functioning in the booking page.
   - Worked on radius validation in Google Map for flexible location.
   - Resolved model issues and conducted a meeting with the backend team for API fixes.
   - Implemented Time conflict validation dialog in the booking page.
   - Completed Add Booking API with flexible location.
   - Conducted further code optimization and issue fixes in booking and session pages.

**Upcoming Focus:**

1. **UI and API:**

   - Confirmation of UI implementations.
   - Ongoing work on API integrations and UI enhancements.
   - Continuous monitoring of workout location options for Trainer signup.

2. **Trainer Flow Refinement:**

   - Further refinement of Trainer approval/denial flow.
   - Ongoing improvements and issue fixes in certification and session pages.

3. **Booking System Enhancements:**
   - Continued work on flexible location functioning in the booking page.
   - Address Time slot selection issues.
   - Implement radius validation in Google Map for flexible location.
   - Conduct further code optimization and issue fixes in booking and session pages.

**Blockers:**

- Pending UI Confirmations and approvals before moving to ready for development in the Payment and Withdrawal screens.
- Payment, Booking API dependencies
- Customer Listing API dependent with Payment API
- Deployment of APIs

---

# 12 Dec [Update till now]

## Overall Acheivements and Tasks

- Trainer API integration
- Listing of Trainers
- Trainer Detail Pages
- Filter in Trainer Listing

---

- Customers API integration
- Listing of Customers
- Customers Detail Pages
- Filter in Customers Listing

---

- Booking UI implementations
- Booking API integrations
- Flexible location logic added to booking flow
- Upcoming booking, pending payment UI and API integrations in Home Page

---

- Payment UI implementations
- Payment API integrations
- Payment flow changed from app UI to webview
- Implementations of Webview to execute payment directly in webview

---

- QA listed issues fixed till date
- Booking, Session and Home page changes implemented as per the requirements
- Fixed issues in authentication flow
- Profile page updated as per the new reqirements
- API related issues updated to API team
- Recommended Trainer API implementations in home page

---

- Wallet/Withdraw Page UI implementations
- Wallet/Withdraw Page API integrations
- Notification Listing API integrations
- Notification UI Implementations
- UI updates in figma reflected in app

---

- Connected all pages that were related and co dependent to each other

## Remaining

- E-Receipt for payment details [Backend Dependent] [Done]
- Chat feature as a whole
- Refining the app flow/validations
- Streaks, Analytics and Activity API integrations [Backend Dependent] [Done]
- Calendar View UI optimizations [Done]
- Privacy Policy, About, and other such pages implementations through webviews [Website Dependent - Content to be confirmed from client]
