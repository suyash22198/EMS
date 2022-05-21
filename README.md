# flutter_boiler_plate

A new Flutter application.

## Getting Started

This project is a starting boiler plate for a Flutter application. In this boiler plate we used the mobx and providers
for the better state management. So the mobx uses Store classes which are compiled in the *.g.dart format.

Before running the application please run the below command if you don't see any *.g.dart format files.

[flutter packages pub run build_runner watch]

And if the *.g.dart format files are available then run this command.

<flutter packages pub run build_runner watch --delete-conflicting-outputs>

One more thing is need to get configure. For the connectivity dependency setup, first delete the dependency from the
pubspec.yaml file then run the below command.

<flutter pub pub add connectivity>

This command will automatically add all the required modules.

## Used Dependencies

 - intl (used for internalization)
 - shared_preferences (for storing data locally)
 - flutter_mobx (For state management, provides OBSERVERS)
 - provider (For state management)
 - mobx (For creating Stores for stateless widgets)
 - dio (For API calling)
 - connectivity (For internet connection check)

## Used dev_dependencies

 - build_runner (generates the *.g.dart files automatically)
 - mobx_codegen (for auto generating code for stores)