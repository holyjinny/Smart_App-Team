# smart_jtj

Smart Factory Team Project.

## Getting Started

Arduino + Android / IOS + Web 로 프로젝트 구성.

### Error 1
Error: ADB exited with exit code 1
Performing Streamed Install

adb: failed to install $Path/flutter-apk/app.apk: Failure [INSTALL_FAILED_INSUFFICIENT_STORAGE]
Error launching application on sdk gphone64 arm64.

해결 방안 : Device Manager - 해당 Emulator - Wipe Data.

#### Error 2
Searching for inspections failed: undefined method `map' for nil:NilClass
이유 : M1 Macbook

해결 방안
1. sudo arch -x86_64 gem install ffi (Terminal)
2. arch -x86_64 pod install (ios 폴더 위치에서)
