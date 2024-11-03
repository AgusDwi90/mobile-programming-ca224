import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/resources/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Deklarasi variabel penanda page active
  int _selectedPageIndex = 0;

  // Fungsi untuk mengubah page active
  void _changePageActive(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // List widget untuk setiap page
  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('This is the search page.')),
    const Center(child: Text('This is the create page.')),
    const Center(child: Text('This is the activity page.')),
    const Center(child: Text('This is the profile page.')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/moments_text.png',
          height: 30,
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-home.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-home.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-search.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-search.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-add.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-add.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-heart.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-heart.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-portrait.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-portrait.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        onTap: _changePageActive,
      ),
    );
  }
}
