# AfriGoal

## Table of Contents

1. [Overview](#Overview)
2. [Onboarding](#Onboarding)

## Overview

### Description

AfriGoal is an app designed for soccer fans. It is specifically tailored to be the hub of all information related to the African Cup of Nations. Fans can to access live scores and real-time updates for all matches in the African Cup of Nations. Users can see scores for upcoming matches and current group standings. 

### App Evaluation

   - **Description**: AfriGoal is an app designed for soccer fans. It is specifically tailored to be the hub of all information related to the African Cup of Nations. Fans can to access live scores and real-time updates for all matches in the African Cup of Nations. Users can see scores for upcoming matches and current group standings. 
   - **Category:** Sports
   - **Mobile:**  AfriGoal app's real-time features, push notifications, and habit-forming potential, combined with the scope of future updates, make it a uniquely mobile tool for soccer fans. The focus on timely, interactive, and engaging content tailored to the African Cup of Nations sets it apart from a basic website. 
       - **Real-Time Updates:** The app provides real-time updates for live scores and match results. This real-time feature is essential for soccer fans who want to stay updated on matches as they happen. It distinguishes the app from a static website
       - **Push Notifications:** Users can receive real-time notifications when teams score. This push notification feature is a key mobile aspect, keeping users informed and engaged during matches
   - **Story:** AfriGoal's story is compelling because it addresses a specific user need, extends its reach to a global audience, and emphasizes its long-term usefulness. The value of the app is clear: it keeps users informed, engaged, and connected to the world of African soccer, making it an appealing and valuable tool for its intended audience. 
   - **Market:** In 2013, the World Bank and African Development Bank reported that there are 650 million mobile users in Africa. Soccer is the most popular sport on a continent. The African diaspora spans across the Americas and Europe. This app has the potential to be the first of its kind in a promising and untapped market. A fully scaled app could be sold to organisers of the Africa Cup of Nations. 
       - **African Soccer Fans:** This is the primary target market for AfriGoal. It encompasses soccer enthusiasts across all 55 African countries who follow and support their national teams and players. These fans are passionate about the sport and the African Cup of Nations and are eager for real-time updates.
       - **International Soccer Fans:** Beyond the African continent and the diaspora, the app can also cater to international soccer fans who are interested in global soccer competitions. The African Cup of Nations has gained popularity worldwide given that many African nationals play in international leagues across the world. 
       - **Potential Partners:** In the future, the app could be of interest to potential partners and sponsors of the African Cup of Nations or related soccer events. As the app grows and gains users, it may become a valuable platform for advertisers, sponsors, and organizers to connect with their target audience.
   - **Habit:** The app is designed to cater to the habit of users during the African Cup of Nations, which occurs on odd-numbered years (2023, 2025, 2027) and runs for about 5 weeks. Mobile devices are essential for users to check group standings and scores regularly during this time.


## Onboarding

This branch focuses on the **user onboarding experience** to help new users select their favorite teams and personalize their app experience right from the start.

### ✅ Features Implemented

- [x] **Team Selection UI** – Users can browse and select multiple national teams they want to follow.
- [x] **Search Functionality** – A search bar allows filtering teams by name.
- [x] **Responsive Grid Layout** – Clean, grid-based layout that adapts to screen size with visual feedback for selected teams.
- [x] **Smooth Header Animation** – The header shrinks or hides on scroll for more screen space while selecting teams, powered by [ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView) from [Exyte](https://github.com/exyte)
- [x] **Keyboard Dismissal on Scroll** – Smart gesture handling to dismiss the keyboard when the user starts scrolling.
- [x] **Continue Button Activation** – The "Continue" button becomes active only when the user has selected at least one team.
- [x] **Skip Option** – Users can optionally skip team selection and proceed to the next step.
- [x] **Notification Permission Prompt** – After choosing their favorite teams, users are asked to enable push notifications for live scores and match updates.

### 🎓 What I Learned
- Implementing **keyboard dismissal with drag gestures** in SwiftUI using `.simultaneousGesture` to preserve scroll behavior.
- Managing **state across views** using `@StateObject` and `@Binding` effectively.
- Learned how to refactor an existing component by integrating and customizing a component from an open-source SwiftUI library created by [Exyte](https://github.com/exyte).
- Structuring **scrollable content with animations** for a polished onboarding feel.
- Fine-tuning layout with `GeometryReader`, `ZStack`, and `Spacer()` to handle different screen sizes and navigation stacks.
- Building a secure **Python FastAPI backend** to safely proxy and manage API key/secret for LiveScoreAPI, enabling secure data fetching from the iOS app without exposing sensitive credentials.
- Learned how to deploy a FastAPI backend to **Render**, securely manage API keys with environment variables, and connect the iOS app to a live backend so both simulator and physical devices can fetch data remotely
- Applying the **MVVM pattern** by using a ViewModel to bridge the View and Model layers, ensuring a clear separation of concerns and making SwiftUI code more scalable and testable


### 🖼️ Design Screens
- Mid-fidelity mockups created in Figma by me, illustrating the onboarding's core screens and user flow
<img width="394" height="863" alt="1" src="https://github.com/user-attachments/assets/66757df6-ff5e-4639-b218-652fd7c7d901" />
<img width="394" height="863" alt="2" src="https://github.com/user-attachments/assets/c3fbb3f0-e6c8-49cd-8e24-0d817da9b122" />
<img width="394" height="863" alt="3" src="https://github.com/user-attachments/assets/0e1084ad-814d-44df-9f49-71b4f4bbc682" />

## Credits
- [ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView) by [Exyte](https://github.com/exyte)
