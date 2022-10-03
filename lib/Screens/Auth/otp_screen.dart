// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:flutter_hex_color/flutter_hex_color.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:trader_app/Screens/home_screen.dart';
//
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);
//
//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "OTP VERIFICATION",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "Enter the 4-digit OTP sent to 985 * * * * * 01.",
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             OtpTextField(
//               numberOfFields: 4,
//               fieldWidth: 60,
//               borderColor: Colors.black,
//               cursorColor: Colors.black,
//               focusedBorderColor: Colors.black,
//               //set to true to show as box or false to show as dash
//               showFieldAsBox: true,
//               //runs when a code is typed in
//               //runs when every textfield is filled
//               onSubmit: (verificationCode) {}, // end onSubmit
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     "Didn't receive?",
//                   ),
//                   GestureDetector(
//                     // onTap: () => _resendOtp(),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 5),
//                       child: Text(
//                         "Resend",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 50,
//               width: 420,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: RadialGradient(
//                   colors: [
//                     HexColor("17aeb4"),
//                     HexColor("17aeb4"),
//                   ],
//                   center: Alignment(0, 0),
//                   radius: 3.5,
//                   focal: Alignment(0, 0),
//                   focalRadius: 0.1,
//                 ),
//               ),
//               child: TextButton(
//                 // onPressed: completed
//                 //     ? () {
//                 //         _verifyUser();
//                 //       }
//                 //     : null,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HomeScreen(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Verify',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
