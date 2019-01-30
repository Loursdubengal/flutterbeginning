# First flutter app

FlutterBegining

## Getting Started

My first project in Flutter to test the language and find a clean architecture.

The app consist to have a list of the activities you can do in your day and you have to select which you want to do.

Underscore "_" means that class or variables are privates

### Project structure

lib/
- [x] |- main.dart
- [ ] |- routes.dart (routes are still in main for the moment)
- [x] |- screens/
- [ ] |- util/ (not necessary until now)
- [ ] |- widgets/
- [ ] |- data/
- [ ] |- services/

1. **screens:** Contains the screens of your application. All files from here get imported into routes.dart
2. **util:** Contains the utilities/common functions of your application
3. **widgets:** Contains the common widgets for your applications. For example, Button , TextField etc.
4. **routes.dart:** Contains the routes of your application and imports all screens.
