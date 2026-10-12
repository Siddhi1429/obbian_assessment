# Obbian Assessment - Flutter Web & Mobile Engineering

A production-grade, 100% pixel-perfect Flutter application developed in **Google Flutter & Dart** implementing the **Figma Assessment** by the Obbian HR & Engineering Team.

The application unifies both required screens in a single responsive codebase:
1. **Website Screen (1920px Desktop)**: Landing Page for *"TC Teach Company"* featuring cosmic gradients, 3D assets, multi-column feature grids, interactive partner carousels, responsive pricing/solutions cards, talent statistics, and full footer with subscription & watermark branding.
2. **Mobile Screen (375px Device)**: *"Ride App"* featuring full-bleed vector map route preview, floating back/search navigation, swipeable/interactive vehicle selection sheet (`Cab Economy`, `Auto`, `Bike`), saved location pills, quick destinations, and persistent bottom navigation bar.

---

## 🚀 Live Evaluation & Device Modes

The application features an interactive **Floating Evaluation Switcher** in the bottom-right corner for seamless inspection by reviewers:

| Mode | Icon | Description |
| :--- | :--- | :--- |
| **Auto Responsive** | 🔄 | Automatically serves Desktop Web on displays $\ge 800\text{px}$ and Mobile Ride App on screens $< 800\text{px}$. |
| **Desktop Web (1920px)** | 💻 | Locks the viewport to TC Teach Company's 1920px desktop experience with horizontal scroll protection. |
| **Mobile Ride App (375px)** | 📱 | Embeds the Ride App in a realistic 375×812 device frame for inspection even on large desktop monitors. |
| **Side-by-Side (Split)** | 🪟 | Displays both the Desktop Website and Mobile App simultaneously side-by-side (available on screens $\ge 1200\text{px}$). |

---

## 🎨 Design & Visual Fidelity Highlights

- **Typography**: 100% matching Figma font families powered by `google_fonts`:
  - **Manrope**: Headings, Hero titles, and high-impact slogans.
  - **Inter**: Body text, form fields, and navigation links.
  - **Plus Jakarta Sans**: Mobile bottom sheet headers, ride fare details, and destination labels.
  - **Orbitron & Hanken Grotesk**: Section badges, tech stack counters, and monospaced indicators.
- **Color Tokens**:
  - `AppColors.primaryBlue`: Vibrant accent `#3B82F6` / `#2563EB`
  - `AppColors.bgDark`: Sleek obsidian black `#000000` & `#0B0F19`
  - `AppColors.cardDark`: Surface gray `#111827` & `#1E293B`
  - Subtle borders: `#1F2937` and `#374151`
- **Dynamic Interactions**:
  - Hover animations with smooth scale and color glow transitions (`HoverBuilder`).
  - Animated link arrows (`LinkButton`) with forward glide on mouse hover.
  - Smooth anchor scrolling from header navigation (`Products`, `Solutions`, `Partnerships`, `Contact Us`).
  - Active vehicle ride selector with elevation shadow and highlighted radio circle.

---

## 📂 Project Architecture

```
lib/
├── main.dart                          # App Entry & AssessmentShell (Responsive + Switcher Toolbar)
├── theme/
│   ├── app_colors.dart                # Complete Figma hex color & gradient tokens
│   └── app_text_styles.dart           # Typography styles matching exact Figma specifications
├── widgets/
│   ├── common/
│   │   ├── custom_button.dart         # Primary pill buttons & animated link buttons
│   │   ├── hover_builder.dart         # Web mouse region hover helper
│   │   └── safe_image.dart            # Resilient asset loader with graceful fallbacks
│   ├── web/
│   │   ├── web_header.dart            # Top navigation bar with sticky alignment
│   │   ├── web_hero_section.dart      # Cosmic gradient hero with dual CTA buttons
│   │   ├── web_apps_section.dart      # 3 Card showcases (XYZ, VIRVON, ABC)
│   │   ├── web_core_model_section.dart # Concentric circular graph with orbit badges
│   │   ├── web_analyze_grid_section.dart # 3D cube illustration & 4-quadrant feature cards
│   │   ├── web_design_branding_section.dart # Screenshot 3 design & branding showcase
│   │   ├── web_tech_stack_section.dart # Advanced development stack with badge pills
│   │   ├── web_partners_section.dart  # Global partners, cloud logos & orbital view
│   │   ├── web_solutions_section.dart # Cosmic hand background with glassmorphic cards
│   │   ├── web_talent_section.dart    # Talent & technology metrics
│   │   ├── web_cta_section.dart       # High-converting rocket launch banner
│   │   ├── web_discover_section.dart  # Career, Partner & Resource cards
│   │   └── web_footer.dart            # Links, newsletter form & TC watermark
│   └── mobile/
│       ├── mobile_map_header.dart     # Map backdrop, search input & back action
│       ├── mobile_bottom_sheet.dart   # Ride selection cards, pricing & confirm action
│       └── mobile_tab_bar.dart        # 4-tab bottom navigation with active indicators
└── screens/
    ├── web_screen.dart                # Complete Desktop Landing Page assembly
    └── mobile_screen.dart             # Complete Mobile Ride App assembly
```

---

## 🛠️ Getting Started & Local Run

### Prerequisites
- Flutter SDK 3.24+ installed (configured with Dart 3.5+)
- Google Chrome (or modern browser) / Android Emulator / iOS Simulator

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run Locally on Chrome
```bash
flutter run -d chrome
```

### 3. Run Automated Tests
All unit and viewport responsiveness tests pass with zero warnings:
```bash
flutter test
```

### 4. Code Quality & Lint Analysis
```bash
flutter analyze
```
*Result: `No issues found!`*

---

## 🌐 Production Web Build & Deployment

### Build Release Bundle
```bash
flutter build web --release
```
The optimized bundle is generated in `build/web/` with tree-shaken icons and compiled CanvasKit / Skia WASM support.

### Fast Local Preview of Release Build
```bash
cd build/web
python3 -m http.server 8080
```
Open [http://localhost:8080](http://localhost:8080) in your browser.

---

## ✅ Figma Design Verification Checklist

- [x] **Fonts & Sizes**: Manrope, Inter, Plus Jakarta Sans, Orbitron matching Figma tokens.
- [x] **Colors & Opacities**: Obsidian dark theme with curated vibrant accents and borders.
- [x] **Spacing & Grids**: Exact margins, paddings, and alignment hierarchies.
- [x] **Assets & Fallbacks**: All raw Figma exports mapped semantically with resilient SVG and PNG loaders.
- [x] **Micro-interactions**: Hover effects on buttons, cards, social icons, and nav links.
- [x] **Dual Device Support**: Auto responsive layout + toolbar switcher for desktop, mobile, and split view.
- [x] **Zero Errors**: Fully passing analyzer and test suite.
