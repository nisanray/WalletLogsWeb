// import 'dart:ui';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:math' as math;

// import '../utils/app_colors.dart';
// // import 'login_screen.dart';
// // import 'register_screen.dart';
// import 'responsive_auth_section_for_landing_page.dart';

// class UltraModernLandingPage extends StatefulWidget {
//   const UltraModernLandingPage({Key? key}) : super(key: key);

//   @override
//   State<UltraModernLandingPage> createState() => _UltraModernLandingPageState();
// }

// class _UltraModernLandingPageState extends State<UltraModernLandingPage>
//     with TickerProviderStateMixin {
//   // Animation Controllers
//   late AnimationController _mainController;
//   late AnimationController _floatingController;
//   late AnimationController _particleController;
//   late AnimationController _heroController;
//   late AnimationController _statsController;
//   late AnimationController _featuresController;
//   late AnimationController _scrollController;

//   // Scroll Controller
//   late ScrollController _pageScrollController;

//   // Animation Values
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _rotationAnimation;
//   late Animation<double> _glowAnimation;

//   // State Variables
//   bool _isScrolled = false;
//   double _scrollOffset = 0.0;
//   int _hoveredFeature = -1;
//   bool _isMenuOpen = false;

//   // Section Keys
//   final Map<String, GlobalKey> _sectionKeys = {
//     'hero': GlobalKey(),
//     'stats': GlobalKey(),
//     'features': GlobalKey(),
//     'how-it-works': GlobalKey(),
//     'screenshots': GlobalKey(),
//     'testimonials': GlobalKey(), // Make sure this exists
//     'pricing': GlobalKey(),
//     'faqs': GlobalKey(),
//     'auth': GlobalKey(),
//     'download': GlobalKey(),
//     'about-team': GlobalKey(),
//     'contact': GlobalKey(),
//   };

//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//     _initializeScrollListener();
//     _startAnimations();
//   }

//   void _initializeAnimations() {
//     // Main Animation Controllers
//     _mainController = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );

//     _floatingController = AnimationController(
//       duration: const Duration(seconds: 4),
//       vsync: this,
//     );

//     _particleController = AnimationController(
//       duration: const Duration(seconds: 10),
//       vsync: this,
//     );

//     _heroController = AnimationController(
//       duration: const Duration(milliseconds: 2000),
//       vsync: this,
//     );

//     _statsController = AnimationController(
//       duration: const Duration(milliseconds: 2500),
//       vsync: this,
//     );

//     _featuresController = AnimationController(
//       duration: const Duration(milliseconds: 1800),
//       vsync: this,
//     );

//     _scrollController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     // Animations
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _mainController, curve: Curves.easeOut),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.5),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _mainController,
//       curve: Curves.elasticOut,
//     ));

//     _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: _mainController, curve: Curves.elasticOut),
//     );

//     _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
//       CurvedAnimation(parent: _floatingController, curve: Curves.linear),
//     );

//     _glowAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
//       CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
//     );
//   }

//   void _initializeScrollListener() {
//     _pageScrollController = ScrollController();
//     _pageScrollController.addListener(() {
//       setState(() {
//         _scrollOffset = _pageScrollController.offset;
//         _isScrolled = _scrollOffset > 100;
//       });

//       if (_isScrolled) {
//         _scrollController.forward();
//       } else {
//         _scrollController.reverse();
//       }
//     });
//   }

//   void _startAnimations() {
//     _mainController.forward();
//     _floatingController.repeat(reverse: true);
//     _particleController.repeat();

//     // Staggered animations
//     Future.delayed(const Duration(milliseconds: 500), () {
//       if (mounted) _heroController.forward();
//     });

//     Future.delayed(const Duration(milliseconds: 1000), () {
//       if (mounted) _statsController.forward();
//     });

//     Future.delayed(const Duration(milliseconds: 1500), () {
//       if (mounted) _featuresController.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _mainController.dispose();
//     _floatingController.dispose();
//     _particleController.dispose();
//     _heroController.dispose();
//     _statsController.dispose();
//     _featuresController.dispose();
//     _scrollController.dispose();
//     _pageScrollController.dispose();
//     super.dispose();
//   }

//   // Color Scheme
//   static const Color primaryColor = Color(0xFF6366F1);
//   static const Color secondaryColor = Color(0xFF8B5CF6);
//   static const Color accentColor = Color(0xFF06B6D4);
//   static const Color successColor = Color(0xFF10B981);
//   static const Color warningColor = Color(0xFFF59E0B);
//   static const Color errorColor = Color(0xFFEF4444);
//   static const Color backgroundColor = Color(0xFFFAFAFA);
//   static const Color surfaceColor = Color(0xFFFFFFFF);
//   static const Color primaryText = Color(0xFF0F172A);
//   static const Color secondaryText = Color(0xFF475569);
//   static const Color mutedText = Color(0xFF94A3B8);

//   // Gradients
//   static const LinearGradient heroGradient = LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFF6366F1),
//       Color(0xFF8B5CF6),
//       Color(0xFF06B6D4),
//     ],
//   );

//   static const LinearGradient cardGradient = LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFFFFFFFF),
//       Color(0xFFF8FAFC),
//     ],
//   );

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isMobile = screenSize.width < 768;

//     return Scaffold(
//       backgroundColor: backgroundColor,
//       extendBodyBehindAppBar: true,
//       appBar: _buildAnimatedAppBar(isMobile),
//       body: Stack(
//         children: [
//           // Animated Background
//           _buildAnimatedBackground(),

//           // Main Content
//           SingleChildScrollView(
//             controller: _pageScrollController,
//             child: Column(
//               children: [
// // 1. Hero Section → First impression + Call to Action
//                 _buildHeroSection(screenSize, isMobile),

// // 2. Download Section → Early CTA if user is already convinced
//                 _buildDownloadSection(screenSize, isMobile),
// // 3. Stats Section → Build credibility (e.g., “500k+ downloads”)
//                 _buildStatsSection(screenSize, isMobile),

// // 4. Features Section → What makes your app valuable?
//                 _buildFeaturesSection(screenSize, isMobile),

// // 5. How It Works Section → Help users understand the flow easily
//                 _buildHowItWorksSection(screenSize, isMobile),

// // 6. Screenshots/Demo Section → Visual proof of UX/UI, helps retention
//                 _buildScreenshotsSection(screenSize, isMobile),
// // 7. Auth Section
//                 _buildAuthSection(),
// // OR
// // const ResponsiveAuthSections(),
// // 8. Testimonials Section → Social proof before pricing
//                 _buildTestimonialsSection(screenSize, isMobile),
// // 9. Pricing Section → Clear cost & value proposition
//                 _buildPricingSection(screenSize, isMobile),

// // 10. FAQs Section → Handle objections right after pricing
//                 _buildFAQsSection(screenSize, isMobile),
// // 11. About the Team Section → Optional but good for trust
//                 _buildAboutTeamSection(screenSize, isMobile),

// // 12. Contact Section → For questions, partnership, support
//                 _buildContactSection(screenSize, isMobile),
// // 13. Footer → Wrap up with navigation, copyright, etc.
//                 _buildFooter(screenSize, isMobile),
//               ],
//             ),
//           ),

//           // Floating Action Button
//           _buildFloatingActionButton(),
//         ],
//       ),
//     );
//   }

//   Widget _buildAnimatedBackground() {
//     return Positioned.fill(
//       child: AnimatedBuilder(
//         animation: _particleController,
//         builder: (context, child) {
//           return CustomPaint(
//             painter: ParticleBackgroundPainter(
//               animation: _particleController,
//               glowAnimation: _glowAnimation,
//             ),
//             size: Size.infinite,
//           );
//         },
//       ),
//     );
//   }

//   PreferredSizeWidget _buildAnimatedAppBar(bool isMobile) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(80),
//       child: AnimatedBuilder(
//         animation: _scrollController,
//         builder: (context, child) {
//           return Container(
//             decoration: BoxDecoration(
//               color: surfaceColor.withOpacity(0.9 * _scrollController.value),
//               border: Border(
//                 bottom: BorderSide(
//                   color:
//                       Colors.black.withOpacity(0.1 * _scrollController.value),
//                   width: 1,
//                 ),
//               ),
//             ),
//             child: ClipRRect(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(
//                   sigmaX: 10 * _scrollController.value,
//                   sigmaY: 10 * _scrollController.value,
//                 ),
//                 child: AppBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   toolbarHeight: 80,
//                   title: _buildLogo(),
//                   actions: isMobile ? _buildMobileMenu() : _buildDesktopMenu(),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildLogo() {
//     return AnimatedBuilder(
//       animation: _glowAnimation,
//       builder: (context, child) {
//         return Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 gradient: heroGradient,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: primaryColor.withOpacity(0.3 * _glowAnimation.value),
//                     blurRadius: 20,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: const Icon(
//                 Icons.account_balance_wallet,
//                 color: Colors.white,
//                 size: 24,
//               ),
//             ),
//             const SizedBox(width: 12),
//             ShaderMask(
//               shaderCallback: (bounds) => heroGradient.createShader(bounds),
//               child: Text(
//                 'WalletLogs',
//                 style: GoogleFonts.inter(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   List<Widget> _buildMobileMenu() {
//     return [
//       IconButton(
//         onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
//         icon: AnimatedRotation(
//           turns: _isMenuOpen ? 0.5 : 0,
//           duration: const Duration(milliseconds: 300),
//           child: const Icon(Icons.menu, color: primaryText),
//         ),
//       ),
//     ];
//   }

//   List<Widget> _buildDesktopMenu() {
//     return [
//       _buildNavItem('Features', () => _scrollToSection('features')),
//       _buildNavItem('How It Works', () => _scrollToSection('how-it-works')),
//       _buildNavItem('Screenshots', () => _scrollToSection('screenshots')),
//       _buildNavItem('Testimonials', () => _scrollToSection('testimonials')),
//       _buildNavItem('Pricing', () => _scrollToSection('pricing')),
//       _buildNavItem('FAQs', () => _scrollToSection('faqs')),
//       _buildNavItem('Download', () => _scrollToSection('download')),
//       _buildNavItem('About', () => _scrollToSection('about-team')),
//       _buildNavItem('Contact', () => _scrollToSection('contact')),
//       // _buildNavItemButton('Get Started', () => _scrollToSection('auth')),
//       _buildGetStartedButton(() => _scrollToSection('auth')),
//     ];
//   }

//   Widget _buildNavItem(String title, VoidCallback onTap) {
//     return TextButton(
//       onPressed: onTap,
//       style: TextButton.styleFrom(
//         foregroundColor: primaryText,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       ),
//       child: Text(
//         title,
//         style: GoogleFonts.inter(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }

//   Widget _buildGetStartedButton(VoidCallback onPressed) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           gradient: LinearGradient(
//             colors: [
//               webAccentBlue,
//               webAccentBlue.withOpacity(0.8),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: webAccentBlue.withOpacity(0.3),
//               blurRadius: 12,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: onPressed,
//             borderRadius: BorderRadius.circular(12),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(
//                     Icons.rocket_launch_rounded,
//                     color: Colors.white,
//                     size: 18,
//                   ),
//                   const SizedBox(width: 8),
//                   const Text(
//                     'Get Started',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildGradientButton(
//       String title, bool isPrimary, VoidCallback onTap) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: isPrimary ? heroGradient : null,
//         border: isPrimary ? null : Border.all(color: primaryColor, width: 2),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: isPrimary
//             ? [
//                 BoxShadow(
//                   color: primaryColor.withOpacity(0.3),
//                   blurRadius: 12,
//                   offset: const Offset(0, 4),
//                 ),
//               ]
//             : null,
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(12),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//             child: Text(
//               title,
//               style: GoogleFonts.inter(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: isPrimary ? Colors.white : primaryColor,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildContactSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['contact'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: 80,
//       ),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             backgroundColor,
//             primaryColor.withOpacity(0.05),
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           // Section Header
//           _buildSectionHeader(
//             'Get in Touch',
//             'Have questions? We\'d love to hear from you. Send us a message and we\'ll respond as soon as possible.',
//             isMobile,
//           ),

//           const SizedBox(height: 60),

