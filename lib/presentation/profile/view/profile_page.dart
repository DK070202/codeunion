import 'package:codeunion/app/config/config.dart';
import 'package:codeunion/app/router/router.dart';
import 'package:codeunion/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
          const AppText.heading2(
            'Марипбек Чингиз',
            height: 1.67,
          ),
          const SizedBox(
            height: 12,
          ),
          const AppText.subheading(
            'maripbekoff@gmail.com',
            color: AppColors.gray92,
          ),
          const SizedBox(
            height: 27,
          ),
          _ProfileTile(
            title: 'Выйти',
            onTap: () {
              context.go(AppRoutes.login);
            },
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
    return InkWell(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
