## Приложение для изучения англиского языка

### Стэк
- UIKit
- Alamofire
- SwiftLint
- SwiftGen
- MVP

### Для разработчиков

Для того, чтобы подключить SwiftGen, у вас должен быть установлен home brew.

Чтобы уставноить swiftGen, запустите команду
```bash
brew install swiftgen
```

Если SwiftGen выдает ошибку, проверьте путь к SwiftGen с помощью команды
```bash
which swiftgen
```
и измените путь в скрипте (Build Phases -> SwiftGen), если он отличается.
```bash
if test -d "/opt/homebrew/bin/"; then
  PATH="/opt/homebrew/bin/:${PATH}"
fi

export PATH 

if which swiftgen >/dev/null; then
    swiftgen
else
    echo "error: SwiftGen not installed, run 'brew install swiftgen' or install via CocoaPods/Swift Package Manager"
    exit 1
fi
```