//           if (isMobile) ...[
//             _buildContactInfo(),
//             const SizedBox(height: 40),
//             _buildContactForm(),
//           ] else
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(flex: 5, child: _buildContactForm()),
//                 const SizedBox(width: 60),
//                 Expanded(flex: 4, child: _buildContactInfo()),
//               ],
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactForm() {
//     return Container(
//       padding: const EdgeInsets.all(32),
//       decoration: BoxDecoration(
//         color: surfaceColor,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 30,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Send us a message',
//             style: GoogleFonts.inter(
//               fontSize: 24,
//               fontWeight: FontWeight.w700,
//               color: primaryText,
//             ),
//           ),
//           const SizedBox(height: 24),

//           // Form Fields
//           _buildTextField('Name', 'Your full name'),
//           const SizedBox(height: 16),
//           _buildTextField('Email', 'your@email.com'),
//           const SizedBox(height: 16),
//           _buildTextField('Subject', 'What\'s this about?'),
//           const SizedBox(height: 16),
//           _buildTextField('Message', 'Tell us more...', maxLines: 4),
//           const SizedBox(height: 24),

//           // Submit Button
//           SizedBox(
//             width: double.infinity,
//             child: _buildGradientButton('Send Message', true, () {}),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//             color: primaryText,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextFormField(
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: GoogleFonts.inter(color: mutedText),
//             filled: true,
//             fillColor: backgroundColor,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide.none,
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: primaryColor, width: 2),
//             ),
//             contentPadding: const EdgeInsets.all(16),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildContactInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Contact Information',
//           style: GoogleFonts.inter(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: primaryText,
//           ),
//         ),
//         const SizedBox(height: 24),
//         _buildContactItem(Icons.email, 'Email', 'support@walletlogs.com'),
//         const SizedBox(height: 20),
//         _buildContactItem(Icons.phone, 'Phone', '+8801831126629'),
//         const SizedBox(height: 20),
//         _buildContactItem(Icons.location_on, 'Address', '\nPatuakhali, 8602'),
//         const SizedBox(height: 32),
//         Text(
//           'Follow Us',
//           style: GoogleFonts.inter(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: primaryText,
//           ),
//         ),
//         const SizedBox(height: 16),
//         Row(
//           children: [
//             _buildSocialButton(Icons.facebook, () {}),
//             const SizedBox(width: 12),
//             _buildSocialButton(Icons.alternate_email, () {}), // Twitter
//             const SizedBox(width: 12),
//             _buildSocialButton(Icons.link, () {}), // LinkedIn
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildContactItem(IconData icon, String title, String content) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             gradient: heroGradient,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(icon, color: Colors.white, size: 20),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: GoogleFonts.inter(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: primaryText,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 content,
//                 style: GoogleFonts.inter(
//                   fontSize: 14,
//                   color: secondaryText,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // Widget _buildSocialButton(IconData icon, VoidCallback onTap) {
//   //   return Container(
//   //     width: 48,
//   //     height: 48,
//   //     decoration: BoxDecoration(
//   //       color: backgroundColor,
//   //       borderRadius: BorderRadius.circular(12),
//   //       border: Border.all(color: Colors.grey.shade300),
//   //     ),
//   //     child: Material(
//   //       color: Colors.transparent,
//   //       child: InkWell(
//   //         onTap: onTap,
//   //         borderRadius: BorderRadius.circular(12),
//   //         child: Icon(icon, color: secondaryText, size: 20),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget _buildAuthSection() {
//     return Container(
//       key: _sectionKeys['auth'],
//       child: const ResponsiveAuthSections(),
//     );
//   }

//   Widget _buildHeroSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['hero'],
//       width: double.infinity,
//       height: screenSize.height,
//       child: Stack(
//         children: [
//           // Gradient Background
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   backgroundColor,
//                   primaryColor.withOpacity(0.05),
//                   accentColor.withOpacity(0.05),
//                 ],
//               ),
//             ),
//           ),

//           // Floating Geometric Shapes
//           ..._buildFloatingShapes(screenSize),

//           // Main Content
//           SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isMobile ? 20 : 80,
//                 vertical: 40,
//               ),
//               child: AnimatedBuilder(
//                 animation: _heroController,
//                 builder: (context, child) {
//                   return FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: SlideTransition(
//                       position: _slideAnimation,
//                       child: Transform.scale(
//                         scale: _scaleAnimation.value,
//                         child: isMobile
//                             ? _buildHeroContentMobile(screenSize)
//                             : _buildHeroContentDesktop(screenSize),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> _buildFloatingShapes(Size screenSize) {
//     return [
//       // Floating Circle
//       AnimatedBuilder(
//         animation: _floatingController,
//         builder: (context, child) {
//           return Positioned(
//             top: 100 + (30 * math.sin(_floatingController.value * 2 * math.pi)),
//             right:
//                 50 + (20 * math.cos(_floatingController.value * 2 * math.pi)),
//             child: Transform.rotate(
//               angle: _rotationAnimation.value,
//               child: Container(
//                 width: 80,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       primaryColor.withOpacity(0.3),
//                       accentColor.withOpacity(0.3),
//                     ],
//                   ),
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color:
//                           primaryColor.withOpacity(0.2 * _glowAnimation.value),
//                       blurRadius: 30,
//                       spreadRadius: 5,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),

//       // Floating Triangle
//       AnimatedBuilder(
//         animation: _floatingController,
//         builder: (context, child) {
//           return Positioned(
//             bottom:
//                 200 + (40 * math.cos(_floatingController.value * 2 * math.pi)),
//             left: 80 + (25 * math.sin(_floatingController.value * 2 * math.pi)),
//             child: Transform.rotate(
//               angle: -_rotationAnimation.value,
//               child: CustomPaint(
//                 painter: TrianglePainter(
//                   color: secondaryColor.withOpacity(0.3),
//                   glowIntensity: _glowAnimation.value,
//                 ),
//                 size: const Size(60, 60),
//               ),
//             ),
//           );
//         },
//       ),

//       // Floating Rectangle
//       AnimatedBuilder(
//         animation: _floatingController,
//         builder: (context, child) {
//           return Positioned(
//             top: screenSize.height * 0.6 +
//                 (35 * math.sin(_floatingController.value * 1.5 * math.pi)),
//             right: 120 +
//                 (30 * math.cos(_floatingController.value * 1.5 * math.pi)),
//             child: Transform.rotate(
//               angle: _rotationAnimation.value * 0.5,
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       warningColor.withOpacity(0.3),
//                       errorColor.withOpacity(0.3),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color:
//                           warningColor.withOpacity(0.2 * _glowAnimation.value),
//                       blurRadius: 25,
//                       spreadRadius: 3,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     ];
//   }

//   Widget _buildHeroContentMobile(Size screenSize) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildHeroMockup(screenSize, true),
//         const SizedBox(height: 60),
//         _buildHeroText(true),
//         const SizedBox(height: 40),
//         _buildHeroButtons(true),
//       ],
//     );
//   }

//   Widget _buildHeroContentDesktop(Size screenSize) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 6,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeroText(false),
//               const SizedBox(height: 50),
//               _buildHeroButtons(false),
//             ],
//           ),
//         ),
//         const SizedBox(width: 80),
//         Expanded(
//           flex: 5,
//           child: _buildHeroMockup(screenSize, false),
//         ),
//       ],
//     );
//   }

//   Widget _buildHeroText(bool isMobile) {
//     return Column(
//       crossAxisAlignment:
//           isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
//       children: [
//         // Animated Badge
//         TweenAnimationBuilder<double>(
//           duration: const Duration(milliseconds: 800),
//           tween: Tween(begin: 0.0, end: 1.0),
//           builder: (context, value, child) {
//             return Transform.scale(
//               scale: value,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 decoration: BoxDecoration(
//                   gradient: heroGradient,
//                   borderRadius: BorderRadius.circular(25),
//                   boxShadow: [
//                     BoxShadow(
//                       color: primaryColor.withOpacity(0.3),
//                       blurRadius: 15,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(Icons.star, color: Colors.white, size: 16),
//                     const SizedBox(width: 8),
//                     Text(
//                       '#1 Finance App 2024',
//                       style: GoogleFonts.inter(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),

//         const SizedBox(height: 30),

//         // Main Headline
//         ShaderMask(
//           shaderCallback: (bounds) => heroGradient.createShader(bounds),
//           child: Text(
//             'Take Control of Your\nFinancial Future',
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 42 : 72,
//               fontWeight: FontWeight.w900,
//               height: 1.1,
//               color: Colors.white,
//               letterSpacing: -2,
//             ),
//             textAlign: isMobile ? TextAlign.center : TextAlign.left,
//           ),
//         ),

//         const SizedBox(height: 24),

//         // Subtitle
//         Text(
//           'Smart expense tracking, budget management, and financial insights all in one beautiful app. Join 15,000+ users who are already managing their money better.',
//           style: GoogleFonts.inter(
//             fontSize: isMobile ? 18 : 20,
//             fontWeight: FontWeight.w400,
//             color: secondaryText,
//             height: 1.6,
//           ),
//           textAlign: isMobile ? TextAlign.center : TextAlign.left,
//         ),

//         const SizedBox(height: 32),

//         // Trust Indicators
//         _buildTrustIndicators(isMobile),
//       ],
//     );
//   }

//   Widget _buildTrustIndicators(bool isMobile) {
//     return TweenAnimationBuilder<double>(
//       duration: const Duration(milliseconds: 1200),
//       tween: Tween(begin: 0.0, end: 1.0),
//       builder: (context, value, child) {
//         return Transform.translate(
//           offset: Offset(0, 20 * (1 - value)),
//           child: Opacity(
//             opacity: value,
//             child: Row(
//               mainAxisAlignment:
//                   isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
//               children: [
//                 _buildTrustItem('15K+', 'Active Users', Icons.people),
//                 const SizedBox(width: 40),
//                 _buildTrustItem('50K+', 'Transactions', Icons.receipt),
//                 const SizedBox(width: 40),
//                 _buildTrustItem('\$2.5M+', 'Managed', Icons.trending_up),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildTrustItem(String number, String label, IconData icon) {
//     return Column(
//       children: [
//         Icon(icon, color: primaryColor, size: 24),
//         const SizedBox(height: 8),
//         Text(
//           number,
//           style: GoogleFonts.inter(
//             fontSize: 20,
//             fontWeight: FontWeight.w700,
//             color: primaryColor,
//           ),
//         ),
//         Text(
//           label,
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             color: mutedText,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildHeroButtons(bool isMobile) {
//     return TweenAnimationBuilder<double>(
//       duration: const Duration(milliseconds: 1000),
//       tween: Tween(begin: 0.0, end: 1.0),
//       builder: (context, value, child) {
//         return Transform.translate(
//           offset: Offset(0, 30 * (1 - value)),
//           child: Opacity(
//             opacity: value,
//             child: Wrap(
//               spacing: 16,
//               runSpacing: 16,
//               alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
//               children: [
//                 // _buildAnimatedButton(
//                 //   'Get Started Free',
//                 //   true,
//                 //   Icons.rocket_launch,
//                 //   () => _showAuthDialog(false),
//                 // ),
//                 _buildAnimatedButton(
//                   'Watch Demo',
//                   false,
//                   Icons.play_arrow,
//                   () => _scrollToSection('features'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildAnimatedButton(
//       String text, bool isPrimary, IconData icon, VoidCallback onTap) {
//     return StatefulBuilder(
//       builder: (context, setState) {
//         bool isHovered = false;

//         return MouseRegion(
//           onEnter: (_) => setState(() => isHovered = true),
//           onExit: (_) => setState(() => isHovered = false),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
//             decoration: BoxDecoration(
//               gradient: isPrimary ? heroGradient : null,
//               border:
//                   isPrimary ? null : Border.all(color: primaryColor, width: 2),
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 if (isPrimary || isHovered)
//                   BoxShadow(
//                     color: primaryColor.withOpacity(isHovered ? 0.4 : 0.3),
//                     blurRadius: isHovered ? 20 : 15,
//                     offset: const Offset(0, 8),
//                   ),
//               ],
//             ),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: onTap,
//                 borderRadius: BorderRadius.circular(16),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         icon,
//                         color: isPrimary ? Colors.white : primaryColor,
//                         size: 20,
//                       ),
//                       const SizedBox(width: 12),
//                       Text(
//                         text,
//                         style: GoogleFonts.inter(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: isPrimary ? Colors.white : primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHeroMockup(Size screenSize, bool isMobile) {
//     return AnimatedBuilder(
//       animation: _floatingController,
//       builder: (context, child) {
//         return Transform.translate(
//           offset:
//               Offset(0, 20 * math.sin(_floatingController.value * 2 * math.pi)),
//           child: Container(
//             height: isMobile ? 400 : 600,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 40,
//                   offset: const Offset(0, 20),
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 // Phone Frame
//                 Container(
//                   margin: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: surfaceColor,
//                     borderRadius: BorderRadius.circular(25),
//                     border: Border.all(color: Colors.grey.shade300, width: 2),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 30,
//                         offset: const Offset(0, 15),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(23),
//                     child: Column(
//                       children: [
//                         // Status Bar
//                         Container(
//                           height: 30,
//                           color: primaryColor,
//                           child: const Center(
//                             child: Text(
//                               'WalletLogs',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),

//                         // App Content
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: _buildMockupContent(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // Floating UI Elements
//                 ..._buildFloatingUIElements(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildMockupContent() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Balance Card
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [successColor, accentColor],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Total Balance',
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   '\$12,450.00',
//                   style: GoogleFonts.inter(
//                     fontSize: 28,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Icon(Icons.trending_up,
//                         color: Colors.white, size: 16),
//                     const SizedBox(width: 4),
//                     Text(
//                       '+12.5% from last month',
//                       style: GoogleFonts.inter(
//                         fontSize: 12,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),

//           // Quick Actions
//           Row(
//             children: [
//               Expanded(
//                   child:
//                       _buildQuickAction(Icons.add, 'Add Income', successColor)),
//               const SizedBox(width: 12),
//               Expanded(
//                   child: _buildQuickAction(
//                       Icons.remove, 'Add Expense', errorColor)),
//             ],
//           ),

//           const SizedBox(height: 24),

//           // Recent Transactions
//           Text(
//             'Recent Transactions',
//             style: GoogleFonts.inter(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: primaryText,
//             ),
//           ),

//           const SizedBox(height: 16),

//           // Transaction List
//           ...List.generate(3, (index) {
//             final transactions = [
//               {
//                 'title': 'Grocery Store',
//                 'amount': '-\$85.20',
//                 'icon': Icons.shopping_cart,
//                 'color': errorColor
//               },
//               {
//                 'title': 'Salary Deposit',
//                 'amount': '+\$2,800.00',
//                 'icon': Icons.account_balance,
//                 'color': successColor
//               },
//               {
//                 'title': 'Coffee & Snacks',
//                 'amount': '-\$24.50',
//                 'icon': Icons.local_cafe,
//                 'color': warningColor
//               },
//             ];

//             return Container(
//               margin: const EdgeInsets.only(bottom: 12),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: backgroundColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: (transactions[index]['color'] as Color)
//                           .withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(
//                       transactions[index]['icon'] as IconData,
//                       color: transactions[index]['color'] as Color,
//                       size: 20,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Text(
//                       transactions[index]['title'] as String,
//                       style: GoogleFonts.inter(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: primaryText,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     transactions[index]['amount'] as String,
//                     style: GoogleFonts.inter(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: transactions[index]['color'] as Color,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickAction(IconData icon, String label, Color color) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color.withOpacity(0.2)),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: color, size: 24),
//           const SizedBox(height: 8),
//           Text(
//             label,
//             style: GoogleFonts.inter(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: color,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> _buildFloatingUIElements() {
//     return [
//       // Floating notification
//       AnimatedBuilder(
//         animation: _floatingController,
//         builder: (context, child) {
//           return Positioned(
//             top: 80 + (10 * math.sin(_floatingController.value * 3 * math.pi)),
//             right: -20,
//             child: Transform.rotate(
//               angle: 0.1 * math.sin(_floatingController.value * 2 * math.pi),
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: successColor,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: successColor.withOpacity(0.3),
//                       blurRadius: 15,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(Icons.check_circle,
//                         color: Colors.white, size: 16),
//                     const SizedBox(width: 6),
//                     Text(
//                       'Goal Achieved!',
//                       style: GoogleFonts.inter(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),

//       // Floating chart
//       AnimatedBuilder(
//         animation: _floatingController,
//         builder: (context, child) {
//           return Positioned(
//             bottom: 100 +
//                 (15 * math.cos(_floatingController.value * 2.5 * math.pi)),
//             left: -15,
//             child: Container(
//               width: 60,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: surfaceColor,
//                 borderRadius: BorderRadius.circular(8),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: const Icon(
//                 Icons.bar_chart,
//                 color: primaryColor,
//                 size: 24,
//               ),
//             ),
//           );
//         },
//       ),
//     ];
//   }

//   Widget _buildStatsSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['stats'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: isMobile ? 60 : 120,
//       ),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [backgroundColor, Color(0xFFF8FAFC)],
//         ),
//       ),
//       child: Column(
//         children: [
//           // Section Header
//           TweenAnimationBuilder<double>(
//             duration: const Duration(milliseconds: 800),
//             tween: Tween(begin: 0.0, end: 1.0),
//             builder: (context, value, child) {
//               return Transform.translate(
//                 offset: Offset(0, 30 * (1 - value)),
//                 child: Opacity(
//                   opacity: value,
//                   child: Column(
//                     children: [
//                       Text(
//                         'Trusted by Thousands',
//                         style: GoogleFonts.inter(
//                           fontSize: isMobile ? 32 : 48,
//                           fontWeight: FontWeight.w800,
//                           color: primaryText,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Join our growing community of smart money managers',
//                         style: GoogleFonts.inter(
//                           fontSize: isMobile ? 16 : 20,
//                           color: secondaryText,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),

//           SizedBox(height: isMobile ? 40 : 80),

//           // Stats Grid
//           AnimatedBuilder(
//             animation: _statsController,
//             builder: (context, child) {
//               return isMobile ? _buildStatsMobile() : _buildStatsDesktop();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatsMobile() {
//     final stats = _getStatsData();
//     return Column(
//       children: stats.asMap().entries.map((entry) {
//         final index = entry.key;
//         final stat = entry.value;
//         return TweenAnimationBuilder<double>(
//           duration: Duration(milliseconds: 800 + (index * 200)),
//           tween: Tween(begin: 0.0, end: 1.0),
//           builder: (context, value, child) {
//             return Transform.translate(
//               offset: Offset(0, 50 * (1 - value)),
//               child: Opacity(
//                 opacity: value,
//                 child: Container(
//                   margin: const EdgeInsets.only(bottom: 24),
//                   child: _buildStatCard(stat, index),
//                 ),
//               ),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildStatsDesktop() {
//     final stats = _getStatsData();
//     return Row(
//       children: stats.asMap().entries.map((entry) {
//         final index = entry.key;
//         final stat = entry.value;
//         return Expanded(
//           child: TweenAnimationBuilder<double>(
//             duration: Duration(milliseconds: 1000 + (index * 300)),
//             tween: Tween(begin: 0.0, end: 1.0),
//             builder: (context, value, child) {
//               return Transform.translate(
//                 offset: Offset(0, 50 * (1 - value)),
//                 child: Opacity(
//                   opacity: value,
//                   child: Container(
//                     margin:
//                         EdgeInsets.symmetric(horizontal: index == 1 ? 24 : 12),
//                     child: _buildStatCard(stat, index),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }).toList(),
//     );
//   }

//   List<Map<String, dynamic>> _getStatsData() {
//     return [
//       {
//         'icon': Icons.people_outline,
//         'number': 15000,
//         'suffix': '+',
//         'label': 'Active Users',
//         'color': primaryColor,
//         'description': 'Trust our platform',
//       },
//       {
//         'icon': Icons.receipt_long_outlined,
//         'number': 50000,
//         'suffix': '+',
//         'label': 'Transactions',
//         'color': secondaryColor,
//         'description': 'Successfully tracked',
//       },
//       {
//         'icon': Icons.trending_up_outlined,
//         'number': 25,
//         'suffix': 'M+',
//         'prefix': '\$',
//         'label': 'Money Managed',
//         'color': successColor,
//         'description': 'Under management',
//       },
//     ];
//   }

//   Widget _buildStatCard(Map<String, dynamic> stat, int index) {
//     return Container(
//       padding: const EdgeInsets.all(32),
//       decoration: BoxDecoration(
//         gradient: cardGradient,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: (stat['color'] as Color).withOpacity(0.1),
//           width: 2,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Icon with animated background
//           Container(
//             width: 80,
//             height: 80,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   (stat['color'] as Color).withOpacity(0.1),
//                   (stat['color'] as Color).withOpacity(0.05),
//                 ],
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Icon(
//               stat['icon'] as IconData,
//               size: 36,
//               color: stat['color'] as Color,
//             ),
//           ),

//           const SizedBox(height: 24),

//           // Animated counter
//           TweenAnimationBuilder<int>(
//             duration: Duration(milliseconds: 2000 + (index * 500)),
//             tween: IntTween(begin: 0, end: stat['number'] as int),
//             builder: (context, value, child) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   if (stat['prefix'] != null)
//                     Text(
//                       stat['prefix'] as String,
//                       style: GoogleFonts.inter(
//                         fontSize: 36,
//                         fontWeight: FontWeight.w800,
//                         color: stat['color'] as Color,
//                       ),
//                     ),
//                   Text(
//                     value.toString(),
//                     style: GoogleFonts.inter(
//                       fontSize: 36,
//                       fontWeight: FontWeight.w800,
//                       color: stat['color'] as Color,
//                     ),
//                   ),
//                   Text(
//                     stat['suffix'] as String,
//                     style: GoogleFonts.inter(
//                       fontSize: 36,
//                       fontWeight: FontWeight.w800,
//                       color: stat['color'] as Color,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),

//           const SizedBox(height: 12),

//           Text(
//             stat['label'] as String,
//             style: GoogleFonts.inter(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: primaryText,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           const SizedBox(height: 8),

//           Text(
//             stat['description'] as String,
//             style: GoogleFonts.inter(
//               fontSize: 14,
//               color: mutedText,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

// // ...existing code...

//   Widget _buildFeaturesSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['features'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: isMobile ? 60 : 120,
//       ),
//       child: Column(
//         children: [
//           // Section Header - Use the same pattern as other sections
//           _buildSectionHeader(
//             'Everything You Need',
//             'Powerful features to take complete control of your finances',
//             isMobile,
//           ),

//           SizedBox(height: isMobile ? 40 : 80),

//           // Features Grid
//           AnimatedBuilder(
//             animation: _featuresController,
//             builder: (context, child) {
//               return _buildFeaturesGrid(isMobile);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeaturesGrid(bool isMobile) {
//     final features = _getFeaturesData();
//     final screenSize = MediaQuery.of(context).size;

//     if (isMobile) {
//       return Column(
//         children: features.asMap().entries.map((entry) {
//           final index = entry.key;
//           final feature = entry.value;
//           return TweenAnimationBuilder<double>(
//             duration: Duration(milliseconds: 800 + (index * 200)),
//             tween: Tween(begin: 0.0, end: 1.0),
//             builder: (context, value, child) {
//               return Transform.translate(
//                 offset: Offset(0, 50 * (1 - value)),
//                 child: Opacity(
//                   opacity: value,
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 24),
//                     child: _buildFeatureCard(feature, index, isMobile),
//                   ),
//                 ),
//               );
//             },
//           );
//         }).toList(),
//       );
//     }

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: screenSize.width > 1200 ? 3 : 2,
//         crossAxisSpacing: 24,
//         mainAxisSpacing: 24,
//         childAspectRatio: 1.1,
//       ),
//       itemCount: features.length,
//       itemBuilder: (context, index) {
//         return TweenAnimationBuilder<double>(
//           duration: Duration(milliseconds: 800 + (index * 200)),
//           tween: Tween(begin: 0.0, end: 1.0),
//           builder: (context, value, child) {
//             return Transform.translate(
//               offset: Offset(0, 50 * (1 - value)),
//               child: Opacity(
//                 opacity: value,
//                 child: _buildFeatureCard(features[index], index, false),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildFeatureCard(
//       Map<String, dynamic> feature, int index, bool isMobile) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _hoveredFeature = index),
//       onExit: (_) => setState(() => _hoveredFeature = -1),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         transform: Matrix4.identity()
//           ..scale(_hoveredFeature == index ? 1.05 : 1.0),
//         padding: EdgeInsets.all(isMobile ? 24 : 32),
//         decoration: BoxDecoration(
//           gradient: _hoveredFeature == index
//               ? LinearGradient(
//                   colors: feature['gradient'] as List<Color>,
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 )
//               : cardGradient,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: _hoveredFeature == index
//                 ? Colors.transparent
//                 : (feature['color'] as Color).withOpacity(0.1),
//             width: 2,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: _hoveredFeature == index
//                   ? (feature['color'] as Color).withOpacity(0.3)
//                   : Colors.black.withOpacity(0.05),
//               blurRadius: _hoveredFeature == index ? 30 : 20,
//               offset: Offset(0, _hoveredFeature == index ? 15 : 10),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min, // Add this for mobile
//           children: [
//             // Animated Icon
//             Container(
//               width: isMobile ? 50 : 60,
//               height: isMobile ? 50 : 60,
//               decoration: BoxDecoration(
//                 color: _hoveredFeature == index
//                     ? Colors.white.withOpacity(0.2)
//                     : (feature['color'] as Color).withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Icon(
//                 feature['icon'] as IconData,
//                 size: isMobile ? 24 : 28,
//                 color: _hoveredFeature == index
//                     ? Colors.white
//                     : feature['color'] as Color,
//               ),
//             ),

//             SizedBox(height: isMobile ? 16 : 24),

//             Text(
//               feature['title'] as String,
//               style: GoogleFonts.inter(
//                 fontSize: isMobile ? 16 : 18,
//                 fontWeight: FontWeight.w700,
//                 color: _hoveredFeature == index ? Colors.white : primaryText,
//               ),
//             ),

//             SizedBox(height: isMobile ? 8 : 12),

//             // Description with flexible height for mobile
//             isMobile
//                 ? Text(
//                     feature['description'] as String,
//                     style: GoogleFonts.inter(
//                       fontSize: 14,
//                       color: _hoveredFeature == index
//                           ? Colors.white.withOpacity(0.9)
//                           : secondaryText,
//                       height: 1.5,
//                     ),
//                   )
//                 : Expanded(
//                     child: Text(
//                       feature['description'] as String,
//                       style: GoogleFonts.inter(
//                         fontSize: 14,
//                         color: _hoveredFeature == index
//                             ? Colors.white.withOpacity(0.9)
//                             : secondaryText,
//                         height: 1.5,
//                       ),
//                     ),
//                   ),

//             SizedBox(height: isMobile ? 12 : 16),

//             // Learn More Link
//             InkWell(
//               onTap: () {
//                 // Add navigation or modal logic here
//                 print('Learn more about ${feature['title']}');
//               },
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Learn More',
//                     style: GoogleFonts.inter(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: _hoveredFeature == index
//                           ? Colors.white
//                           : feature['color'] as Color,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Icon(
//                     Icons.arrow_forward,
//                     size: 16,
//                     color: _hoveredFeature == index
//                         ? Colors.white
//                         : feature['color'] as Color,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// // ...existing code...
//   List<Map<String, dynamic>> _getFeaturesData() {
//     return [
//       {
//         'icon': Icons.track_changes,
//         'title': 'Smart Expense Tracking',
//         'description':
//             'Automatically categorize and track your expenses with AI-powered insights and real-time notifications.',
//         'color': primaryColor,
//         'gradient': [primaryColor, secondaryColor],
//       },
//       {
//         'icon': Icons.account_balance,
//         'title': 'Balance Management',
//         'description':
//             'Monitor your account balances across multiple banks and cards with real-time synchronization.',
//         'color': accentColor,
//         'gradient': [accentColor, primaryColor],
//       },
//       {
//         'icon': Icons.pie_chart,
//         'title': 'Budget Planning',
//         'description':
//             'Create personalized budgets with smart recommendations and get alerts before overspending.',
//         'color': successColor,
//         'gradient': [successColor, accentColor],
//       },
//       {
//         'icon': Icons.savings,
//         'title': 'Savings Goals',
//         'description':
//             'Set and track multiple savings goals with visual progress indicators and milestone celebrations.',
//         'color': warningColor,
//         'gradient': [warningColor, errorColor],
//       },
//       {
//         'icon': Icons.analytics,
//         'title': 'Advanced Analytics',
//         'description':
//             'Beautiful charts and detailed reports to understand your spending patterns and financial health.',
//         'color': secondaryColor,
//         'gradient': [secondaryColor, primaryColor],
//       },
//       {
//         'icon': Icons.security,
//         'title': 'Bank-Level Security',
//         'description':
//             'Your data is protected with 256-bit encryption and multi-factor authentication.',
//         'color': errorColor,
//         'gradient': [errorColor, warningColor],
//       },
//     ];
//   }

//   Widget _buildHowItWorksSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['how-it-works'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: isMobile ? 60 : 120,
//       ),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFFF8FAFC), backgroundColor],
//         ),
//       ),
//       child: Column(
//         children: [
//           // Section Header
//           Text(
//             'How It Works',
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 32 : 48,
//               fontWeight: FontWeight.w800,
//               color: primaryText,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           const SizedBox(height: 16),

//           Text(
//             'Get started in just 4 simple steps',
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 16 : 20,
//               color: secondaryText,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           SizedBox(height: isMobile ? 40 : 80),

//           // Steps
//           isMobile ? _buildStepsMobile() : _buildStepsDesktop(),
//         ],
//       ),
//     );
//   }

//   Widget _buildStepsMobile() {
//     final steps = _getStepsData();
//     return Column(
//       children: steps.asMap().entries.map((entry) {
//         final index = entry.key;
//         final step = entry.value;
//         return Container(
//           margin: const EdgeInsets.only(bottom: 32),
//           child: _buildStepCard(step, index + 1, true),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildStepsDesktop() {
//     final steps = _getStepsData();
//     return Row(
//       children: steps.asMap().entries.map((entry) {
//         final index = entry.key;
//         final step = entry.value;
//         return Expanded(
//           child: Row(
//             children: [
//               Expanded(child: _buildStepCard(step, index + 1, false)),
//               if (index < steps.length - 1) ...[
//                 const SizedBox(width: 20),
//                 Container(
//                   width: 40,
//                   height: 2,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         primaryColor.withOpacity(0.3),
//                         accentColor.withOpacity(0.3)
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//               ],
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }

//   List<Map<String, dynamic>> _getStepsData() {
//     return [
//       {
//         'title': 'Sign Up',
//         'description':
//             'Create your free account in less than 2 minutes with email or social login',
//         'icon': Icons.person_add,
//         'color': primaryColor,
//       },
//       {
//         'title': 'Connect Accounts',
//         'description':
//             'Securely link your bank accounts and cards for automatic transaction import',
//         'icon': Icons.link,
//         'color': accentColor,
//       },
//       {
//         'title': 'Set Goals',
//         'description':
//             'Define your financial goals and budgets with our smart recommendation engine',
//         'icon': Icons.flag,
//         'color': successColor,
//       },
//       {
//         'title': 'Track & Achieve',
//         'description':
//             'Monitor your progress with beautiful insights and achieve your financial dreams',
//         'icon': Icons.emoji_events,
//         'color': warningColor,
//       },
//     ];
//   }

//   Widget _buildStepCard(Map<String, dynamic> step, int number, bool isMobile) {
//     return TweenAnimationBuilder<double>(
//       duration: Duration(milliseconds: 800 + (number * 200)),
//       tween: Tween(begin: 0.0, end: 1.0),
//       builder: (context, value, child) {
//         return Transform.translate(
//           offset: Offset(0, 30 * (1 - value)),
//           child: Opacity(
//             opacity: value,
//             child: Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 gradient: cardGradient,
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(
//                   color: (step['color'] as Color).withOpacity(0.2),
//                   width: 2,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 20,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   // Step Number
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           step['color'] as Color,
//                           (step['color'] as Color).withOpacity(0.7),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: (step['color'] as Color).withOpacity(0.3),
//                           blurRadius: 15,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         number.toString(),
//                         style: GoogleFonts.inter(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // Icon
//                   Icon(
//                     step['icon'] as IconData,
//                     size: 32,
//                     color: step['color'] as Color,
//                   ),

//                   const SizedBox(height: 16),

//                   // Title
//                   Text(
//                     step['title'] as String,
//                     style: GoogleFonts.inter(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: primaryText,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),

//                   const SizedBox(height: 12),

//                   // Description
//                   Text(
//                     step['description'] as String,
//                     style: GoogleFonts.inter(
//                       fontSize: 14,
//                       color: secondaryText,
//                       height: 1.5,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildPricingSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['pricing'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: isMobile ? 60 : 120,
//       ),
//       child: Column(
//         children: [
//           // Section Header
//           TweenAnimationBuilder<double>(
//             duration: const Duration(milliseconds: 800),
//             tween: Tween(begin: 0.0, end: 1.0),
//             builder: (context, value, child) {
//               return Transform.translate(
//                 offset: Offset(0, 30 * (1 - value)),
//                 child: Opacity(
//                   opacity: value,
//                   child: Column(
//                     children: [
//                       Text(
//                         'Simple, Transparent Pricing',
//                         style: GoogleFonts.inter(
//                           fontSize: isMobile ? 32 : 48,
//                           fontWeight: FontWeight.w800,
//                           color: primaryText,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Choose the perfect plan for your financial journey',
//                         style: GoogleFonts.inter(
//                           fontSize: isMobile ? 16 : 20,
//                           color: secondaryText,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),

//           SizedBox(height: isMobile ? 40 : 80),

//           // Pricing Cards
//           isMobile ? _buildPricingMobile() : _buildPricingDesktop(),
//         ],
//       ),
//     );
//   }

//   Widget _buildPricingMobile() {
//     final plans = _getPricingData();
//     return Column(
//       children: plans.asMap().entries.map((entry) {
//         final index = entry.key;
//         final plan = entry.value;
//         return Container(
//           margin: const EdgeInsets.only(bottom: 24),
//           child: _buildPricingCard(plan, index),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildPricingDesktop() {
//     final plans = _getPricingData();
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: plans.asMap().entries.map((entry) {
//         final index = entry.key;
//         final plan = entry.value;
//         return Expanded(
//           child: Container(
//             margin: EdgeInsets.symmetric(horizontal: index == 1 ? 12 : 6),
//             child: Transform.scale(
//               scale: plan['isPopular'] ? 1.05 : 1.0,
//               child: _buildPricingCard(plan, index),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

// // ...existing code...

//   List<Map<String, dynamic>> _getPricingData() {
//     return [
//       {
//         'title': 'Starter',
//         'subtitle': 'Perfect for beginners',
//         'price': '0',
//         'period': 'forever',
//         'isPopular': false,
//         'color': accentColor,
//         'features': <String>[
//           // Explicitly type as List<String>
//           'Basic expense tracking',
//           'Up to 3 budget categories',
//           'Monthly financial reports',
//           'Mobile app access',
//           'Email support',
//         ],
//         'limitations': <String>[
//           // Explicitly type as List<String>
//           'Limited to 50 transactions/month',
//           'Basic charts only',
//         ],
//       },
//       {
//         'title': 'Professional',
//         'subtitle': 'Most popular choice',
//         'price': '9.99',
//         'period': 'per month',
//         'isPopular': true,
//         'color': primaryColor,
//         'features': <String>[
//           'Unlimited transactions',
//           'Advanced analytics & insights',
//           'Goal tracking & automation',
//           'Multi-account management',
//           'Custom budget categories',
//           'Bill reminders & alerts',
//           'Export data (CSV, PDF)',
//           'Priority support',
//           'Dark mode & themes',
//         ],
//         'limitations': <String>[],
//       },
//       {
//         'title': 'Business',
//         'subtitle': 'For teams and businesses',
//         'price': '29.99',
//         'period': 'per month',
//         'isPopular': false,
//         'color': successColor,
//         'features': <String>[
//           'Everything in Professional',
//           'Team collaboration (up to 10 users)',
//           'Advanced reporting & dashboards',
//           'API access & integrations',
//           'White-label options',
//           'Custom workflows',
//           'Dedicated account manager',
//           'Phone & chat support',
//           'SSO & advanced security',
//         ],
//         'limitations': <String>[],
//       },
//     ];
//   }

//   Widget _buildPricingCard(Map<String, dynamic> plan, int index) {
//     final isPopular = plan['isPopular'] as bool;

//     return TweenAnimationBuilder<double>(
//       duration: Duration(milliseconds: 1000 + (index * 300)),
//       tween: Tween(begin: 0.0, end: 1.0),
//       builder: (context, value, child) {
//         return Transform.translate(
//           offset: Offset(0, 50 * (1 - value)),
//           child: Opacity(
//             opacity: value,
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: isPopular
//                     ? LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [primaryColor, secondaryColor],
//                       )
//                     : cardGradient,
//                 borderRadius: BorderRadius.circular(24),
//                 border: Border.all(
//                   color: isPopular
//                       ? Colors.transparent
//                       : (plan['color'] as Color).withOpacity(0.2),
//                   width: 2,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: isPopular
//                         ? primaryColor.withOpacity(0.3)
//                         : Colors.black.withOpacity(0.05),
//                     blurRadius: isPopular ? 30 : 20,
//                     offset: Offset(0, isPopular ? 15 : 10),
//                   ),
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   // Popular Badge
//                   if (isPopular)
//                     Positioned(
//                       top: -1,
//                       left: 20,
//                       right: 20,
//                       child: Container(
//                         height: 40,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [warningColor, Color(0xFFFF6B35)],
//                           ),
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(12),
//                             bottomRight: Radius.circular(12),
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(
//                             '🔥 MOST POPULAR',
//                             style: GoogleFonts.inter(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.white,
//                               letterSpacing: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                   // Card Content
//                   Padding(
//                     padding: EdgeInsets.all(isPopular ? 32 : 28),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (isPopular) const SizedBox(height: 20),

//                         // Plan Title
//                         Text(
//                           plan['title'] as String,
//                           style: GoogleFonts.inter(
//                             fontSize: 24,
//                             fontWeight: FontWeight.w800,
//                             color: isPopular ? Colors.white : primaryText,
//                           ),
//                         ),

//                         const SizedBox(height: 8),

//                         Text(
//                           plan['subtitle'] as String,
//                           style: GoogleFonts.inter(
//                             fontSize: 16,
//                             color: isPopular
//                                 ? Colors.white.withOpacity(0.8)
//                                 : secondaryText,
//                           ),
//                         ),

//                         const SizedBox(height: 24),

//                         // Price
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               '\$${plan['price']}',
//                               style: GoogleFonts.inter(
//                                 fontSize: 48,
//                                 fontWeight: FontWeight.w900,
//                                 color: isPopular ? Colors.white : primaryText,
//                                 height: 1,
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 8),
//                               child: Text(
//                                 plan['period'] as String,
//                                 style: GoogleFonts.inter(
//                                   fontSize: 16,
//                                   color: isPopular
//                                       ? Colors.white.withOpacity(0.8)
//                                       : mutedText,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 32),

//                         // CTA Button
//                         // SizedBox(
//                         //   width: double.infinity,
//                         //   child: _buildPricingButton(plan, isPopular),
//                         // ),

//                         const SizedBox(height: 32),

//                         // Features List
//                         ...((plan['features'] as List<String>).map(
//                           (feature) => Container(
//                             margin: const EdgeInsets.only(bottom: 12),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 20,
//                                   height: 20,
//                                   decoration: BoxDecoration(
//                                     color: isPopular
//                                         ? Colors.white.withOpacity(0.2)
//                                         : successColor.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Icon(
//                                     Icons.check,
//                                     size: 14,
//                                     color:
//                                         isPopular ? Colors.white : successColor,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: Text(
//                                     feature,
//                                     style: GoogleFonts.inter(
//                                       fontSize: 15,
//                                       color: isPopular
//                                           ? Colors.white.withOpacity(0.9)
//                                           : primaryText,
//                                       height: 1.4,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )),

//                         // Limitations (if any)
//                         if ((plan['limitations'] as List<String>)
//                             .isNotEmpty) ...[
//                           const SizedBox(height: 16),
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: isPopular
//                                   ? Colors.white.withOpacity(0.1)
//                                   : mutedText.withOpacity(0.05),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Limitations:',
//                                   style: GoogleFonts.inter(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                     color: isPopular
//                                         ? Colors.white.withOpacity(0.8)
//                                         : mutedText,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 ...((plan['limitations'] as List<String>).map(
//                                   (limitation) => Text(
//                                     '• $limitation',
//                                     style: GoogleFonts.inter(
//                                       fontSize: 13,
//                                       color: isPopular
//                                           ? Colors.white.withOpacity(0.7)
//                                           : mutedText,
//                                     ),
//                                   ),
//                                 )),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Widget _buildPricingButton(Map<String, dynamic> plan, bool isPopular) {
//   //   return StatefulBuilder(
//   //     builder: (context, setState) {
//   //       bool isHovered = false;

//   //       return MouseRegion(
//   //         onEnter: (_) => setState(() => isHovered = true),
//   //         onExit: (_) => setState(() => isHovered = false),
//   //         child: AnimatedContainer(
//   //           duration: const Duration(milliseconds: 200),
//   //           transform: Matrix4.identity()..scale(isHovered ? 1.02 : 1.0),
//   //           decoration: BoxDecoration(
//   //             gradient: isPopular
//   //                 ? LinearGradient(
//   //                     colors: [Colors.white, Colors.white.withOpacity(0.9)],
//   //                   )
//   //                 : heroGradient,
//   //             borderRadius: BorderRadius.circular(16),
//   //             boxShadow: [
//   //               BoxShadow(
//   //                 color: (isPopular ? Colors.white : primaryColor)
//   //                     .withOpacity(isHovered ? 0.4 : 0.3),
//   //                 blurRadius: isHovered ? 20 : 15,
//   //                 offset: const Offset(0, 8),
//   //               ),
//   //             ],
//   //           ),
//   //           child: Material(
//   //             color: Colors.transparent,
//   //             child: InkWell(
//   //               onTap: () => _showAuthDialog(false),
//   //               borderRadius: BorderRadius.circular(16),
//   //               child: Padding(
//   //                 padding: const EdgeInsets.symmetric(vertical: 16),
//   //                 child: Center(
//   //                   child: Text(
//   //                     plan['price'] == '0' ? 'Start Free' : 'Get Started',
//   //                     style: GoogleFonts.inter(
//   //                       fontSize: 16,
//   //                       fontWeight: FontWeight.w700,
//   //                       color: isPopular ? primaryColor : Colors.white,
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }

// // ...existing code...

//   Widget _buildTestimonialsSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['testimonials'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: isMobile ? 60 : 120,
//       ),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xFFF8FAFC), // slate-50
//             Colors.white,
//             Color(0xFFF8FAFC),
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           // Section Header - Use the same pattern as other sections
//           _buildSectionHeader(
//             'What Our Users Say',
//             'Join thousands of satisfied users who have transformed their financial management',
//             isMobile,
//           ),

//           SizedBox(height: isMobile ? 40 : 80),

//           // Testimonials Grid/Carousel
//           _buildTestimonialsGrid(isMobile, screenSize),

//           SizedBox(height: isMobile ? 40 : 60),

//           // User Stats
//           _buildUserStats(isMobile),
//         ],
//       ),
//     );
//   }

//   Widget _buildTestimonialsGrid(bool isMobile, Size screenSize) {
//     final testimonials = _getTestimonialsData();

//     if (isMobile) {
//       return Column(
//         children: [
//           // Mobile: Show testimonials in a vertical list
//           ...testimonials.asMap().entries.map((entry) {
//             final index = entry.key;
//             final testimonial = entry.value;
//             return TweenAnimationBuilder<double>(
//               duration: Duration(milliseconds: 600 + (index * 200)),
//               tween: Tween(begin: 0.0, end: 1.0),
//               builder: (context, value, child) {
//                 return Transform.translate(
//                   offset: Offset(0, 30 * (1 - value)),
//                   child: Opacity(
//                     opacity: value,
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: _buildTestimonialCard(testimonial, isMobile),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }).toList(),
//         ],
//       );
//     }

//     // Desktop: Use a grid layout
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: screenSize.width > 1200 ? 3 : 2,
//         crossAxisSpacing: 24,
//         mainAxisSpacing: 24,
//         childAspectRatio: 0.8,
//       ),
//       itemCount: testimonials.length,
//       itemBuilder: (context, index) {
//         return TweenAnimationBuilder<double>(
//           duration: Duration(milliseconds: 600 + (index * 200)),
//           tween: Tween(begin: 0.0, end: 1.0),
//           builder: (context, value, child) {
//             return Transform.translate(
//               offset: Offset(0, 30 * (1 - value)),
//               child: Opacity(
//                 opacity: value,
//                 child: _buildTestimonialCard(testimonials[index], false),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildTestimonialCard(
//       Map<String, dynamic> testimonial, bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 20 : 24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
//             offset: Offset(0, 8),
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 1,
//             offset: Offset(0, 1),
//           ),
//         ],
//         border: Border.all(
//           color: Color(0xFFE2E8F0), // slate-200
//           width: 1,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Quote Icon
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [primaryColor, secondaryColor],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Icon(
//               Icons.format_quote,
//               color: Colors.white,
//               size: 20,
//             ),
//           ),

//           SizedBox(height: 16),

//           // Rating Stars
//           Row(
//             children: List.generate(5, (index) {
//               return Icon(
//                 index < (testimonial['rating'] as int)
//                     ? Icons.star
//                     : Icons.star_border,
//                 size: 16,
//                 color: Color(0xFFFBBF24), // yellow-400
//               );
//             }),
//           ),

//           SizedBox(height: 16),

//           // Testimonial Text
//           Text(
//             testimonial['text'] as String,
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 14 : 16,
//               color: primaryText,
//               height: 1.6,
//               fontStyle: FontStyle.italic,
//             ),
//             maxLines: isMobile ? 6 : null,
//             overflow: isMobile ? TextOverflow.ellipsis : null,
//           ),

//           SizedBox(height: 20),

//           // User Info
//           Row(
//             children: [
//               // Avatar
//               Container(
//                 width: 48,
//                 height: 48,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: testimonial['avatarGradient'] as List<Color>,
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 child: testimonial['avatar'] != null
//                     ? ClipRRect(
//                         borderRadius: BorderRadius.circular(24),
//                         child: Image.network(
//                           testimonial['avatar'],
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) =>
//                               _buildAvatarFallback(testimonial['name']),
//                         ),
//                       )
//                     : _buildAvatarFallback(testimonial['name']),
//               ),

//               SizedBox(width: 12),

//               // Name and Title
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       testimonial['name'] as String,
//                       style: GoogleFonts.inter(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: primaryText,
//                       ),
//                     ),
//                     SizedBox(height: 2),
//                     Text(
//                       testimonial['title'] as String,
//                       style: GoogleFonts.inter(
//                         fontSize: 12,
//                         color: secondaryText,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Verified Badge
//               if (testimonial['verified'] == true)
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: successColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.verified,
//                         size: 12,
//                         color: successColor,
//                       ),
//                       SizedBox(width: 4),
//                       Text(
//                         'Verified',
//                         style: GoogleFonts.inter(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w600,
//                           color: successColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAvatarFallback(String name) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [primaryColor, secondaryColor],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Center(
//         child: Text(
//           name.split(' ').map((n) => n[0]).take(2).join().toUpperCase(),
//           style: GoogleFonts.inter(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildUserStats(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 20 : 32),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [primaryColor, secondaryColor],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: isMobile
//           ? Column(
//               children: _buildStatItems(isMobile),
//             )
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: _buildStatItems(isMobile),
//             ),
//     );
//   }

//   List<Widget> _buildStatItems(bool isMobile) {
//     final stats = [
//       {'number': '50K+', 'label': 'Happy Users'},
//       {'number': '4.9', 'label': 'App Store Rating'},
//       {'number': '99%', 'label': 'Satisfaction Rate'},
//       {'number': '24/7', 'label': 'Support'},
//     ];

//     return stats
//         .map(
//           (stat) => Padding(
//             padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 0),
//             child: Column(
//               children: [
//                 Text(
//                   stat['number']!,
//                   style: GoogleFonts.inter(
//                     fontSize: isMobile ? 24 : 32,
//                     fontWeight: FontWeight.w800,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   stat['label']!,
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: Colors.white.withOpacity(0.9),
//                     fontWeight: FontWeight.w500,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         )
//         .toList();
//   }

//   List<Map<String, dynamic>> _getTestimonialsData() {
//     return [
//       {
//         'text':
//             'WalletLogs has completely transformed how I manage my finances. The insights are incredible and the interface is so intuitive.',
//         'name': 'Sarah Johnson',
//         'title': 'Marketing Director',
//         'rating': 5,
//         'verified': true,
//         'avatar': null,
//         'avatarGradient': [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
//       },
//       {
//         'text':
//             'I\'ve tried many wallet apps, but this one stands out. The security features give me peace of mind, and the analytics help me save more.',
//         'name': 'Michael Chen',
//         'title': 'Software Engineer',
//         'rating': 5,
//         'verified': true,
//         'avatar': null,
//         'avatarGradient': [Color(0xFF10B981), Color(0xFF059669)],
//       },
//       {
//         'text':
//             'The best financial app I\'ve ever used. Clean design, powerful features, and excellent customer support. Highly recommended!',
//         'name': 'Emily Rodriguez',
//         'title': 'Business Owner',
//         'rating': 5,
//         'verified': true,
//         'avatar': null,
//         'avatarGradient': [Color(0xFFF59E0B), Color(0xFFD97706)],
//       },
//       {
//         'text':
//             'Simple yet powerful. WalletLogs helps me track every transaction and understand my spending patterns better than ever.',
//         'name': 'David Kim',
//         'title': 'Financial Advisor',
//         'rating': 5,
//         'verified': true,
//         'avatar': null,
//         'avatarGradient': [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
//       },
//       {
//         'text':
//             'Outstanding app with great UX. The real-time sync across devices and the detailed reports are game-changers.',
//         'name': 'Lisa Wang',
//         'title': 'Product Manager',
//         'rating': 5,
//         'verified': false,
//         'avatar': null,
//         'avatarGradient': [Color(0xFFEF4444), Color(0xFFDC2626)],
//       },
//       {
//         'text':
//             'Secure, reliable, and feature-rich. WalletLogs has everything I need to manage my finances effectively.',
//         'name': 'Alex Thompson',
//         'title': 'Entrepreneur',
//         'rating': 5,
//         'verified': true,
//         'avatar': null,
//         'avatarGradient': [Color(0xFF06B6D4), Color(0xFF0891B2)],
//       },
//     ];
//   }

// // ...existing code...

//   Widget _buildDownloadSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['download'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: isMobile ? 60 : 120,
//       ),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             primaryColor.withOpacity(0.05),
//             accentColor.withOpacity(0.05),
//             backgroundColor,
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           // Section Header
//           Text(
//             'Ready to Transform Your Finances?',
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 32 : 48,
//               fontWeight: FontWeight.w800,
//               color: primaryText,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           const SizedBox(height: 16),

//           Text(
//             'Download WalletLogs today and join thousands of users who are already in control of their money',
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 16 : 20,
//               color: secondaryText,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           SizedBox(height: isMobile ? 40 : 60),

//           // Download Options
//           isMobile ? _buildDownloadMobile() : _buildDownloadDesktop(),

//           SizedBox(height: isMobile ? 40 : 60),

//           // Trust Badges
//           _buildTrustBadges(isMobile),
//         ],
//       ),
//     );
//   }

//   Widget _buildDownloadMobile() {
//     return Column(
//       children: [
//         _buildDownloadButton(
//           'Download for iOS',
//           Icons.phone_iphone,
//           'App Store',
//           () => _launchURL('https://apps.apple.com/app/walletlogs'),
//         ),
//         const SizedBox(height: 16),
//         _buildDownloadButton(
//           'Download for Android',
//           Icons.android,
//           'Google Play',
//           () => _launchURL(
//               'https://play.google.com/store/apps/details?id=com.nisanray.walletlogs'),
//         ),
//         const SizedBox(height: 16),
//         _buildDownloadButton(
//           'Use Web App',
//           Icons.web,
//           'Browser',
//           () => _launchURL('https://walletlogsweb.vercel.app'),
//         ),
//       ],
//     );
//   }

//   Widget _buildDownloadDesktop() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildDownloadButton(
//           'Download for iOS',
//           Icons.phone_iphone,
//           'App Store',
//           () => _launchURL('https://apps.apple.com/app/walletlogs'),
//         ),
//         const SizedBox(width: 20),
//         _buildDownloadButton(
//           'Download for Android',
//           Icons.android,
//           'Google Play',
//           () => _launchURL(
//               'https://play.google.com/store/apps/details?id=com.nisanray.walletlogs'),
//         ),
//         const SizedBox(width: 20),
//         _buildDownloadButton(
//           'Use Web App',
//           Icons.web,
//           'Browser',
//           () => _launchURL('https://walletlogsweb.vercel.app'),
//         ),
//       ],
//     );
//   }

//   Widget _buildDownloadButton(
//       String title, IconData icon, String subtitle, VoidCallback onTap) {
//     return StatefulBuilder(
//       builder: (context, setState) {
//         bool isHovered = false;

//         return MouseRegion(
//           onEnter: (_) => setState(() => isHovered = true),
//           onExit: (_) => setState(() => isHovered = false),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
//             decoration: BoxDecoration(
//               gradient: isHovered ? heroGradient : cardGradient,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(
//                 color: isHovered
//                     ? Colors.transparent
//                     : primaryColor.withOpacity(0.2),
//                 width: 2,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: (isHovered ? primaryColor : Colors.black)
//                       .withOpacity(isHovered ? 0.3 : 0.05),
//                   blurRadius: isHovered ? 20 : 10,
//                   offset: Offset(0, isHovered ? 10 : 5),
//                 ),
//               ],
//             ),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: onTap,
//                 borderRadius: BorderRadius.circular(16),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         icon,
//                         size: 32,
//                         color: isHovered ? Colors.white : primaryColor,
//                       ),
//                       const SizedBox(width: 16),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             title,
//                             style: GoogleFonts.inter(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: isHovered ? Colors.white : primaryText,
//                             ),
//                           ),
//                           Text(
//                             subtitle,
//                             style: GoogleFonts.inter(
//                               fontSize: 14,
//                               color: isHovered
//                                   ? Colors.white.withOpacity(0.8)
//                                   : secondaryText,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildTrustBadges(bool isMobile) {
//     return Column(
//       children: [
//         Text(
//           'Trusted & Secure',
//           style: GoogleFonts.inter(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: primaryText,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Wrap(
//           spacing: 24,
//           runSpacing: 16,
//           alignment: WrapAlignment.center,
//           children: [
//             _buildTrustBadge('🔒', 'Bank-Level\nSecurity'),
//             _buildTrustBadge('⭐', '4.9/5 Stars\nApp Store'),
//             _buildTrustBadge('🏆', 'Editor\'s\nChoice'),
//             _buildTrustBadge('🚀', '15K+ Happy\nUsers'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildTrustBadge(String emoji, String text) {
//     return Column(
//       children: [
//         Text(emoji, style: const TextStyle(fontSize: 32)),
//         const SizedBox(height: 8),
//         Text(
//           text,
//           style: GoogleFonts.inter(
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//             color: secondaryText,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }

//   Widget _buildFooter(Size screenSize, bool isMobile) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: isMobile ? 40 : 80,
//       ),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [backgroundColor, Color(0xFFF0F0F0)],
//         ),
//       ),
//       child: Column(
//         children: [
//           // Footer Content
//           isMobile ? _buildFooterMobile() : _buildFooterDesktop(),

//           const SizedBox(height: 40),

//           // Divider
//           Container(
//             height: 1,
//             color: Colors.grey.withOpacity(0.2),
//           ),

//           const SizedBox(height: 24),

//           // Footer Bottom
//           isMobile ? _buildFooterBottomMobile() : _buildFooterBottomDesktop(),
//         ],
//       ),
//     );
//   }

//   Widget _buildFooterMobile() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Logo and Description
//         _buildFooterBrand(),
//         const SizedBox(height: 32),

//         // Links Columns
//         _buildFooterColumn('Product',
//             ['Features', 'Pricing', 'Security', 'API', 'Integrations']),
//         const SizedBox(height: 24),

//         _buildFooterColumn(
//             'Company', ['About Us', 'Careers', 'Blog', 'Press', 'Contact']),
//         const SizedBox(height: 24),

//         _buildFooterColumn('Support',
//             ['Help Center', 'Documentation', 'Community', 'Status', 'Privacy']),
//         const SizedBox(height: 24),

//         _buildFooterColumn('Legal',
//             ['Terms of Service', 'Privacy Policy', 'Cookie Policy', 'GDPR']),
//       ],
//     );
//   }

//   Widget _buildFooterDesktop() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Logo and Description
//         Expanded(
//           flex: 2,
//           child: _buildFooterBrand(),
//         ),

//         const SizedBox(width: 60),

//         // Links Columns
//         Expanded(
//             child: _buildFooterColumn('Product',
//                 ['Features', 'Pricing', 'Security', 'API', 'Integrations'])),

//         const SizedBox(width: 40),

//         Expanded(
//             child: _buildFooterColumn('Company',
//                 ['About Us', 'Careers', 'Blog', 'Press', 'Contact'])),

//         const SizedBox(width: 40),

//         Expanded(
//             child: _buildFooterColumn('Support', [
//           'Help Center',
//           'Documentation',
//           'Community',
//           'Status',
//           'Privacy'
//         ])),

//         const SizedBox(width: 40),

//         Expanded(
//             child: _buildFooterColumn('Legal', [
//           'Terms of Service',
//           'Privacy Policy',
//           'Cookie Policy',
//           'GDPR'
//         ])),
//       ],
//     );
//   }

//   Widget _buildFooterBrand() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Logo
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 32,
//               height: 32,
//               decoration: BoxDecoration(
//                 gradient: heroGradient,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Icon(
//                 Icons.account_balance_wallet,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Text(
//               'WalletLogs',
//               style: GoogleFonts.inter(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w800,
//                 color: primaryText,
//               ),
//             ),
//           ],
//         ),

//         const SizedBox(height: 16),

//         // Description
//         Text(
//           'Take control of your financial future with smart expense tracking, budget management, and financial insights all in one beautiful app.',
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             color: secondaryText,
//             height: 1.5,
//           ),
//         ),

//         const SizedBox(height: 20),

//         // Social Links
//         Row(
//           children: [
//             _buildSocialButton(Icons.facebook,
//                 () => _launchURL('https://facebook.com/walletlogs')),
//             const SizedBox(width: 12),
//             _buildSocialButton(
//                 Icons.link, () => _launchURL('https://twitter.com/walletlogs')),
//             const SizedBox(width: 12),
//             _buildSocialButton(Icons.business,
//                 () => _launchURL('https://linkedin.com/company/walletlogs')),
//             const SizedBox(width: 12),
//             _buildSocialButton(
//                 Icons.email, () => _launchURL('mailto:hello@walletlogs.com')),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildFAQsSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['faqs'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: 80,
//       ),
//       child: Column(
//         children: [
//           _buildSectionHeader(
//             'Frequently Asked Questions',
//             'Got questions? We\'ve got answers. Here are some of the most common questions about WalletLogs.',
//             isMobile,
//           ),
//           const SizedBox(height: 60),
//           Container(
//             constraints:
//                 BoxConstraints(maxWidth: isMobile ? double.infinity : 800),
//             child: _buildFAQList(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFAQList() {
//     final faqs = [
//       {
//         'question': 'Is WalletLogs free to use?',
//         'answer':
//             'Yes! WalletLogs offers a free plan that includes basic expense tracking, budgeting, and financial insights. Premium features are available with our paid plans starting at just \$4.99/month.',
//       },
//       {
//         'question': 'How secure is my financial data?',
//         'answer':
//             'Your security is our top priority. We use bank-level 256-bit SSL encryption, secure servers, and never store your banking credentials. All data is encrypted both in transit and at rest. We\'re also SOC 2 Type II compliant.',
//       },
//       {
//         'question': 'Can I connect multiple bank accounts?',
//         'answer':
//             'Absolutely! You can connect multiple bank accounts, credit cards, and investment accounts to get a complete view of your finances in one place. We support over 10,000+ financial institutions.',
//       },
//       {
//         'question': 'Does WalletLogs work on all devices?',
//         'answer':
//             'Yes, WalletLogs is available on iOS, Android, and as a web application. Your data syncs seamlessly across all your devices in real-time, so you can manage your finances anywhere.',
//       },
//       {
//         'question': 'Can I export my data?',
//         'answer':
//             'Yes, you can export your transaction data, budgets, and reports in various formats including CSV, PDF, and Excel at any time. You own your data and can take it with you whenever you want.',
//       },
//       {
//         'question': 'How accurate is the expense categorization?',
//         'answer':
//             'Our AI-powered categorization is 95% accurate and learns from your preferences over time. You can always manually adjust categories, and the system will remember your preferences for future transactions.',
//       },
//       {
//         'question': 'Do you offer customer support?',
//         'answer':
//             'Yes! We provide 24/7 customer support via email and live chat. Premium users also get priority support and phone support during business hours.',
//       },
//       {
//         'question': 'Can I set up budget alerts?',
//         'answer':
//             'Absolutely! You can set up custom budget alerts and notifications to help you stay on track. Get notified when you\'re approaching your budget limits or when unusual spending is detected.',
//       },
//     ];

//     return Column(
//       children: [
//         for (int i = 0; i < faqs.length; i++) ...[
//           _buildFAQItem(faqs[i]['question']!, faqs[i]['answer']!, i),
//           if (i < faqs.length - 1) const SizedBox(height: 12),
//         ],
//       ],
//     );
//   }

//   Widget _buildFAQItem(String question, String answer, int index) {
//     return Container(
//       decoration: BoxDecoration(
//         color: surfaceColor,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Theme(
//           data: Theme.of(context).copyWith(
//             dividerColor: Colors.transparent,
//             splashColor: primaryColor.withOpacity(0.1),
//             highlightColor: primaryColor.withOpacity(0.05),
//           ),
//           child: ExpansionTile(
//             tilePadding:
//                 const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//             childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
//             expansionAnimationStyle: AnimationStyle(
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//             ),
//             title: Text(
//               question,
//               style: GoogleFonts.inter(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: primaryText,
//                 height: 1.4,
//               ),
//             ),
//             trailing: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: primaryColor.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(
//                 Icons.keyboard_arrow_down,
//                 color: primaryColor,
//                 size: 20,
//               ),
//             ),
//             children: [
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.only(top: 8),
//                 child: Text(
//                   answer,
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: secondaryText,
//                     height: 1.6,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAboutTeamSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['about-team'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: 80,
//       ),
//       decoration: const BoxDecoration(
//         color: backgroundColor,
//       ),
//       child: Column(
//         children: [
//           _buildSectionHeader(
//             'Meet Our Team',
//             'The passionate people behind WalletLogs who are dedicated to transforming your financial journey.',
//             isMobile,
//           ),
//           const SizedBox(height: 60),
//           if (isMobile) _buildMobileTeamGrid() else _buildDesktopTeamGrid(),
//         ],
//       ),
//     );
//   }

//   Widget _buildMobileTeamGrid() {
//     return Column(
//       children: [
//         // for (int i = 0; i < ; i += 2)
//         Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(child: _buildTeamMember(0)),
//                 const SizedBox(width: 20),
//                 const Expanded(child: SizedBox()),
//                 // Expanded(child: _buildTeamMember(i)),
//                 // const SizedBox(width: 20),
//                 // if (i + 1 < 4) Expanded(child: _buildTeamMember(i + 1)),
//                 // if (i + 1 >= 4) const Expanded(child: SizedBox()),
//               ],
//             ),
//             // if (i < 2) const SizedBox(height: 30),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildDesktopTeamGrid() {
//     return Row(
//       children: [
//         for (int i = 0; i < 1; i++) ...[
//           Expanded(child: _buildTeamMember(i)),
//           if (i < 3) const SizedBox(width: 30),
//         ],
//       ],
//     );
//   }

//   Widget _buildTeamMember(int index) {
//     final teamMembers = [
//       {
//         'name': 'Nisan Ray',
//         'role': 'CEO & Founder',
//         'bio': 'Former analyst with 10+ years in fintech',
//         'color': primaryColor,
//       },
//       {
//         'name': 'Sarah Johnson',
//         'role': 'CEO & Founder',
//         'bio': 'Former Goldman Sachs analyst with 10+ years in fintech',
//         'color': primaryColor,
//       },
//       {
//         'name': 'Michael Chen',
//         'role': 'CTO',
//         'bio': 'Ex-Google engineer passionate about financial technology',
//         'color': secondaryColor,
//       },
//       {
//         'name': 'Emily Rodriguez',
//         'role': 'Head of Design',
//         'bio': 'Award-winning UX designer from Apple and Airbnb',
//         'color': accentColor,
//       },
//       {
//         'name': 'David Kim',
//         'role': 'Head of Product',
//         'bio': 'Product leader who shipped features used by millions',
//         'color': successColor,
//       },
//     ];

//     final member = teamMembers[index];

//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: surfaceColor,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Avatar
//           Container(
//             width: 80,
//             height: 80,
//             decoration: BoxDecoration(
//               color: member['color'] as Color,
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: Text(
//                 (member['name'] as String).split(' ').map((n) => n[0]).join(),
//                 style: GoogleFonts.inter(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 16),

//           Text(
//             member['name'] as String,
//             style: GoogleFonts.inter(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: primaryText,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           const SizedBox(height: 8),

//           Text(
//             member['role'] as String,
//             style: GoogleFonts.inter(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: member['color'] as Color,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           const SizedBox(height: 12),

//           Text(
//             member['bio'] as String,
//             style: GoogleFonts.inter(
//               fontSize: 14,
//               color: secondaryText,
//               height: 1.4,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

// // ...existing code...

//   Widget _buildScreenshotsSection(Size screenSize, bool isMobile) {
//     return Container(
//       key: _sectionKeys['screenshots'],
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: isMobile ? 60 : 120,
//       ),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.white,
//             Color(0xFFF8FAFC), // slate-50
//             Colors.white,
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           // Section Header - Use the same pattern as other sections
//           _buildSectionHeader(
//             'See It In Action',
//             'Experience the power and simplicity of WalletLogs through our intuitive interface',
//             isMobile,
//           ),

//           SizedBox(height: isMobile ? 40 : 80),

//           // Screenshots Grid/Carousel
//           _buildScreenshotsGrid(isMobile, screenSize),

//           SizedBox(height: isMobile ? 40 : 60),

//           // Feature Highlights
//           _buildFeatureHighlights(isMobile),

//           SizedBox(height: isMobile ? 40 : 60),

//           // Demo CTA
//           _buildDemoCTA(isMobile),
//         ],
//       ),
//     );
//   }

//   Widget _buildScreenshotsGrid(bool isMobile, Size screenSize) {
//     final screenshots = _getScreenshotsData();

//     if (isMobile) {
//       return Column(
//         children: [
//           // Mobile: Show screenshots in a vertical scrollable list
//           Container(
//             height: 400,
//             child: PageView.builder(
//               itemCount: screenshots.length,
//               controller: PageController(viewportFraction: 0.85),
//               itemBuilder: (context, index) {
//                 return TweenAnimationBuilder<double>(
//                   duration: Duration(milliseconds: 600 + (index * 200)),
//                   tween: Tween(begin: 0.0, end: 1.0),
//                   builder: (context, value, child) {
//                     return Transform.translate(
//                       offset: Offset(0, 30 * (1 - value)),
//                       child: Opacity(
//                         opacity: value,
//                         child: Container(
//                           margin: EdgeInsets.symmetric(horizontal: 8),
//                           child: _buildScreenshotCard(
//                               screenshots[index], isMobile),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),

//           SizedBox(height: 20),

//           // Page Indicators
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               screenshots.length,
//               (index) => Container(
//                 margin: EdgeInsets.symmetric(horizontal: 4),
//                 width: 8,
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: primaryColor.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     }

//     // Desktop: Use a grid layout with featured screenshot
//     return Column(
//       children: [
//         // Featured Screenshot (Center)
//         Container(
//           constraints: BoxConstraints(maxWidth: 800),
//           child: _buildFeaturedScreenshot(screenshots[0]),
//         ),

//         SizedBox(height: 40),

//         // Grid of smaller screenshots
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: screenSize.width > 1200 ? 4 : 3,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//             childAspectRatio: 0.6,
//           ),
//           itemCount: screenshots.length - 1,
//           itemBuilder: (context, index) {
//             return TweenAnimationBuilder<double>(
//               duration: Duration(milliseconds: 800 + (index * 100)),
//               tween: Tween(begin: 0.0, end: 1.0),
//               builder: (context, value, child) {
//                 return Transform.translate(
//                   offset: Offset(0, 20 * (1 - value)),
//                   child: Opacity(
//                     opacity: value,
//                     child: _buildScreenshotCard(screenshots[index + 1], false),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildFeaturedScreenshot(Map<String, dynamic> screenshot) {
//     return Container(
//       padding: EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 30,
//             offset: Offset(0, 15),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Phone mockup container
//           Container(
//             width: 300,
//             height: 600,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 20,
//                   offset: Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Container(
//               margin: EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(26),
//                 image: DecorationImage(
//                   image: NetworkImage(screenshot['image'] ?? ''),
//                   fit: BoxFit.cover,
//                   onError: (error, stackTrace) {},
//                 ),
//               ),
//               child: screenshot['image'] == null
//                   ? _buildScreenshotPlaceholder(screenshot, false)
//                   : null,
//             ),
//           ),

//           SizedBox(height: 24),

//           Text(
//             screenshot['title'],
//             style: GoogleFonts.inter(
//               fontSize: 20,
//               fontWeight: FontWeight.w700,
//               color: primaryText,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           SizedBox(height: 12),

//           Text(
//             screenshot['description'],
//             style: GoogleFonts.inter(
//               fontSize: 16,
//               color: secondaryText,
//               height: 1.5,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildScreenshotCard(Map<String, dynamic> screenshot, bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 16 : 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
//             offset: Offset(0, 8),
//           ),
//         ],
//         border: Border.all(
//           color: Color(0xFFE2E8F0),
//           width: 1,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Phone mockup
//           Container(
//             width: isMobile ? 120 : 150,
//             height: isMobile ? 240 : 300,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   blurRadius: 10,
//                   offset: Offset(0, 5),
//                 ),
//               ],
//             ),
//             child: Container(
//               margin: EdgeInsets.all(3),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(17),
//                 image: screenshot['image'] != null
//                     ? DecorationImage(
//                         image: NetworkImage(screenshot['image']),
//                         fit: BoxFit.cover,
//                         onError: (error, stackTrace) {},
//                       )
//                     : null,
//               ),
//               child: screenshot['image'] == null
//                   ? _buildScreenshotPlaceholder(screenshot, isMobile)
//                   : null,
//             ),
//           ),

//           SizedBox(height: isMobile ? 12 : 16),

//           // Title
//           Text(
//             screenshot['title'],
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 14 : 16,
//               fontWeight: FontWeight.w600,
//               color: primaryText,
//             ),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),

//           if (!isMobile) ...[
//             SizedBox(height: 8),
//             Text(
//               screenshot['description'],
//               style: GoogleFonts.inter(
//                 fontSize: 12,
//                 color: secondaryText,
//                 height: 1.4,
//               ),
//               textAlign: TextAlign.center,
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildScreenshotPlaceholder(
//       Map<String, dynamic> screenshot, bool isMobile) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: screenshot['gradient'] as List<Color>,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(17),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             screenshot['icon'] as IconData,
//             size: isMobile ? 40 : 60,
//             color: Colors.white,
//           ),
//           SizedBox(height: 16),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               screenshot['title'],
//               style: GoogleFonts.inter(
//                 fontSize: isMobile ? 12 : 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureHighlights(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 20 : 32),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             primaryColor.withOpacity(0.05),
//             secondaryColor.withOpacity(0.05)
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: primaryColor.withOpacity(0.1),
//         ),
//       ),
//       child: isMobile
//           ? Column(
//               children: _buildHighlightItems(isMobile),
//             )
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: _buildHighlightItems(isMobile),
//             ),
//     );
//   }

//   List<Widget> _buildHighlightItems(bool isMobile) {
//     final highlights = [
//       {'icon': Icons.phone_iphone, 'text': 'Native Mobile Experience'},
//       {'icon': Icons.speed, 'text': 'Lightning Fast Performance'},
//       {'icon': Icons.security, 'text': 'Bank-Level Security'},
//       {'icon': Icons.sync, 'text': 'Real-time Synchronization'},
//     ];

//     return highlights
//         .map(
//           (highlight) => Padding(
//             padding: EdgeInsets.symmetric(vertical: isMobile ? 8 : 0),
//             child: Row(
//               mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
//               children: [
//                 Icon(
//                   highlight['icon'] as IconData,
//                   color: primaryColor,
//                   size: 20,
//                 ),
//                 SizedBox(width: 8),
//                 Text(
//                   highlight['text'] as String,
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: primaryText,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//         .toList();
//   }

//   Widget _buildDemoCTA(bool isMobile) {
//     return Container(
//       padding: EdgeInsets.all(isMobile ? 24 : 32),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [primaryColor, secondaryColor],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           Text(
//             'Ready to Experience WalletLogs?',
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 20 : 24,
//               fontWeight: FontWeight.w700,
//               color: Colors.white,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 12),
//           Text(
//             'Join thousands of users who have transformed their financial management',
//             style: GoogleFonts.inter(
//               fontSize: 16,
//               color: Colors.white.withOpacity(0.9),
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 24),
//           isMobile
//               ? Column(
//                   children: [
//                     _buildCTAButton('Start Free Trial', Icons.play_arrow, true),
//                     SizedBox(height: 12),
//                     _buildCTAButton(
//                         'Watch Demo', Icons.play_circle_outline, false),
//                   ],
//                 )
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildCTAButton('Start Free Trial', Icons.play_arrow, true),
//                     SizedBox(width: 16),
//                     _buildCTAButton(
//                         'Watch Demo', Icons.play_circle_outline, false),
//                   ],
//                 ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCTAButton(String text, IconData icon, bool isPrimary) {
//     return ElevatedButton.icon(
//       onPressed: () {},
//       icon: Icon(icon, size: 18),
//       label: Text(text),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isPrimary ? Colors.white : Colors.transparent,
//         foregroundColor: isPrimary ? primaryColor : Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//           side: isPrimary ? BorderSide.none : BorderSide(color: Colors.white),
//         ),
//         elevation: isPrimary ? 2 : 0,
//       ),
//     );
//   }

//   List<Map<String, dynamic>> _getScreenshotsData() {
//     return [
//       {
//         'title': 'Dashboard Overview',
//         'description':
//             'Get a complete view of your financial health at a glance',
//         'image': null, // Replace with actual image URLs
//         'icon': Icons.dashboard,
//         'gradient': [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
//       },
//       {
//         'title': 'Transaction History',
//         'description':
//             'Detailed transaction tracking with smart categorization',
//         'image': null,
//         'icon': Icons.history,
//         'gradient': [Color(0xFF10B981), Color(0xFF059669)],
//       },
//       {
//         'title': 'Budget Planning',
//         'description': 'Set and track budgets with intelligent insights',
//         'image': null,
//         'icon': Icons.pie_chart,
//         'gradient': [Color(0xFFF59E0B), Color(0xFFD97706)],
//       },
//       {
//         'title': 'Analytics & Reports',
//         'description': 'Comprehensive financial analytics and reporting',
//         'image': null,
//         'icon': Icons.analytics,
//         'gradient': [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
//       },
//       {
//         'title': 'Security Settings',
//         'description': 'Advanced security features to protect your data',
//         'image': null,
//         'icon': Icons.security,
//         'gradient': [Color(0xFFEF4444), Color(0xFFDC2626)],
//       },
//     ];
//   }

// // ...existing code...

//   Widget _buildMobileScreenshots() {
//     final screenshots = _getScreenshotsData();
//     return SizedBox(
//       height: 400,
//       child: PageView.builder(
//         itemCount: screenshots.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: _buildScreenshotCard(screenshots[index], true),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDesktopScreenshots() {
//     final screenshots = _getScreenshotsData();
//     return Row(
//       children: [
//         Expanded(child: _buildScreenshotCard(screenshots[0], false)),
//         const SizedBox(width: 20),
//         Expanded(child: _buildScreenshotCard(screenshots[1], false)),
//         const SizedBox(width: 20),
//         Expanded(child: _buildScreenshotCard(screenshots[2], false)),
//         const SizedBox(width: 20),
//         Expanded(child: _buildScreenshotCard(screenshots[3], false)),
//       ],
//     );
//   }

//   Widget _buildVideoDemo(bool isMobile) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(32),
//       decoration: BoxDecoration(
//         gradient: heroGradient,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           Text(
//             'Watch WalletLogs in Action',
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 24 : 32,
//               fontWeight: FontWeight.w700,
//               color: Colors.white,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'See how easy it is to manage your finances with our 2-minute demo video',
//             style: GoogleFonts.inter(
//               fontSize: 16,
//               color: Colors.white70,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 32),

//           // Video thumbnail/placeholder
//           Container(
//             width: isMobile ? double.infinity : 600,
//             height: isMobile ? 200 : 300,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Stack(
//               children: [
//                 Center(
//                   child: Container(
//                     width: 80,
//                     height: 80,
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.9),
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.play_arrow,
//                       size: 40,
//                       color: primaryColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSocialButton(IconData icon, VoidCallback onTap) {
//     return StatefulBuilder(
//       builder: (context, setState) {
//         bool isHovered = false;

