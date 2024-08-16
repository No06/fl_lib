import 'package:flutter/material.dart';

extension ThemeDataX on ThemeData {
  static const bgInDark = Color.fromARGB(17, 15, 15, 15);

  ThemeData get toAmoled => copyWith(
        scaffoldBackgroundColor: Colors.black,
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        dialogTheme: const DialogTheme(backgroundColor: Colors.black),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: bgInDark),
        listTileTheme: const ListTileThemeData(tileColor: bgInDark),
        cardTheme: const CardTheme(color: bgInDark),
        navigationBarTheme:
            const NavigationBarThemeData(backgroundColor: Colors.black),
        popupMenuTheme: const PopupMenuThemeData(color: Colors.black),
      );
}
