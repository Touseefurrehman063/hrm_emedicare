// /*
//  * File Created: 2022-06-02 15:11:39
//  * Author: ZhangYu (devzhangyu@163.com)
//  * -----
//  * Last Modified: 2022-06-07 11:50:15
//  * Modified By: ZhangYu (devzhangyu@163.com>)
//  */

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:timelines/timelines.dart';
// import 'package:wave_linear_progress_indicator/wave_linear_progress_indicator.dart';

// class waveprogress extends StatelessWidget {
//   const waveprogress({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter WaveLinearProgressIndicator Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:
//           const MyHomePage(title: 'WaveLinearProgressIndicator Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final double _progress = 0;

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text(widget.title),
//     //   ),
//     //   body: Center(
//     //     child: Padding(
//     //       padding: const EdgeInsets.all(18.0),
//     //       child: Column(
//     //         mainAxisAlignment: MainAxisAlignment.center,
//     //         children: [
//     //           Slider(
//     //             value: _progress,
//     //             onChanged: (val) {},

//     //             // onChanged: (value) {
//     //             //   setState(() {
//     //             //     _progress = value;
//     //             //   });
//     //             // },
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // );
//     return Timeline.tileBuilder(
//       builder: TimelineTileBuilder.fromStyle(
//         contentsAlign: ContentsAlign.alternating,
//         contentsBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Text('Timeline Event $index'),
//         ),
//         itemCount: 10,
//       ),
//     );
//   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:timelines/timelines.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Timelines Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Timelines Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(""),
//       ),
//       body: SizedBox(
//         width: 300.w,
//         child: Timeline.tileBuilder(
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           builder: TimelineTileBuilder.fromStyle(
//             contentsAlign: ContentsAlign.alternating,
//             contentsBuilder: (context, index) => Padding(
//               padding: const EdgeInsets.all(0.2),
//               child: Text('Timeline Event $index'),
//             ),
//             itemCount: 3,
//           ),
//         ),
//       ),
//     );
//   }
// }
