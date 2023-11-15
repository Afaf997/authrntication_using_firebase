import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LocationController extends GetxController {
  Rx<Position?> currentPosition = Rx<Position?>(null);
  RxString currentAddress = "My Address".obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getCurrentPosition() async {
    try {
      isLoading.value = true; // Set loading to true
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
            msg:
                "Permission for accessing location is denied, Please go to settings and turn on");
        Geolocator.requestPermission();
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);

        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placemarks.isNotEmpty) {
          Placemark place = placemarks[0];
          currentPosition.value = position;
          currentAddress.value =
              "${place.locality}, ${place.postalCode}, ${place.country}";
          update();
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading.value = false; // Set loading to false when done
    }
  }
}