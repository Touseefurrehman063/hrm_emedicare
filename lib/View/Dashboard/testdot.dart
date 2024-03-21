// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MyAppScreen extends StatelessWidget {
//   const MyAppScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('HRM App'),
//         ),
//         body: const Center(
//           child: ProgressLine(),
//         ),
//       ),
//     );
//   }
// }

// class ProgressLine extends StatelessWidget {
//   const ProgressLine({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now()
//         .toUtc()
//         .add(const Duration(hours: 5)); // Convert to Pakistan time
//     double progressValue = now.hour / 24; // Assuming 24-hour day
//     String centerText = DateTime.now().weekday == DateTime.friday
//         ? '01:15PM - 2:45PM'
//         : '01:15PM - 2:30PM';
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CustomPaint(
//             painter: ProgressPainter(progressValue),
//             child: Container(
//               height: 15, // Decreased height of the progress line
//             ),
//           ),
//           const SizedBox(height: 12.0), // Adjusted spacing
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Dot(
//                 icon: Icons.access_time,
//                 label: '09:00AM',
//                 position: 0,
//               ),
//               Text(
//                 centerText,
//                 style: GoogleFonts.poppins(fontSize: 11),
//               ),
//               const Dot(
//                 icon: Icons.access_time,
//                 label: '06:00PM',
//                 position: 1,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProgressPainter extends CustomPainter {
//   final double progressValue;

//   ProgressPainter(this.progressValue);

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Define start and end times
//     DateTime startTime = DateTime(
//         DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0);
//     DateTime endTime = DateTime(
//         DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 0);

//     double lineLength = size.width;
//     double totalTime = endTime
//         .difference(startTime)
//         .inMinutes
//         .toDouble(); // Total minutes between 9am and 6pm
//     double currentTime = DateTime.now()
//         .difference(startTime)
//         .inMinutes
//         .toDouble(); // Current time in minutes from 9am

//     double linePosition = currentTime / totalTime * lineLength;

//     Paint paintLineBefore = Paint()
//       ..color = Colors.green // Color before current time dot
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = size.height * 0.2; // Thickness of the line

//     Paint paintLineAfter = Paint()
//       ..color = Colors.orange // Color after current time dot
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = size.height * 0.2; // Thickness of the line

//     // Draw line before current time dot
//     canvas.drawLine(Offset(0, size.height / 2),
//         Offset(linePosition, size.height / 2), paintLineBefore);

//     // Draw line after current time dot
//     canvas.drawLine(Offset(linePosition, size.height / 2),
//         Offset(lineLength, size.height / 2), paintLineAfter);

//     Paint paintDotGreen = Paint()
//       ..color = Colors.green // Color of the first two dots
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = size.height * 0.8; // Thickness of the dot

//     Paint paintDotOrange = Paint()
//       ..color = Colors.orange // Color of the third dot
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = size.height * 0.8; // Thickness of the dot

//     // Draw dot for the start of the line (9 am)
//     canvas.drawCircle(
//         Offset(0, size.height / 2), size.height / 2, paintDotGreen);

//     // Draw dot for the current time
//     canvas.drawCircle(
//         Offset(linePosition, size.height / 2), size.height / 2, paintDotGreen);

//     // Draw dot for the end of the line (6 pm)
//     canvas.drawCircle(
//         Offset(lineLength, size.height / 2), size.height / 2, paintDotOrange);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class Dot extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final double position;

//   const Dot(
//       {Key? key,
//       required this.icon,
//       required this.label,
//       required this.position})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 4.0),
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             fontSize: 11,
//           ),
//         ),
//       ],
//     );
//   }
// }
