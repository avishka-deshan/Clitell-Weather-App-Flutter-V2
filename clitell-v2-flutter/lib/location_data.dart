import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/screens/weather_page.dart';
import 'package:weather_app/search_data.dart';

class LocationData{

  String searchText = '';

  Future<Position> locationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Permission.location.request();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Permission.location.request();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      await Permission.location.request();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  getUserLocation(String location) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      String? location = placemarks[0].subAdministrativeArea;
      searchText = location!;
      Search().search(searchText);
    } catch (err) {
      print("err");
    }
    return true;
  }

  void getLastKnownPosition() async {
    Position? position = await Geolocator.getLastKnownPosition();
    try {
      if (position != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        String? location = placemarks[0].subAdministrativeArea;
        searchText = location!;
        Search().search(searchText);
        print(location);
      }
    } catch (err) {
      print("err");
    }
  }

}