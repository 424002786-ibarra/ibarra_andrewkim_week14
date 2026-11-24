import 'package:flutter/material.dart';

import '../brand_widgets.dart';
import '../theme/app_theme.dart';
import 'welcome_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DashboardHeader(),
                    SizedBox(height: 20),
                    Text(
                      'Recently Update:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                    SizedBox(height: 8),
                    _RecentUpdates(),
                    SizedBox(height: 17),
                    Text(
                      'Hot Topics:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                    SizedBox(height: 10),
                    _HotTopicCard(),
                  ],
                ),
              ),
            ),
            _BottomNavigation(
              onHomePressed: () {
                final navigator = Navigator.of(context);
                if (navigator.canPop()) {
                  navigator.pop();
                } else {
                  navigator.pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (_) => const WelcomeScreen(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Container(
            width: 52,
            height: 52,
            color: const Color(0xFF1674D2),
            alignment: Alignment.center,
            child: const BrandLogo(size: 52),
          ),
        ),
        const SizedBox(width: 8),
        const BrandName(fontSize: 17),
        const Spacer(),
        IconButton(
          tooltip: 'Notifications',
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            size: 25,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(width: 6),
        ClipOval(
          child: Image.asset(
            'assets/images/profile.jpg',
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _RecentUpdates extends StatelessWidget {
  const _RecentUpdates();

  @override
  Widget build(BuildContext context) {
    final books = [
      ('assets/images/Re_Zero_Volume_46_Cover.webp', 'Re: Zero Vol 46'),
      ('assets/images/Danmachi_Volume_21_-_02.webp', 'Danmachi Vol 21'),
      ('assets/images/Cover-LN-V7-JP.webp', 'Eminence in Shadow\nVol 7'),
      ('assets/images/Overlord_Volume_16.webp', 'Overlord Vol 16'),
    ];

    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final item = books[index];
          return SizedBox(
            width: 108,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 108,
                    height: 148,
                    child: Image.asset(
                      item.$1,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item.$2,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.05,
                    color: AppTheme.textDark,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _HotTopicCard extends StatelessWidget {
  const _HotTopicCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F7),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/lloyd.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Lloyd Frontera',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textDark,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'More options',
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            'assets/images/lloyd bcg.jpg',
            width: double.infinity,
            height: 170,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Lloyd is water. water is good.\nLloyd is good. #Water',
          style: TextStyle(
            height: 1.25,
            fontSize: 13,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            _ActionCount(icon: Icons.favorite_border, count: '143'),
            Spacer(),
            _ActionCount(icon: Icons.chat_bubble_outline, count: '67'),
            Spacer(),
            _ActionCount(icon: Icons.share_outlined, count: '143'),
          ],
        ),
      ],
    );
  }
}

class _ActionCount extends StatelessWidget {
  const _ActionCount({required this.icon, required this.count});

  final IconData icon;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 24, color: AppTheme.textDark),
        const SizedBox(width: 7),
        Text(
          count,
          style: const TextStyle(fontSize: 13, color: AppTheme.textDark),
        ),
      ],
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({required this.onHomePressed});

  final VoidCallback onHomePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F2F4),
        border: Border(
          top: BorderSide(color: Color(0xFFE5E7EA)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 8,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavItem(
                    icon: Icons.home_outlined,
                    label: 'home',
                    onPressed: onHomePressed,
                  ),
                  const _NavItem(icon: Icons.search, label: 'Search'),
                  const SizedBox(width: 62),
                  const _NavItem(
                      icon: Icons.favorite_border, label: 'Favorite'),
                  const _NavItem(icon: Icons.person, label: 'Profile'),
                ],
              ),
            ),
            Positioned(
              top: -19,
              child: Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x2520242A),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 62,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 25, color: AppTheme.textDark),
            const SizedBox(height: 3),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: AppTheme.textDark),
            ),
          ],
        ),
      ),
    );
  }
}
