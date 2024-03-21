import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double progressValue;

  ProgressPainter(this.progressValue);

  @override
  void paint(Canvas canvas, Size size) {
    // Define start and end times
    DateTime startTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0);
    DateTime endTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 18, 0); // Changed to 1:00 PM

    double lineLength = size.width;
    double totalTime = endTime
        .difference(startTime)
        .inMinutes
        .toDouble(); // Total minutes between 9am and 1pm
    double currentTime = DateTime.now()
        .difference(startTime)
        .inMinutes
        .toDouble(); // Current time in minutes from 9am

    // Adjust current time to be within office hours (9am to 1pm)
    if (currentTime < 0) {
      currentTime = 0;
    } else if (currentTime > totalTime) {
      currentTime = totalTime;
    }

    double linePosition = currentTime / totalTime * lineLength;

    Paint paintLineBefore = Paint()
      ..color = Colors.green // Color before current time dot
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height * 0.2; // Thickness of the line

    Paint paintLineAfter = Paint()
      ..color = Colors.orange // Color after current time dot
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height * 0.2; // Thickness of the line

    // Draw line before current time dot
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(linePosition, size.height / 2), paintLineBefore);

    // Draw line after current time dot
    if (currentTime < totalTime) {
      canvas.drawLine(Offset(linePosition, size.height / 2),
          Offset(lineLength, size.height / 2), paintLineAfter);
    }

    Paint paintDotGreen = Paint()
      ..color = Colors.green // Color of the first two dots
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height * 0.8; // Thickness of the dot

    Paint paintDotOrange = Paint()
      ..color = currentTime < totalTime && currentTime >= 0
          ? Colors
              .orange // Color of the third dot if current time is within office hours
          : Colors
              .green // Color of the third dot if current time is not within office hours
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height * 0.8; // Thickness of the dot

    // Draw dot for the start of the line (9 am)
    canvas.drawCircle(
        Offset(0, size.height / 2), size.height / 2, paintDotGreen);

    // Draw dot for the current time
    if (currentTime < totalTime) {
      canvas.drawCircle(Offset(linePosition, size.height / 2), size.height / 2,
          paintDotGreen);
    }

    // Draw dot for the end of the line (1 pm)
    canvas.drawCircle(
        Offset(lineLength, size.height / 2), size.height / 2, paintDotOrange);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
