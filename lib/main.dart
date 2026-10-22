
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusConnectApp());
}

const Color primaryBlue = Color(0xFF4055C5);
const Color lightBackground = Color(0xFFF7F6FC);

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: lightBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Campus Connect',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF4055C5),
                        Color(0xFF858FF0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: primaryBlue.withValues(alpha: 0.20),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 47,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/mee.jpeg'),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Welcome to Profile Card',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Connect • Learn • Grow',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),

                MenuCard(
                  icon: Icons.code_rounded,
                  title: 'Skills',
                  subtitle: 'Explore my technical and personal skills',
                  onTap: () => openPage(context, const SkillsPage()),
                ),
                const SizedBox(height: 13),

                MenuCard(
                  icon: Icons.school_rounded,
                  title: 'Qualification',
                  subtitle: 'Education and college details',
                  onTap: () =>
                      openPage(context, const QualificationPage()),
                ),
                const SizedBox(height: 13),

                MenuCard(
                  icon: Icons.contact_mail_rounded,
                  title: 'Contact Us',
                  subtitle: 'Email and contact information',
                  onTap: () => openPage(context, const ContactPage()),
                ),
                const SizedBox(height: 13),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        openPage(context, const ProfilePage()),
                    icon: const Icon(Icons.account_circle_rounded),
                    label: const Text(
                      'Go to Profile',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
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

// Reusable menu card

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 10,
        ),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFECEEFF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: primaryBlue, size: 27),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 17,
          color: primaryBlue,
        ),
      ),
    );
  }
}

// SKILLS PAGE

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  static const List<Map<String, dynamic>> skills = [
    {'name': 'Python', 'icon': Icons.terminal},
    {'name': 'C Programming', 'icon': Icons.code},
    {'name': 'HTML', 'icon': Icons.language},
    {'name': 'CSS', 'icon': Icons.palette_outlined},
    {'name': 'JavaScript', 'icon': Icons.javascript},
    {'name': 'Communication Skills', 'icon': Icons.groups_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      title: 'My Skills',
      child: Column(
        children: [
          const Icon(
            Icons.workspace_premium_rounded,
            color: primaryBlue,
            size: 75,
          ),
          const SizedBox(height: 12),
          const Text(
            'My Skills',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Skills I am learning and developing',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 25),
          ...skills.map(
            (skill) => Container(
              margin: const EdgeInsets.only(bottom: 13),
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE4E6F5)),
              ),
              child: Row(
                children: [
                  Icon(
                    skill['icon'] as IconData,
                    color: primaryBlue,
                    size: 27,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      skill['name'] as String,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// QUALIFICATION PAGE

class QualificationPage extends StatelessWidget {
  const QualificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      title: 'Qualification',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 47,
              backgroundColor: Color(0xFFE9EBFF),
              child: Icon(
                Icons.school_rounded,
                color: primaryBlue,
                size: 55,
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Education',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: primaryBlue,
            ),
          ),
          const SizedBox(height: 22),
          const InfoTile(
            icon: Icons.workspace_premium_outlined,
            label: 'Degree',
            value: 'Bachelor of Technology (B.Tech)',
          ),
          const InfoTile(
            icon: Icons.calendar_month_outlined,
            label: 'Year',
            value: 'III Year',
          ),
          const InfoTile(
            icon: Icons.computer_outlined,
            label: 'Branch',
            value: 'Artificial Intelligence and Data Science',
          ),
          const InfoTile(
            icon: Icons.account_balance_outlined,
            label: 'College',
            value:
                "Malineni Lakshmaiah Women's Engineering College",
          ),
        ],
      ),
    );
  }
}

// CONTACT PAGE

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      title: 'Contact Us',
      child: Column(
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundColor: Color(0xFFE9EBFF),
            child: Icon(
              Icons.contact_mail_rounded,
              size: 52,
              color: primaryBlue,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Contact Information',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Feel free to contact me.',
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          const SizedBox(height: 30),
          const InfoTile(
            icon: Icons.phone_outlined,
            label: 'Phone Number',
            value: 'XXXXXXXXXX',
          ),
          const InfoTile(
            icon: Icons.email_outlined,
            label: 'Email Address',
            value: 'polisettisowmya8@gmail.com',
          ),
        ],
      ),
    );
  }
}

// FULL PROFILE PAGE

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const List<String> skills = [
    'Python',
    'C Programming',
    'HTML',
    'CSS',
    'JavaScript',
    'Communication Skills',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.07),
                    blurRadius: 18,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 125,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF4055C5),
                          Color(0xFF8A96F2),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -58),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Color(0xFFE9EBFF),
                                backgroundImage:
                                    AssetImage('assets/mee.jpeg'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Polisetti Sowmya',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF25243A),
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'B.Tech Student | III Year',
                              style: TextStyle(
                                color: primaryBlue,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 15),
                          const InfoTile(
                            icon: Icons.school_outlined,
                            label: 'Qualification',
                            value: 'B.Tech - III Year',
                          ),
                          const InfoTile(
                            icon: Icons.computer_outlined,
                            label: 'Branch',
                            value:
                                'Artificial Intelligence and Data Science',
                          ),
                          const InfoTile(
                            icon: Icons.account_balance_outlined,
                            label: 'College',
                            value:
                                "Malineni Lakshmaiah Women's Engineering College",
                          ),
                          const SizedBox(height: 22),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'My Skills',
                              style: TextStyle(
                                color: primaryBlue,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              spacing: 9,
                              runSpacing: 10,
                              children: skills.map((skill) {
                                return Chip(
                                  avatar: const Icon(
                                    Icons.check_circle_outline,
                                    color: primaryBlue,
                                    size: 19,
                                  ),
                                  label: Text(skill),
                                  backgroundColor: const Color(0xFFEDEBFC),
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 5,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Divider(),
                          const SizedBox(height: 8),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Contact',
                              style: TextStyle(
                                color: primaryBlue,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const InfoTile(
                            icon: Icons.email_outlined,
                            label: 'Email',
                            value: 'polisettisowmya8@gmail.com',
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// REUSABLE DETAILS

class DetailScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const DetailScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryBlue, size: 27),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                SelectableText(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF292833),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
