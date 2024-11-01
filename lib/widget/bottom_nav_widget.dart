import 'package:flutter/material.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/style/font_style.dart';

// class BottomNavbarWidget extends StatelessWidget {

//   final int currentIndex;
//   final Function(int)? onTap;
//   const BottomNavbarWidget({
//     Key? key,

//     this.currentIndex = 0,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//       backgroundColor: ColorStyle.blackColor,
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_filled),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite),
//           label: 'Favorite',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart),
//           label: 'Cart',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person_outline),
//           label: 'Profile',
//         ),
//       ],
//       currentIndex: currentIndex,
//       selectedItemColor: ColorStyle.primaryColor,
//       unselectedItemColor: ColorStyle.textColor,
//       showUnselectedLabels: true,
//       onTap: onTap,
//     );
//   }
// }

class BottomNavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isVertical;

  const BottomNavbarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.isVertical = false, // Default horizontal
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                child: Image(
                  image: AssetImage('assets/image/LuxeLune-Logo.png'),
                  height: 50,
                  width: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12.0, bottom: 4.0, right: 8.0, left: 8.0),
                child: GestureDetector(
                  onTap: () => onTap(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: currentIndex == 0
                            ? ColorStyle.primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: FontFamily.text.copyWith(
                            color: currentIndex == 0
                                ? ColorStyle.primaryColor
                                : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top:18.0, bottom: 4.0, right: 8.0, left: 8.0),
                child: GestureDetector(
                  onTap: () => onTap(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: currentIndex == 1
                            ? ColorStyle.primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        'Favorite',
                        style: FontFamily.text.copyWith(
                            color: currentIndex == 1
                                ? ColorStyle.primaryColor
                                : Colors.grey), 
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top:18.0, bottom: 4.0, right: 8.0, left: 8.0),
                child: GestureDetector(
                  onTap: () => onTap(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: currentIndex == 2
                            ? ColorStyle.primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        'Cart',
                        style:FontFamily.text.copyWith(
                            color: currentIndex == 2
                                ? ColorStyle.primaryColor
                                : Colors.grey)
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top:18.0, bottom: 4.0, right: 8.0, left: 8.0),
                child: GestureDetector(
                  onTap: () => onTap(3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: currentIndex == 3
                            ? ColorStyle.primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: FontFamily.text.copyWith(
                            color: currentIndex == 3
                                ? ColorStyle.primaryColor
                                : Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        : BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorStyle.blackColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            currentIndex: currentIndex,
            selectedItemColor: ColorStyle.primaryColor,
            unselectedItemColor: ColorStyle.textColor,
            showUnselectedLabels: true,
            onTap: onTap,
          );
  }
}
