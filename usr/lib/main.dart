import 'package:flutter/material.dart';

void main() {
  runApp(const IPVisionApp());
}

class IPVisionApp extends StatelessWidget {
  const IPVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPVision',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
          headlineMedium: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          bodyLarge: TextStyle(color: Color(0xFF334155)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IPVisionHomePage(),
      },
    );
  }
}

class IPVisionHomePage extends StatelessWidget {
  const IPVisionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 768;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            const Icon(Icons.wifi_tethering, color: Colors.blueAccent, size: 32),
            const SizedBox(width: 8),
            Text(
              'IPVision',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.blueAccent.shade700,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        actions: isMobile
            ? [
                IconButton(icon: const Icon(Icons.menu, color: Colors.black87), onPressed: () {})
              ]
            : [
                _buildNavButton('Home'),
                _buildNavButton('Services'),
                _buildNavButton('About'),
                _buildNavButton('Contact'),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Get Started'),
                ),
                const SizedBox(width: 24),
              ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context, isMobile),
            _buildServicesSection(context, isMobile),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF334155), fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24.0 : 64.0,
        vertical: isMobile ? 64.0 : 120.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Secure & Intelligent\nIP Networking Solutions',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isMobile ? 36 : 56,
                  height: 1.1,
                ),
          ),
          const SizedBox(height: 24),
          Text(
            'IPVision provides next-generation connectivity and surveillance systems to empower your digital infrastructure. Fast, reliable, and secure.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: isMobile ? 16 : 20,
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Our Solutions'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  side: const BorderSide(color: Colors.blueAccent, width: 2),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Contact Sales'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24.0 : 64.0,
        vertical: 80.0,
      ),
      child: Column(
        children: [
          Text(
            'Our Core Services',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Everything you need for a modern network infrastructure.',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = 1;
              if (constraints.maxWidth > 900) {
                columns = 3;
              } else if (constraints.maxWidth > 600) {
                columns = 2;
              }
              
              final double spacing = 24.0;
              final double cardWidth = (constraints.maxWidth - (spacing * (columns - 1))) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  _buildServiceCard(
                    width: cardWidth,
                    icon: Icons.router,
                    title: 'Enterprise Networking',
                    description: 'High-speed routing and switching solutions built for scale.',
                  ),
                  _buildServiceCard(
                    width: cardWidth,
                    icon: Icons.security,
                    title: 'IP Security Cameras',
                    description: 'Crystal clear surveillance with cloud storage and AI detection.',
                  ),
                  _buildServiceCard(
                    width: cardWidth,
                    icon: Icons.cloud_sync,
                    title: 'Cloud Integration',
                    description: 'Seamlessly connect your local infrastructure to the cloud.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required double width,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blueAccent, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_tethering, color: Colors.blueAccent, size: 24),
              SizedBox(width: 8),
              Text(
                'IPVision',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            '© 2026 IPVision Networks. All rights reserved.',
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