//         return MouseRegion(
//           onEnter: (_) => setState(() => isHovered = true),
//           onExit: (_) => setState(() => isHovered = false),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               gradient: isHovered ? heroGradient : null,
//               color: isHovered ? null : mutedText.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: onTap,
//                 borderRadius: BorderRadius.circular(10),
//                 child: Icon(
//                   icon,
//                   size: 20,
//                   color: isHovered ? Colors.white : mutedText,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildFooterColumn(String title, List<String> links) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.inter(
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//             color: primaryText,
//           ),
//         ),
//         const SizedBox(height: 16),
//         ...links.map((link) => Container(
//               margin: const EdgeInsets.only(bottom: 8),
//               child: InkWell(
//                 onTap: () => _launchURL(
//                     'https://walletlogs.com/${link.toLowerCase().replaceAll(' ', '-')}'),
//                 child: Text(
//                   link,
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: secondaryText,
//                     height: 1.5,
//                   ),
//                 ),
//               ),
//             )),
//       ],
//     );
//   }

//   Widget _buildFooterBottomMobile() {
//     return Column(
//       children: [
//         Text(
//           '© 2024 WalletLogs. All rights reserved.',
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             color: mutedText,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 12),
//         Text(
//           'Made with ❤️ by Nisan Ray',
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             color: mutedText,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }

