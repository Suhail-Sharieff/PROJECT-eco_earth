import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonTitle;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color btnColor;

  const MyButton({
    super.key,
    required this.buttonTitle,
    required this.isLoading,
    required this.onPressed, required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // Disable button when loading
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(btnColor), // Solid color background for simplicity
        foregroundColor: WidgetStateProperty.all(Colors.white),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)), // Add padding
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Smooth rounded corners
          ),
        ),
        elevation: WidgetStateProperty.all(5), // Shadow to give depth
      ),
      child: isLoading
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // White spinner
      )
          : Text(
        buttonTitle, // Use dynamic button title
        style: const TextStyle(
          fontSize: 16.0, // Font size
          fontWeight: FontWeight.bold, // Bold text
          color: Colors.white, // White text color
        ),
      ),
    );
  }
}