import 'package:flutter/material.dart';
import '../widgets/web/web_header.dart';
import '../widgets/web/web_hero_section.dart';
import '../widgets/web/web_apps_section.dart';
import '../widgets/web/web_core_model_section.dart';
import '../widgets/web/web_analyze_grid_section.dart';
import '../widgets/web/web_design_branding_section.dart';
import '../widgets/web/web_partners_section.dart';
import '../widgets/web/web_solutions_section.dart';
import '../widgets/web/web_talent_section.dart';
import '../widgets/web/web_cta_section.dart';
import '../widgets/web/web_discover_section.dart';
import '../widgets/web/web_footer.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(String section) {
    double offset = 0;
    switch (section) {
      case 'products':
        offset = 884;
        break;
      case 'solutions':
        offset = 884 + 852 + 852 + 852 + 550 + 600 + 700;
        break;
      case 'partnerships':
        offset = 884 + 852 + 852 + 852 + 550 + 600;
        break;
      case 'company':
      case 'contact':
        offset = _scrollController.position.maxScrollExtent;
        break;
      default:
        offset = 0;
    }
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Scrollable Sections Body
          LayoutBuilder(
            builder: (context, constraints) {
              final contentWidth = constraints.maxWidth < 1240 ? 1240.0 : constraints.maxWidth;
              return SingleChildScrollView(
                controller: _scrollController,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: constraints.maxWidth < 1240
                      ? const ClampingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    width: contentWidth,
                    child: Column(
                      children: [
                        const SizedBox(height: 80),

                        WebHeroSection(
                          onScrollDown: () => _scrollToSection('products'),
                        ),

                        const WebAppsSection(),
                        const WebCoreModelSection(),
                        const WebAnalyzeGridSection(),
                        const WebDesignBrandingSection(),
                        const WebPartnersSection(),
                        const WebSolutionsSection(),
                        const WebTalentSection(),
                        const WebCtaSection(),
                        const WebDiscoverSection(),
                        const WebFooter(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Sticky Top Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: WebHeader(
              onNavSelect: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}
