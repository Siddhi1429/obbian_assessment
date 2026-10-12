import 'package:flutter/material.dart';
import '../widgets/mobile/mobile_map_header.dart';
import '../widgets/mobile/mobile_bottom_sheet.dart';
import '../widgets/mobile/mobile_tab_bar.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    MobileMapHeader(
                      onRecenter: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Recentering map to current location...'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),

                    // Bottom Sheet Content with Negative Margin to overlap smoothly
                    Transform.translate(
                      offset: const Offset(0, -20),
                      child: const MobileBottomSheet(),
                    ),

                    // Bottom spacing for TabBar
                    const SizedBox(height: 90),
                  ],
                ),
              ),

              // Fixed Bottom Tab Bar
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: MobileTabBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
