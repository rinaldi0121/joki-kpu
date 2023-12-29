import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class ToastHelper {
  ToastHelper(BuildContext context) {
    _context = context;
  }

  late BuildContext _context;

  void displaySuccessMotionToast(String toastTitle, String toastDescription) {
    MotionToast toast = MotionToast.success(
      title: Text(
        toastTitle,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(
        toastDescription,
        style: const TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.rtl,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      dismissable: true,
    );
    toast.show(_context);
    Future.delayed(const Duration(seconds: 4)).then((value) {
      toast.dismiss();
    });
  }

  void displayWarningMotionToast(String toastTitle, String toastDescription) {
    MotionToast.warning(
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(toastDescription),
      animationCurve: Curves.bounceIn,
      borderRadius: 0,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(_context);
  }

  void displayErrorMotionToast(String toastTitle, String toastDescription) {
    MotionToast.error(
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(toastDescription),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 320,
      height: 100,
      dismissable: true,
    ).show(_context);
  }

  void displayInfoMotionToast(String toastTitle, String toastDescription) {
    MotionToast.info(
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      position: MotionToastPosition.center,
      description: Text(toastDescription),
    ).show(_context);
  }

  void displayDeleteMotionToast(String toastTitle, String toastDescription) {
    MotionToast.delete(
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(toastDescription),
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
    ).show(_context);
  }

  void displayResponsiveMotionToast(
      String toastTitle, String toastDescription) {
    MotionToast(
      icon: Icons.rocket_launch,
      primaryColor: Colors.purple,
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        toastDescription,
      ),
    ).show(_context);
  }

  void displayCustomMotionToast(String toastTitle, String toastDescription) {
    MotionToast(
      primaryColor: Colors.pink,
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      dismissable: false,
      description: Text(
        toastDescription,
      ),
    ).show(_context);
  }

  void displayMotionToastWithoutSideBar(
      String toastTitle, String toastDescription) {
    MotionToast(
      icon: Icons.zoom_out,
      primaryColor: Colors.orange[500]!,
      secondaryColor: Colors.grey,
      backgroundType: BackgroundType.solid,
      title: Text(toastTitle),
      description: Text(toastDescription),
      displayBorder: true,
      displaySideBar: false,
    ).show(_context);
  }

  void displayMotionToastWithBorder(
      String toastTitle, String toastDescription) {
    MotionToast(
      icon: Icons.zoom_out,
      primaryColor: Colors.deepOrange,
      title: Text(toastTitle),
      description: Text(toastDescription),
      position: MotionToastPosition.top,
      animationType: AnimationType.fromTop,
      displayBorder: true,
      width: 350,
      height: 100,
      padding: const EdgeInsets.only(
        top: 30,
      ),
    ).show(_context);
  }

  void displayTwoColorsMotionToast(String toastTitle, String toastDescription) {
    MotionToast(
      icon: Icons.zoom_out,
      primaryColor: Colors.orange[500]!,
      secondaryColor: Colors.grey,
      backgroundType: BackgroundType.solid,
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(toastDescription),
      position: MotionToastPosition.top,
      animationType: AnimationType.fromTop,
      width: 350,
      height: 100,
    ).show(_context);
  }

  void displayTransparentMotionToast(
      String toastTitle, String toastDescription) {
    MotionToast(
      icon: Icons.check,
      primaryColor: Colors.grey[400]!,
      secondaryColor: Colors.green,
      backgroundType: BackgroundType.transparent,
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(toastDescription),
      position: MotionToastPosition.top,
      width: 300,
      height: 100,
    ).show(_context);
  }

  void displaySimultaneouslyToasts(
    String toastTitle,
    String toastDescription,
    String toastTitle2,
    String toastDescription2,
  ) {
    MotionToast.warning(
      title: Text(
        toastTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(toastDescription),
      animationCurve: Curves.bounceIn,
      borderRadius: 0,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(_context);
    MotionToast.error(
      title: Text(
        toastTitle2,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(toastDescription2),
      animationType: AnimationType.fromLeft,
      position: MotionToastPosition.top,
      width: 300,
      height: 80,
    ).show(_context);
  }
}
