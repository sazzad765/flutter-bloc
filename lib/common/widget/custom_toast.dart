import 'package:flutter/material.dart';

class CustomToast {
  final BuildContext _context;

  const CustomToast({required BuildContext context}) : _context = context;

  void clear() {
    ScaffoldMessenger.of(_context).removeCurrentSnackBar();
  }

  void success({
    String? title,
    required String msg,
  }) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
      elevation: 6.0,
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Row(
        children: [
          const Icon(
            Icons.done,
            size: 50,
            color: Colors.white,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "Success",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    msg,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void error({
    String? title,
    required String msg,
  }) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
      elevation: 6.0,
      backgroundColor: Colors.red[400],
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Row(
        children: [
          const Icon(
            Icons.error,
            size: 50,
            color: Colors.white,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'Error',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    msg,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
