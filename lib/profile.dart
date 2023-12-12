// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_search/home.dart';
import 'package:movie_search/inspiration.dart';
import 'package:movie_search/wishlist.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  int selectedIndex = 0;
  int _selectedIndex = 3; // Indeks item yang dipilih
  bool isLike = false;

  // Daftar warna yang sesuai dengan item yang dipilih atau tidak dipilih
  List<Color> itemColors = [
    
    Colors.black87,
    Colors.black87,
    Colors.black87,
    Color(0xff0058AB),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu Akun',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.settings_sharp,
                  color: Colors.black,
                  size: 22,
                )
              ],
            ),
            SizedBox(height: 30),
            _profileBarcode(context),
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 28),
              child: _optionProfile(Iconsax.profile_circle, 'Profile saya'),
            ),
            _garis(context),
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 28),
              child: _optionProfile(Iconsax.box_1, 'Pesanan'),
            ),
            _garis(context),
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 28),
              child: _optionProfile(Iconsax.star1, 'Ulasan'),
            ),
            _garis(context),
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 28),
              child: _optionProfile(Iconsax.gift5, 'Reward Saya'),
            ),
            _garis(context),
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 28),
              child: _optionProfile(Icons.help_outline, 'Bantuan'),
            ),
            _garis(context)
          ],
        ),
      ),
      bottomNavigationBar: _BtmNav(),
    );
  }

  Row _optionProfile(IconData ikon, String text) {
    return Row(
      children: [
        Icon(ikon, color: Colors.black, size: 30),
        SizedBox(
          width: 16,
        ),
        Text(text)
      ],
    );
  }

  Column _profileBarcode(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('profile.png'), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Muhammad Rajwaa',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  '160002359102020',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6C6C6C)),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 24),
        _garis(context)
      ],
    );
    
  }

  BottomNavigationBar _BtmNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: itemColors[_selectedIndex],
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Icon(Icons.home)),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Inspiration()));
              },
              child: Icon(Icons.coffee)),
          label: 'Inspirasi',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => wishlist()));
              },
              child: Icon(Icons.bookmark)),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_rounded),
          label: 'Profil',
        ),
      ],
      unselectedItemColor: Colors.black87,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Mengubah warna item yang dipilih menjadi warna yang diinginkan
      for (int i = 0; i < itemColors.length; i++) {
        itemColors[i] = i == index ? Color(0xff0058AB) : Colors.black87;
      }
    });
  }

  Container _garis(BuildContext context) {
    return Container(
      height: 2,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffE7E7E7),
    );
  }
}