//   Widget _buildFooterBottomDesktop() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           '© 2024 WalletLogs. All rights reserved.',
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             color: mutedText,
//           ),
//         ),
//         Text(
//           'Made with ❤️ by Nisan Ray',
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             color: mutedText,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFloatingActionButton() {
//     return AnimatedBuilder(
//       animation: _scrollController,
//       builder: (context, child) {
//         return Positioned(
//           bottom: 30,
//           right: 30,
//           child: Transform.scale(
//             scale: _scrollController.value,
//             child: Opacity(
//               opacity: _scrollController.value,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: heroGradient,
//                   borderRadius: BorderRadius.circular(28),
//                   boxShadow: [
//                     BoxShadow(
//                       color: primaryColor.withOpacity(0.3),
//                       blurRadius: 15,
//                       offset: const Offset(0, 8),
//                     ),
//                   ],
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     onTap: () {
//                       _pageScrollController.animateTo(
//                         0,
//                         duration: const Duration(milliseconds: 800),
//                         curve: Curves.easeInOutCubic,
//                       );
//                     },
//                     borderRadius: BorderRadius.circular(28),
//                     child: const SizedBox(
//                       width: 56,
//                       height: 56,
//                       child: Icon(
//                         Icons.keyboard_arrow_up,
//                         color: Colors.white,
//                         size: 28,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Helper Methods
//   void _scrollToSection(String sectionKey) {
//     final key = _sectionKeys[sectionKey];
//     if (key?.currentContext != null) {
//       Scrollable.ensureVisible(
//         key!.currentContext!,
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeInOutCubic,
//       );
//     }
//   }

//   // void _showAuthDialog(bool isLogin) {
//   //   showDialog(
//   //     context: context,
//   //     barrierDismissible: true,
//   //     builder: (BuildContext context) {
//   //       return Dialog(
//   //         backgroundColor: Colors.transparent,
//   //         child: Container(
//   //           width:
//   //               MediaQuery.of(context).size.width > 600 ? 500 : double.infinity,
//   //           height: MediaQuery.of(context).size.height * 0.8,
//   //           child: ClipRRect(
//   //             borderRadius: BorderRadius.circular(20),
//   //             child: isLogin ? const LoginScreen() : const RegisterScreen(),
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }

//   // void _showAuthDialog(bool isLogin) {
//   //   showGeneralDialog(
//   //     context: context,
//   //     barrierDismissible: true,
//   //     barrierLabel: '',
//   //     barrierColor: Colors.black.withOpacity(0.5),
//   //     transitionDuration: const Duration(milliseconds: 300),
//   //     pageBuilder: (context, animation, secondaryAnimation) {
//   //       return ScaleTransition(
//   //         scale: CurvedAnimation(parent: animation, curve: Curves.elasticOut),
//   //         child: Dialog(
//   //           backgroundColor: Colors.transparent,
//   //           child: Container(
//   //             width: 400,
//   //             padding: const EdgeInsets.all(32),
//   //             decoration: BoxDecoration(
//   //               gradient: cardGradient,
//   //               borderRadius: BorderRadius.circular(20),
//   //               boxShadow: [
//   //                 BoxShadow(
//   //                   color: Colors.black.withOpacity(0.2),
//   //                   blurRadius: 30,
//   //                   offset: const Offset(0, 15),
//   //                 ),
//   //               ],
//   //             ),
//   //             child: Column(
//   //               mainAxisSize: MainAxisSize.min,
//   //               children: [
//   //                 Text(
//   //                   isLogin ? 'Welcome Back!' : 'Get Started Free',
//   //                   style: GoogleFonts.inter(
//   //                     fontSize: 24,
//   //                     fontWeight: FontWeight.w700,
//   //                     color: primaryText,
//   //                   ),
//   //                 ),

//   //                 const SizedBox(height: 8),

//   //                 Text(
//   //                   isLogin
//   //                       ? 'Sign in to your account'
//   //                       : 'Create your account in seconds',
//   //                   style: GoogleFonts.inter(
//   //                     fontSize: 16,
//   //                     color: secondaryText,
//   //                   ),
//   //                 ),

//   //                 const SizedBox(height: 32),

//   //                 // Auth form would go here
//   //                 Container(
//   //                   padding: const EdgeInsets.all(24),
//   //                   decoration: BoxDecoration(
//   //                     color: primaryColor.withOpacity(0.05),
//   //                     borderRadius: BorderRadius.circular(12),
//   //                   ),
//   //                   child: Column(
//   //                     children: [
//   //                       const Icon(
//   //                         Icons.construction,
//   //                         size: 48,
//   //                         color: primaryColor,
//   //                       ),
//   //                       const SizedBox(height: 16),
//   //                       Text(
//   //                         'Authentication UI Coming Soon!',
//   //                         style: GoogleFonts.inter(
//   //                           fontSize: 16,
//   //                           fontWeight: FontWeight.w600,
//   //                           color: primaryColor,
//   //                         ),
//   //                       ),
//   //                       const SizedBox(height: 8),
//   //                       Text(
//   //                         'This would integrate with your existing auth system',
//   //                         style: GoogleFonts.inter(
//   //                           fontSize: 14,
//   //                           color: secondaryText,
//   //                         ),
//   //                         textAlign: TextAlign.center,
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),

