import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Column(
          children: [
            // Top Image
            // const SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to DealDash',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: ColorManager.gray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      'The fair and honest bidding site.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: ColorManager.gray,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Continue with Google Button
                    ElevatedButton(
                      onPressed: () {
                        // Continue with Google action
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: ColorManager.red,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Log in'),
                    ),
                    const SizedBox(height: 15),

                    // Continue with Facebook Button
                    ElevatedButton(
                      onPressed: () {
                        // Continue with Facebook action
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey.shade200,
                        backgroundColor: ColorManager.yellow,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
