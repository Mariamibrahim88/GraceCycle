import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grace_cycle/core/database/local/cache_helper.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/Authentication/data/repos/register_repo.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  final RegisterRepo registerRepo;
  //final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formTwoKey = GlobalKey<FormState>();

  final List<String> checkboxLabels = [
    'Heart_Disease',
    'Diabetes',
    'High_Blood_Pressure',
    'Obesity',
    'Hyperglycemia',
    'Kidney_Disease',
  ];

  List<bool> conditions = List.generate(6, (index) => false);
  List<String> selectedConditions = [];

  void selectCheckbox(int index, bool value) {
    //final updatedState = List<bool>.from(conditions);
    conditions[index] = value;
    _updateSelectedConditions();
    emit(RegisterCheckboxState(List.from(conditions)));
  }

  void _updateSelectedConditions() {
    selectedConditions = [];
    for (int i = 0; i < conditions.length; i++) {
      if (conditions[i]) {
        selectedConditions.add(checkboxLabels[i]);
      }
    }
    //print(selectedConditions);
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    try {
      emit(LocationLoading());
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Enable Location"),
            content: const Text(
                "Location services are disabled. Please enable GPS."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  await Geolocator.openLocationSettings();
                  Navigator.pop(context);
                },
                child: const Text("Enable"),
              ),
            ],
          ),
        );
        emit(LocationError("Location services are disabled."));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(LocationError("Location permission denied."));
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        emit(LocationError("Location permission permanently denied."));
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String address =
            "${place.street}, ${place.administrativeArea}, ${place.country}";
        addressController.text = address;

        emit(LocationLoaded(address));
      }
    } catch (e) {
      emit(LocationError("Failed to get location: $e"));
    }
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    final response = await registerRepo.register(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        address: addressController.text,
        conditions: selectedConditions,
        phonenumber: phonenumberController.text);

    response.fold((l) => emit(RegisterErrorState(l)), (r) async {
      await sl<CacheHelper>()
          .writeSecureData(key: ApiKeys.authorization, value: r.token);

      emit(RegisterSucessState());
    });
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;

  //       // تحديث حالة الكيوبت بدلاً من تغيير الـ controllers مباشرةً
  //       emit(RegisterSuccessState(
  //         name: googleUser.displayName ?? '',
  //         email: googleUser.email,
  //       ));
  //     } else {
  //       emit(RegisterErrorState("Google Sign-In was cancelled"));
  //     }
  //   } catch (error) {
  //     emit(RegisterErrorState("Google Sign-In failed: $error"));
  //   }
  // }
}
