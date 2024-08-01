# douyin_clone

使用Flutter开发的仿抖音的项目

## 使用技术

Server: Firebase Auth, Firebase Storage, Firebase Firestore

Client: Flutter, GetX

Architecture: MVC

## 安装

1. 配置firebase项目, 参考: https://firebase.google.com/docs/flutter/setup
    
    ```
    firebase login
    dart pub global activate flutterfire_cli

    # cd xx/douyin_clone
    flutterfire configure

    firebase project name: douyin-clone
    Android application id (or package name): top.sheltonma
    ```

2. 启动

    ```shell
      flutter pub get
      open -a simulator (to get iOS Simulator)
      flutter run
    ```

## 开发日记

[-](-)
