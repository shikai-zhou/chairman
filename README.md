# Chairman

## About
The Chairman is a mobile app and telegram bot that helps you to find free seats in libraries and study places.

## Motivation 

Imagine that it’s recess week and you want to go to the library to study for the midterms. Or maybe you just want to find seats quickly in between lessons. You look at the time now, and it’s 1pm. Everywhere is bound to be crowded at this time. 

Space is a premium for motivated and committed NUS students and it is hard to come by a good place to study with friends or collaborate. Ever had the occasion where you and your friends decide to meet somewhere, only to find out that you’ve made a wasted trip because the seats are all taken when you arrive? 

Worry no more, you can check the availability of study spaces with our Telegram bot and Mobile App. Furthermore, we will also suggest the study place best suited for your needs, so that you can check out if it is air-conditioned or has charging ports. 

## Aim 

We hope to make finding study places in school easier by having a Telegram Bot and Mobile app that will tell users about the current crowd situation at those study places. 

## User Stories 

1. As a student trying to find study places during peak hour, I can find out what is the likelihood of being able to find seats before I actually make a trip down. 
2. As a student working on a group project with my friends, I can find out which study places allow discussions.  
3. As a Librarian or Administrator, I can easily check how full the library is.  

## Scope of Project
The Telegram Bot provides a chat-like interface for students to check for seat vacancy, choose a seat, and then mark a seat as occupied. When they leave, they simply update the bot and mark the seat as unoccupied.

A Mobile Application will share a common database with the Telegram Bot and provide the same functionality with a traditional non-chat-based interface. 

The Telegram bot has limited features (cannot display real-time seat map) due to limited screen space. Hence the Mobile Application will have the following added features:

- View and navigate the floor plans of the libraries 

- Real-time seat map to find vacant seats

- Suggest study places according to your needs. E.g. Charging ports/ Allow discussions/ Air-Conditioned

- Find other places such as Cafes or Open Spaces and benches to study.

## Tech Stack
- Flutter
- Dart
- SQLite

## Links for flutter

A few resources for Flutter:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
