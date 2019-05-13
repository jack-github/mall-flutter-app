#!/bin/bash
flutter packages pub run build_runner clean

flutter packages pub run build_runner build --delete-conflicting-outputs

flutter run