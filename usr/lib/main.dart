import 'package:flutter/material.dart';

void main() {
  runApp(const IPVisionApp());
}

class IPVisionApp extends StatelessWidget {
  const IPVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPVision CCTV Security',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F2C59),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: NavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const ServicesSection(),
            const ProductsSection(),
            const WhyChooseUsSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// NAVIGATION BAR
// ==========================================
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;
    
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      shadowColor: Colors.black12,
      title: Row(
        children: [
          const Icon(Icons.security, color: Color(0xFF0F2C59), size: 32),
          const SizedBox(width: 12),
          const Text(
            'IPVision',
            style: TextStyle(
              color: Color(0xFF0F2C59),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 40),
            _navItem('Home'),
            _navItem('Products'),
            _navItem('Solutions'),
            _navItem('Contact'),
          ]
        ],
      ),
      actions: [
        if (!isMobile)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD80032), // Red accent for security
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Get a Quote'),
            ),
          ),
        if (isMobile)
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF0F2C59)),
            onPressed: () {
              // Menu action for mobile
            },
          ),
      ],
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// ==========================================
// HERO SECTION
// ==========================================
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : width * 0.1,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0F2C59),
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD80032).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Next-Gen Security',
                    style: TextStyle(
                      color: Color(0xFFFF4B4B),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Protect What Matters Most with Advanced CCTV.',
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 36 : 56,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'State-of-the-art IP cameras, NVRs, and AI-powered surveillance systems for homes and businesses. 24/7 monitoring you can trust.',
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: isMobile ? 16 : 20,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD80032),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('View Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Contact Sales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 40),
          if (!isMobile)
            Expanded(
              flex: 1,
              child: Center(
                child: Icon(
                  Icons.videocam,
                  size: 300,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ==========================================
// SERVICES SECTION
// ==========================================
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : width * 0.1,
        vertical: 80,
      ),
      child: Column(
        children: [
          const Text(
            'Complete Security Solutions',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F2C59),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'We provide end-to-end security camera installations and maintenance.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = constraints.maxWidth < 600 ? 1 : (constraints.maxWidth < 900 ? 2 : 3);
              return GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 1.2,
                children: [
                  _ServiceCard(icon: Icons.home_work, title: 'Commercial CCTV', description: 'Comprehensive coverage for offices, warehouses, and retail stores.'),
                  _ServiceCard(icon: Icons.house, title: 'Residential Security', description: 'Keep your home safe with smart IP cameras and doorbell monitors.'),
                  _ServiceCard(icon: Icons.cloud_upload, title: 'Cloud Storage', description: 'Secure 24/7 cloud recording with encrypted off-site backup.'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0F2C59).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 40, color: const Color(0xFF0F2C59)),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F2C59)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(color: Colors.black54, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ==========================================
// PRODUCTS SECTION
// ==========================================
class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : width * 0.1,
        vertical: 80,
      ),
      child: Column(
        children: [
          const Text(
            'Featured Cameras',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F2C59),
            ),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = constraints.maxWidth < 600 ? 1 : 2;
              return GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.0 : 1.5,
                children: [
                  _ProductCard(
                    title: 'IPVision Dome 4K',
                    specs: '4K Resolution • Night Vision • Vandal-proof',
                    icon: Icons.camera,
                  ),
                  _ProductCard(
                    title: 'IPVision Bullet Pro',
                    specs: 'Long Range • IP67 Weatherproof • AI Motion',
                    icon: Icons.camera_alt,
                  ),
                  _ProductCard(
                    title: 'IPVision PTZ 360',
                    specs: '360° Pan/Tilt • 30x Optical Zoom • Auto Tracking',
                    icon: Icons.photo_camera_front,
                  ),
                  _ProductCard(
                    title: 'Smart NVR Hub',
                    specs: '16 Channels • 8TB Storage • Remote App Access',
                    icon: Icons.storage,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final String specs;
  final IconData icon;

  const _ProductCard({required this.title, required this.specs, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 64, color: const Color(0xFFD80032)),
          const SizedBox(height: 24),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F2C59))),
          const SizedBox(height: 8),
          Text(specs, style: const TextStyle(color: Colors.black54, fontSize: 16)),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: const Color(0xFF0F2C59),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('View Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 18),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ==========================================
// WHY CHOOSE US
// ==========================================
class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Container(
      color: const Color(0xFF0F2C59),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : width * 0.1,
        vertical: 80,
      ),
      child: Column(
        children: [
          const Text(
            'Why Choose IPVision?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _Feature(icon: Icons.high_quality, title: 'Ultra HD Video'),
              _Feature(icon: Icons.phone_android, title: 'Mobile Viewing'),
              _Feature(icon: Icons.nightlight_round, title: 'Color Night Vision'),
              _Feature(icon: Icons.support_agent, title: '24/7 Support'),
            ],
          )
        ],
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final IconData icon;
  final String title;

  const _Feature({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ==========================================
// FOOTER
// ==========================================
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF08162C), // Darker shade for footer
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      width: double.infinity,
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.security, color: Colors.white70, size: 24),
              SizedBox(width: 8),
              Text(
                'IPVision',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            '© 2026 IPVision Security Systems. All rights reserved.',
            style: TextStyle(color: Colors.white54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
