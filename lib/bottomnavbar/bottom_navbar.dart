import 'package:flutter/material.dart';
import 'package:submission_first/bottomnavbar/favorite_screen.dart';
import 'package:submission_first/bottomnavbar/home_screen.dart';
import 'package:submission_first/bottomnavbar/profile_screen.dart';
import 'package:submission_first/bottomnavbar/item_add_screen.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/widget/bottom_nav_widget.dart';

// class BottomNavbarScreen extends StatefulWidget {
//   final int? activeScreen;
//   const BottomNavbarScreen({Key? key, this.activeScreen})
//       : super(key: key);

//   @override
//   State<BottomNavbarScreen> createState() =>
//       _BottomNavbarScreenState();
// }

// class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
//   int _selectedNavbar = 0;
//   @override
//   void initState() {
//     super.initState();
//     // Jika activeScreen disetel, gunakan nilainya sebagai layar aktif
//     if (widget.activeScreen != null) {
//       _selectedNavbar = widget.activeScreen!;
//     }
//   }

//   void _changeSelectedNavbar(int index) {
//     setState(() {
//       _selectedNavbar = index;
//     });
//   }

//   Widget screenBottomNavigation(int index) {
//     if (index == 0) {
//       return const HomeScreen();
//     } else if (index == 1) {
//       return FavoriteScreen();
//     } else if (index == 2) {
//       return PurchaseScreen();
//     } else {
//       return ProfileScreen();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 1000),
//         child: screenBottomNavigation(_selectedNavbar),
//       ),
//       bottomNavigationBar: BottomNavbarWidget(
    
//         currentIndex: _selectedNavbar,
//         onTap: _changeSelectedNavbar,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:submission_first/bottomnavbar/favorite_screen.dart';
import 'package:submission_first/bottomnavbar/home_screen.dart';
import 'package:submission_first/bottomnavbar/profile_screen.dart';
import 'package:submission_first/bottomnavbar/item_add_screen.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/widget/bottom_nav_widget.dart';

class BottomNavbarScreen extends StatefulWidget {
  final int? activeScreen;
  const BottomNavbarScreen({Key? key, this.activeScreen})
      : super(key: key);

  @override
  State<BottomNavbarScreen> createState() =>
      _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int _selectedNavbar = 0;
  
  @override
  void initState() {
    super.initState();
    // Jika activeScreen disetel, gunakan nilainya sebagai layar aktif
    if (widget.activeScreen != null) {
      _selectedNavbar = widget.activeScreen!;
    }
  }

  void _changeSelectedNavbar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  Widget screenBottomNavigation(int index) {
    if (index == 0) {
      return const HomeScreen();
    } else if (index == 1) {
      return FavoriteScreen();
    } else if (index == 2) {
      return PurchaseScreen();
    } else {
      return ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 600;
        
        return Scaffold(
          body: Row(
            children: [
              // Jika layar lebar, tampilkan sidebar di sebelah kanan atas
              if (isWideScreen) 
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: BottomNavbarWidget(
                          currentIndex: _selectedNavbar,
                          onTap: _changeSelectedNavbar,
                          isVertical: true, // Buat BottomNavbarWidget sebagai vertical jika lebar layar besar
                        ),
                      ),
                    ),
                  ],
                ),
              // Area tampilan utama
              Expanded(
                flex: 4, // Luaskan tampilan utama untuk layar besar
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: screenBottomNavigation(_selectedNavbar),
                ),
              ),
            ],
          ),
          // Bottom Navigation Bar untuk perangkat kecil
          bottomNavigationBar: isWideScreen
              ? null
              : BottomNavbarWidget(
                  currentIndex: _selectedNavbar,
                  onTap: _changeSelectedNavbar,
                ),
        );
      },
    );
  }
}