//   //                 const SizedBox(height: 24),

//   //                 Row(
//   //                   children: [
//   //                     Expanded(
//   //                       child: TextButton(
//   //                         onPressed: () => Navigator.pop(context),
//   //                         child: Text(
//   //                           'Cancel',
//   //                           style: GoogleFonts.inter(
//   //                             fontSize: 16,
//   //                             color: mutedText,
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     const SizedBox(width: 16),
//   //                     Expanded(
//   //                       child: _buildGradientButton(
//   //                         isLogin ? 'Sign In' : 'Sign Up',
//   //                         true,
//   //                         () => Navigator.pop(context),
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }

//   void _launchURL(String url) {
//     // In a real app, use url_launcher package
//     debugPrint('Would launch: $url');
//     // launch(url);
//   }

//   Widget _buildSectionHeader(String title, String subtitle, bool isMobile) {
//     return Column(
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.inter(
//             fontSize: isMobile ? 32 : 48,
//             fontWeight: FontWeight.w900,
//             color: primaryText,
//             height: 1.2,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 16),
//         Container(
//           constraints:
//               BoxConstraints(maxWidth: isMobile ? double.infinity : 600),
//           child: Text(
//             subtitle,
//             style: GoogleFonts.inter(
//               fontSize: isMobile ? 16 : 18,
//               color: secondaryText,
//               height: 1.6,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Custom Painters
// class ParticleBackgroundPainter extends CustomPainter {
//   final Animation<double> animation;
//   final Animation<double> glowAnimation;

//   ParticleBackgroundPainter({
//     required this.animation,
//     required this.glowAnimation,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..style = PaintingStyle.fill;

//     // Draw animated particles
//     for (int i = 0; i < 50; i++) {
//       final progress = (animation.value + (i * 0.02)) % 1.0;
//       final x = (i % 10) * (size.width / 10) +
//           (20 * math.sin(progress * 2 * math.pi));
//       final y = progress * size.height;

//       final opacity =
//           (0.5 - (progress - 0.5).abs()) * 0.3 * glowAnimation.value;

//       paint.color = Color.lerp(
//         const Color(0xFF6366F1),
//         const Color(0xFF06B6D4),
//         progress,
//       )!
//           .withOpacity(opacity);

//       canvas.drawCircle(
//         Offset(x, y),
//         2 + (i % 3),
//         paint,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

// class TrianglePainter extends CustomPainter {
//   final Color color;
//   final double glowIntensity;

//   TrianglePainter({required this.color, required this.glowIntensity});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     path.moveTo(size.width / 2, 0);
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.close();

//     // Add glow effect
//     paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 5 * glowIntensity);
//     canvas.drawPath(path, paint);

//     // Draw solid triangle
//     paint.maskFilter = null;
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
