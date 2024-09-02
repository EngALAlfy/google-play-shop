# Flutter App


## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

## Tech Stack

- **Frontend**: Flutter
- **Backend API**: Laravel
- **Database**: MySQL

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/EngAlalfy/gpshop-flutter.git
   ```

2. Navigate to the project directory:

   ```bash
   cd gpshop-flutter
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```


   ```bash
   flutter pub run build_runner build
   ```


   ```bash
   flutter pub run easy_localization:generate --source-dir=assets/translations --format=keys
   ```

## Configuration

### Laravel API

1. Configure Laravel API endpoint in `lib/services/api_service.dart`.

   ```dart
   const String apiBaseUrl = 'YOUR_LARAVEL_API_ENDPOINT';
   ```

### Firebase

1. Set up a Firebase project and obtain the necessary credentials.
2. Configure Firebase in your Flutter app by replacing the `google-services.json` file.

## Usage

Run the app on an emulator or physical device:

```bash
flutter run
```

Follow on-screen instructions for phone number verification, creating advertisements, and utilizing chat functionality.

## Contributing

1. Fork the repository.
2. Create a new branch for your feature: `git checkout -b feature-name`.
3. Make your changes and commit them: `git commit -m 'Add feature-name'`.
4. Push to the branch: `git push origin feature-name`.
5. Submit a pull request.

## License

This project is licensed under the [Your License] - see the [LICENSE.md](LICENSE.md) file for details.
