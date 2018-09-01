# FlutterBoilerPlate
Flutter Boiler plate with redux
Fluter BoilerPlate with redux

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

Includes
data folder which holdes 3 4 files
api_client -> used to make api calls in network
app_repository -> middleware have access to this appRepository call define api call func here and call api client and use it in middleware
database client - > used to perform database action
preference client -> used to validate if user is logged in or not (if app user is not null then user is logged in)

main.dart file combines all the above 3 files

simple redux functionality added
click login button will call api with user name and password
 -> returns dummy user
 -> users logs in shows home page with menu drawer
 -> click logout logsout user from app i.e setting ap user value to null
