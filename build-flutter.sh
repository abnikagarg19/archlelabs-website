#!/bin/bash

# Flutter build commands for web release
flutter/bin/flutter build web --release
cd flutter
if git pull; then
  cd ..
else
  git clone https://github.com/flutter/flutter.git
fi
ls
flutter/bin/flutter doctor
flutter/bin/flutter clean
flutter/bin/flutter config --enable-web