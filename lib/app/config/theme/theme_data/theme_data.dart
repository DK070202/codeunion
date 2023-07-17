part of '../theme.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.offWhite,
      titleTextStyle: AppTypography.subheading.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(
        size: 18,
        color: AppColors.primaryColor,
      ),
      selectedLabelStyle: AppTypography.subtitle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.75,
      ),
      selectedItemColor: AppColors.primaryColor,
      unselectedIconTheme: const IconThemeData(
        size: 18,
        color: AppColors.black,
      ),
      unselectedLabelStyle: AppTypography.subtitle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.75,
      ),
      unselectedItemColor: AppColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.offWhite,
      hintStyle: AppTypography.subheading.copyWith(
        color: const Color(0xFFC3C3C3),
      ),
    ),
    dividerColor: const Color(0xFFE0E6ED),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll<double>(0),
        minimumSize: const MaterialStatePropertyAll<Size>(
          Size.fromHeight(64),
        ),
        textStyle: MaterialStatePropertyAll<TextStyle>(
          AppTypography.subheading.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll<Color>(
          AppColors.primaryColor,
        ),
        shape: const MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
      ),
    ),
  );
}
