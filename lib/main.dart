import 'package:flutter/material.dart';
import 'screens/web_screen.dart';
import 'screens/mobile_screen.dart';
import 'theme/app_colors.dart';
import 'theme/app_text_styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ObbianAssessmentApp());
}

class ObbianAssessmentApp extends StatelessWidget {
  const ObbianAssessmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obbian Flutter Assessment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryBlue,
          brightness: Brightness.light,
        ),
      ),
      home: const AssessmentShell(),
    );
  }
}

enum PreviewMode {
  auto,
  desktopOnly,
  mobileOnly,
  splitView,
}

class AssessmentShell extends StatefulWidget {
  const AssessmentShell({super.key});

  @override
  State<AssessmentShell> createState() => _AssessmentShellState();
}

class _AssessmentShellState extends State<AssessmentShell> {
  PreviewMode _mode = PreviewMode.auto;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktopWidth = constraints.maxWidth >= 800;

        Widget content;
        if (_mode == PreviewMode.desktopOnly) {
          content = const WebScreen();
        } else if (_mode == PreviewMode.mobileOnly) {
          content = Container(
            color: const Color(0xFF1E293B),
            alignment: Alignment.center,
            child: Container(
              width: 375,
              height: 812,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(36),
                border: Border.all(color: Colors.black, width: 8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const MobileScreen(),
            ),
          );
        } else if (_mode == PreviewMode.splitView && isDesktopWidth) {
          content = Row(
            children: [
              const Expanded(flex: 7, child: WebScreen()),
              Container(
                width: 420,
                color: const Color(0xFF0F172A),
                alignment: Alignment.center,
                child: Container(
                  width: 375,
                  height: 800,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.black, width: 6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: const MobileScreen(),
                ),
              ),
            ],
          );
        } else {
          // Auto Responsive Switch (Figma standard)
          content = isDesktopWidth ? const WebScreen() : const MobileScreen();
        }

        return Stack(
          children: [
            content,

            // Floating Evaluation Device Toggle (visible on web for reviewers)
            if (constraints.maxWidth > 500)
              Positioned(
                bottom: 20,
                left: 24,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF0F172A).withValues(alpha: 0.92),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.primaryBlue.withValues(alpha: 0.4),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildToggleOption(
                          mode: PreviewMode.auto,
                          icon: Icons.sync,
                          tooltip: 'Auto Responsive',
                        ),
                        const SizedBox(width: 4),
                        _buildToggleOption(
                          mode: PreviewMode.desktopOnly,
                          icon: Icons.laptop_mac_rounded,
                          tooltip: 'Desktop Web (1920px)',
                        ),
                        const SizedBox(width: 4),
                        _buildToggleOption(
                          mode: PreviewMode.mobileOnly,
                          icon: Icons.smartphone_rounded,
                          tooltip: 'Mobile Ride App (375px)',
                        ),
                        if (constraints.maxWidth >= 1200) ...[
                          const SizedBox(width: 4),
                          _buildToggleOption(
                            mode: PreviewMode.splitView,
                            icon: Icons.view_sidebar_rounded,
                            tooltip: 'Side-by-Side Comparison',
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildToggleOption({
    required PreviewMode mode,
    required IconData icon,
    required String tooltip,
  }) {
    final isSelected = _mode == mode;

    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () => setState(() => _mode = mode),
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: isSelected ? Colors.white : AppColors.navText,
              ),
              if (isSelected) ...[
                const SizedBox(width: 6),
                Text(
                  tooltip.split(' ')[0],
                  style: AppTextStyles.label12(color: Colors.white).copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
