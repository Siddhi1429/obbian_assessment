import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../common/safe_image.dart';

class MobileBottomSheet extends StatelessWidget {
  const MobileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 1. Recent Trips List (3 rows)
          _buildRecentRow(
            distance: '4.3 km',
            title: 'Junwani Rd',
            subtitle: 'near Apollo Hospital, Smriti Nagar, Surya Vi...',
          ),
          _buildRecentRow(
            distance: '1.3 km',
            title: 'Bus Stand',
            subtitle: 'Civil Lines, Durg, Chhattisgarh 491001, India',
          ),
          _buildRecentRow(
            distance: '9 km',
            title: 'Santpali cg',
            subtitle: 'Camp 2, Bhanwarpur, Chhattisgarh 493555...',
          ),
          const SizedBox(height: 20),

          // 2. Rides Heading
          Text(
            'Rides',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              height: 24 / 18,
              letterSpacing: 0,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 14),

          // 3. Rides Grid (280px height)
          SizedBox(
            height: 280,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Card: Autorickshaw (161.5 x 280, radius 24)
                Expanded(
                  child: _buildAutorickshawCard(),
                ),
                const SizedBox(width: 12),

                // Right Column: Cab (161.5 x 135) + [Bike (75 x 135) & More (75 x 135)]
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Top: Cab Card (161.5 x 135, radius 24)
                      _buildCabCard(),
                      const SizedBox(height: 10),

                      // Bottom Row: Bike (75 x 135) + More (75 x 135)
                      Row(
                        children: [
                          Expanded(child: _buildBikeCard()),
                          const SizedBox(width: 10),
                          Expanded(child: _buildMoreCard()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // 4. Explore Places Section
          Text(
            'Explore Places with Ride app',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 28 / 16,
              letterSpacing: 0,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 128,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildDestinationCard('assets/app_icons/exploreimag.jpg'),
                const SizedBox(width: 12),
                _buildDestinationCard('assets/images/dest_2.png'),
                const SizedBox(width: 12),
                _buildDestinationCard('assets/app_icons/exploreimag.jpg'),
                const SizedBox(width: 12),
                _buildDestinationCard('assets/images/dest_2.png'),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // 5. Your Neighborhood Section
          Text(
            'Your Neighborhood, Now on Ride App.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 28 / 16,
              letterSpacing: 0,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 231,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildVideoCard(
                  imagePath: 'assets/images/video_1.png',
                  title: 'Scale your Buisness\nwith us',
                ),
                const SizedBox(width: 12),
                _buildVideoCard(
                  imagePath: 'assets/images/video_2.png',
                  title: 'Connecting and\ngrowing',
                ),
                const SizedBox(width: 12),
                _buildVideoCard(
                  imagePath: 'assets/images/video_1.png',
                  title: 'Scale your Buisness\nwith us',
                ),
                const SizedBox(width: 12),
                _buildVideoCard(
                  imagePath: 'assets/images/video_2.png',
                  title: 'Connecting and\ngrowing',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildRecentRow({
    required String distance,
    required String title,
    required String subtitle,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Distance & History/Time icon
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SafeAssetImage(
                    path: 'assets/app_icons/Vector.png',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    distance,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      letterSpacing: 0,
                      color: AppColors.mobileTextMuted,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),

              // Title & Address
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                        letterSpacing: 0,
                        color: AppColors.mobileTextDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0,
                        color: AppColors.mobileTextMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // Heart icon (24x24)
              const SafeAssetImage(
                path: 'assets/app_icons/solar_heart-linear.png',
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
        if (showDivider)
          const DashedDivider(
            height: 1,
            color: Color(0xFFE5E7EB),
            dashWidth: 4,
            dashSpace: 3,
          ),
      ],
    );
  }

  Widget _buildAutorickshawCard() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE9F4FE),
            Color(0xFFF8FAFC),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // 3D Scene Image at bottom (assets/app_icons/rides_image1.png)
          Positioned(
            left: 2,
            right: 2,
            bottom: 6,
            child: const SafeAssetImage(
              path: 'assets/app_icons/rides_image1.png',
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          ),

          // Content Top
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "NEW" Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDB022),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'NEW',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      height: 15 / 10,
                      letterSpacing: 0,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // Title
                Text(
                  'Autorickshaw',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    height: 20 / 16,
                    letterSpacing: 0,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 3),

                // Subtitle: "Book Auto Rides\nwith Us >"
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      height: 15 / 10,
                      letterSpacing: 0,
                      color: const Color(0xFF64748B),
                    ),
                    children: const [
                      TextSpan(text: 'Book Auto Rides\nwith Us '),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.chevron_right_rounded,
                          size: 13,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCabCard() {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE9F4FE),
            Color(0xFFF8FAFC),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // White Taxi with Bridge & City Skyline
          Positioned.fill(
            child: const SafeAssetImage(
              path: 'assets/app_icons/ride_image2.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),

          // Text Top-Left
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Affordable',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    height: 15 / 10,
                    letterSpacing: 0,
                    color: const Color(0xFF64748B),
                  ),
                ),
                Text(
                  'Cab',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    height: 20 / 14,
                    letterSpacing: 0,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBikeCard() {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF3F4F6),
            Color(0xFFFFFFFF),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Yellow Vespa with City Skyline
          Positioned(
            left: 2,
            right: 2,
            bottom: 6,
            height: 96,
            child: const SafeAssetImage(
              path: 'assets/images/634c45f78bd1fb9df2dba7dc0cefa4a6cec8fce4.png',
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          ),

          // Text Top Center/Left
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 10, 0),
            child: Text(
              'Bike',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                height: 20 / 14,
                letterSpacing: 0,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreCard() {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF3F4F6),
            Color(0xFFFFFFFF),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // 4 Tiles Icon
          Positioned(
            left: 0,
            right: 0,
            bottom: 22,
            child: Center(
              child: const SafeAssetImage(
                path: 'assets/images/ChatGPT Image Aug 3, 2026, 07_41_38 PM 1.png',
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Text Top Center/Left
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 10, 0),
            child: Text(
              'More',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                height: 20 / 14,
                letterSpacing: 0,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(String imagePath) {
    return Container(
      width: 160,
      height: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: SafeAssetImage(
        path: imagePath,
        width: 160,
        height: 128,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildVideoCard({
    required String imagePath,
    required String title,
  }) {
    return Container(
      width: 200,
      height: 231,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SafeAssetImage(
            path: imagePath,
            width: 200,
            height: 231,
            fit: BoxFit.cover,
          ),

          // Dark overlay gradient so text & play icon pop
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.15),
                  Colors.black.withValues(alpha: 0.70),
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // Center Play Button (Translucent circle with white border & play icon)
          Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withValues(alpha: 0.25),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.9),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),

          // Text bottom-left
          Positioned(
            left: 14,
            bottom: 16,
            right: 14,
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.0,
                letterSpacing: 0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DashedDivider({
    super.key,
    this.height = 1,
    this.color = const Color(0xFFE5E7EB),
    this.dashWidth = 4,
    this.dashSpace = 3,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.maxWidth;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return SizedBox(
          width: boxWidth,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: height,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

