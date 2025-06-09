# AVA Take Home Project

## Getting Started

Follow these steps to run the application on your local machine:

1. **Prerequisites**
    - Flutter SDK installed (latest stable version)
    - Android Studio or VS Code with Flutter extensions
    - A physical device or emulator

2. **Clone the Repository**
   ```bash
   git clone git@github.com:Tsames/ava_take_home.git
   cd ava_take_home

3. **Install Dependencies**
   ```flutter pub get```

4. **Running the Application**

Either connect your preferred device (this application is designed for mobile devices) or start up
your preferred emulator. Then run the application with:

```flutter run```

### Notes

The design in the app closely matches the figma designs with one notable exception. Since much of
the data on the home page is static, most of the animations I created would only be demonstrated
briefly upon start up. To give the user an opportunity to more easily view the animations while
using the app, I included a floating action button that would feed random values into the widgets on
the home page and thus trigger the animations. I took some creative liberties to create a rating
system with five different ratings and adjusted the colors from those provided in the figma design
to highlight these differences.

I implemented Riverpods to handle state in the application and used Hive for persistent storage of
user data.