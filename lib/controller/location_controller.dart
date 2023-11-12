import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rescue/constants/globals.dart';
import 'package:geocoding/geocoding.dart' as geo;

class LocationController extends GetxController {
  RxBool isLoading = false.obs;
  RxString locationData = ''.obs;
  RxList coordinates = [].obs;

  void updateLocation(String location) {
    locationData.value = location;
    update();
  }

  void updateCoordinates(List location) {
    coordinates.value = location;
    update();
  }

  void getLocation() async {
    try {
      isLoading.value = true;
      Location location = Location();

      bool serviceEnabled = await location.serviceEnabled();

      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          isLoading.value = false;
          return;
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          isLoading.value = false;
          return;
        }
      }

      LocationData currentLocation = await location.getLocation();

      List<geo.Placemark> placeMarks = await geo.placemarkFromCoordinates(
          currentLocation.latitude!, currentLocation.longitude!);
      print(placeMarks);
      locationData.value =
          '${placeMarks[0].subLocality} ${placeMarks[0].locality}, ${placeMarks[0].administrativeArea}, ${placeMarks[0].country}';

      updateCoordinates([currentLocation.latitude, currentLocation.longitude]);

      myLocation =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // Handle any errors that may occur during location fetching
    }
    print(locationData);
    update();
  }
}
