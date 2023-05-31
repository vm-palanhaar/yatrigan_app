import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:yatrigan/src/view/error/conn_tout_screen.dart';
import 'package:yatrigan/src/view/error/internet_screen.dart';

import 'http_status_code.dart';

class HandleErrorsApi {
  BuildContext? context;
  String errorMessage = '';
  bool logoutUser = false;
  bool permissionDenied = false;

  Future<void> handleErrorApi(
      {required Map<String, dynamic> response,
      required HttpStatusAction? action}) async {
    switch (action) {
      case HttpStatusAction.ok:
        errorMessage = '';
        if (response.containsKey('error')) {
          errorMessage = '${response['error']}';
        }
        //Success
        break;
      case HttpStatusAction.badRequest:
        errorMessage = '${response['error']}';
        //Failure
        break;
      case HttpStatusAction.unauthorized:
        errorMessage = 'You\'ve Been Logged Out!';
        logoutUser = true;
        _showErrorDialog(errorMessage);
        //Failure
        break;
      case HttpStatusAction.forbidden:
        errorMessage = 'Sorry, You Are Not Allowed To Access This Resource!';
        permissionDenied = true;
        //Failure
        break;
      case HttpStatusAction.notFound:
        errorMessage = 'Please Try Again After Sometime. We are on a Break.';
        //Failure
        break;
      case HttpStatusAction.internalServerError:
        errorMessage = 'Please Try Again After Sometime.';
        //Failure
        break;
      case null:
        errorMessage = 'Please Contact iDukaan Support Team.';
        //Failure
        break;
    }
  }

  void _showErrorDialog(String error) {
    showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        title: const Text(
          'Error',
        ),
        content: Text(
          error,
        ),
      ),
    );
  }

  void unAuthorizedAccess401(BuildContext context) {
    this.context = context;
    _showErrorDialog('You have been logged out!');
  }

  void permissionDenied403(BuildContext context, String error) {
    this.context = context;
    _showErrorDialog(error);
  }

  void connectTimeOut({
    required String error,
    required bool show,
  }) {
    log(error);
    if (show) {
      Navigator.pushNamed(context!, ConnToutScreen.id);
    }
  }

  Future<bool> noInternetConnectivity({required bool showError}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
    } else if (connectivityResult == ConnectivityResult.ethernet) {
    } else if (connectivityResult == ConnectivityResult.none) {
      if (showError) {
        Navigator.pushNamed(context!, InternetScreen.id);
      }
      return false;
    }
    return true;
  }
}
