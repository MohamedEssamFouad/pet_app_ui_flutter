import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 0.90.sw,
                height: 0.3.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.r),
                  color: Colors.orangeAccent,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Top-left image
                    Positioned(
                      top: 0.02.sh,
                      left: 0.05.sw,
                      child: Transform.rotate(
                        angle: -11 * 3.1416 / 180,
                        child: Image.network(
                          'https://clipart-library.com/images/rTnrpap6c.png',
                          color: Colors.grey,
                          width: 0.1.sw,
                        ),
                      ),
                    ),
                    // Bottom-right image
                    Positioned(
                      bottom: 0.02.sh,
                      right: 0.05.sw,
                      child: Transform.rotate(
                        angle: -11 * 3.1416 / 180,
                        child: Image.network(
                          'https://clipart-library.com/images/rTnrpap6c.png',
                          color: Colors.grey,
                          width: 0.1.sw,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.02.sh,
                      left: 0.05.sw,
                      child: Transform.rotate(
                        angle: -11 * 3.1416 / 180,
                        child: Image.network(
                          'https://clipart-library.com/images/rTnrpap6c.png',
                          color: Colors.grey,
                          width: 0.1.sw,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 80.h,
                      left: 0.40.sw,
                      child: SizedBox(
                        width: 100.w,
                        height: 250.h,
                        child: OverflowBox(
                          maxHeight: 300.h,
                          maxWidth: 200.w,
                          child: Image.asset(
                            'assets/image1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h), // Responsive vertical spacing

            // RichText for different colored words
            RichText(
              text: TextSpan(
                text: 'Find Your ', // Default text style
                style: TextStyle(
                  fontSize: 24.sp, // Responsive text size
                  color: Colors.black, // Default color for "Find Your"
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Dream', // Style "Dream" separately
                    style: TextStyle(
                      color: Colors.blue, // Custom color for "Dream"
                      fontWeight: FontWeight.bold, // Make "Dream" bold
                    ),
                  ),
                  TextSpan(
                    text: ' Pet Here', // Style "Pet Here"
                    style: TextStyle(
                      color: Colors.black, // Back to default color
                    ),
                  ),
                ],
              ),
            ),

            Text(
              'Real Adoption App',
              style: TextStyle(fontSize: 18.sp), // Scaling text size
            ),
          ],
        ),
      ),
    );
  }
}
