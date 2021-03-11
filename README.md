# Google Login Sample

### This project is my practice project to use [google_sign_in](https://pub.dev/packages/google_sign_in) package from [pub.dev](https://pub.dev/).

### This project use Flutter ver 2.0, for the process of google sign in authentication, [firebase_core](https://pub.dev/packages/firebase_core) and [firebase_auth](https://pub.dev/packages/firebase_auth) is required because this project use Firebase and the Firebase Authentication service.

### If you want to use this project as an exercise, you need to follow these instructions:

- Have google account and sign in to firebase console
## For Android
- Create your project, add android app, and add the package ID, app name, and SHA1 keys (you can add this later in the project settings). The rest of instructions regarding this can be followed from Firebase instructions.
- In the project, open your terminal. from path `<project-root>/android`, use this command to generate SHA1 and SHA256 key that you can get from `Task :app:signingReport` in the terminal.
        
        ./gradlew signingReport

- Bring the keys to the project settings, then donwload new `google-services.json` and add it to path `<project-root>/android/app` or replace the existed one.

### Don't forget to check `pubspec.yaml` and `pubspec.lock` file to check the package availability. You can always run `flutter pub get` or `flutter pub upgrade` after clonning this repo.

### When testing in debug, try to look the result in the debug console. For now, I don't create the page that show the account data, but feel free to pull request if you update some widgets or screens.

## Keep Spirit and Stay Creative

        