import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_application_1/inputfields.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: null,
      // appBar: AppBar(
      //   // iconTheme: const IconThemeData(
      //   //   color: Color(0xff1d2a31),
      //   // ),
      //   title: const Text("Add Expenses"),
      //   centerTitle: true,
      //   // backgroundColor: transparent,
      // ),
      bottomNavigationBar: const BottomNavigation(
        page: "Add",
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height - 56,
          child: Flex(
            direction:
                (size.width > size.height) ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      "assets/images/rupee.png",
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: (size.width > size.height) ? 3 : 1,
                child: SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(1.0, -1.0),
                        end: Alignment(-1.0, 1.0),
                        colors: [
                          Color(0xff1d2a30),
                          Color.fromARGB(255, 41, 76, 93),
                        ],
                      ),
                    ),
                    child: const InputFields(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/background.dart';
// import 'package:flutter_application_1/bottomnavigation.dart';
// import 'package:flutter_application_1/inputfields.dart';
// import 'package:gap/gap.dart';

// class AddExpense extends StatelessWidget {
//   const AddExpense({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     // preferredSize: Size.fromHeight(50),
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Color(0xff1d2a31),
//         ),
//         title: const Text("Add Expenses"),
//         centerTitle: true,
//         backgroundColor: const Color(0xff1d2a30),
//       ),
//       bottomNavigationBar: const BottomNavigation(
//         page: "Add",
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: 250,
//           child: Stack(
//             children: [
//               const Background(),
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     width: size.width * 0.8,
//                     child: const InputFields(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }








