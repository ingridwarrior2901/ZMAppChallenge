# ZMAppChallenge

ZMAppChallenge App show the posts from https://jsonplaceholder.typicode.com. 
The project was built in Xcode version 11.4 and iOS 13.4

![Screen Recording 2020-04-11 at 4 37 32 PM_2](https://user-images.githubusercontent.com/1762283/79055823-9be73600-7c15-11ea-989a-616451b3dc8a.gif)

## How to Run
- Open terminal and find the root folder of this project
- run `pod install`
- Then open `ZMAppChallenge.xcworkspace` file. 
- Finally in Xcode menu go to Product > Run 

#### Tests
- To run the tests you can use the shortcut `cmd + u` or in Xcode menu go to Product > Test

## App Architecture
the app uses **MVVM** Architecture

## Dependencies (Pods)
- [Lottie](https://github.com/airbnb/lottie-ios) a library to load animations from a JSON file, the animations that were used in the project you can found in this link https://lottiefiles.com 

- [Realm](https://github.com/realm/realm-cocoa) a library to handle persistency.

## Folder Structure

```
.
├── AppDelegate.swift
├── Common
│   ├── Constants
│   │   └── ZMAppGlobalConstants.swift
│   ├── Extensions
│   │   ├── ZMStringExtensions.swift
│   │   └── ZMUIViewControllerExtensions.swift
│   ├── Protocols
│   │   ├── ZMDataSourceProtocol.swift
│   │   ├── ZMTableViewCellProtocol.swift
│   │   └── ZMViewModelServiceProtocol.swift
│   └── Views
│       └── Lottie
├── DataManagers
│   ├── API
│   │   ├── ZMDataManagerNetworkProvider.swift
│   │   └── ZMNetworkBuilder.swift
│   ├── Local
│   │   ├── Post
│   │   └── ZMDataManagerCacheProvider.swift
│   └── Protocols
│       ├── ZMDataManagerCacheProtocol.swift
│       └── ZMDataManagerNetworkProtocol.swift
├── Info.plist
├── Modules
│   ├── Post
│   │   ├── Models
│   │   ├── ViewControllers
│   │   ├── ViewModels
│   │   └── Views
│   └── PostDetail
│       ├── Models
│       ├── ViewControllers
│       └── ViewModels
├── Resources
│   ├── Assets
│   │   └── Assets.xcassets
│   ├── JSON
│   │   └── Animations
│   ├── Locale
│   │   └── Localizable.strings
│   └── Storyboards
│       └── Base.lproj
├── SceneDelegate.swift
└── Services
    ├── Comment
    │   └── ZMCommentManagmentService.swift
    ├── Post
    │   └── ZMPostManagmentService.swift
    └── User
        └── ZMUserManagmentService.swift



```
