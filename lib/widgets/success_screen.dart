import 'package:flutter/material.dart';
import 'package:plotrol/helper/const_assets_const.dart';

import '../globalWidgets/text_widget.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.onGoHome, this.description, this.message, this.title,});
  final VoidCallback onGoHome;
  final String? title;
  final String? description;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // prevent default back; we’ll handle it
      onPopInvoked: (didPop) {
        onGoHome();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                ImageAssetsConst.plotRolLogo,
                width: 40,
                height: 40,
              ),
              const ReusableTextWidget(
                text: 'Plot Patrol - Beta',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Green panel (taller + centered)
                Container(
                  height: 220, // bigger height
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF228B22), // Forest green
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // center vertically
                    crossAxisAlignment: CrossAxisAlignment.center, // center horizontally
                    children: const [
                      Icon(Icons.check_circle, color: Colors.white, size: 44),
                      SizedBox(height: 12),
                      Text(
                        'Request has been raised successfully.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          height: 1.3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Description
                const Text(
                  'Thank you for requesting our service.\n'
                      'A local Plotrol representative will contact you soon.\n'
                      'We appreciate your support in shaping thr future of secure land monitoring.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),

                const Spacer(),

                // Bottom button
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    onPressed: onGoHome,
                    child: const Text(
                      'Go back to Home',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
