import 'package:codeunion/app/config/config.dart';
import 'package:codeunion/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 38,
          ),
          SvgPicture.asset(
            'assets/icons/user.svg',
          ),
          const SizedBox(
            height: 15,
          ),
          AppText.heading2(
            'Марипбек Чингиз',
            height: 1.67,
          ),
          const SizedBox(
            height: 12,
          ),
          AppText.subheading(
            'maripbekoff@gmail.com',
            color: AppColors.gray92,
          ),
          const SizedBox(
            height: 27,
          ),
          _ProfileTile(
            title: 'Выйти',
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.title,
    required this.onTap,
    // ignore: unused_element
    this.color = AppColors.red,
  });
  final String title;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 29,
        vertical: 21,
      ),
      width: double.infinity,
      color: AppColors.offWhite,
      child: AppText.subheading(
        title,
        color: color,
      ),
    );
  }
}
