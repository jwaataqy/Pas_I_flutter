// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_search/home.dart';
import 'package:movie_search/profile.dart';
import 'package:movie_search/wishlist.dart';

class Inspiration extends StatefulWidget {
  @override
  State<Inspiration> createState() => _InspirationState();
}

class _InspirationState extends State<Inspiration> {
  int selectedIndex = 0;

  int _selectedIndex = 1; // Indeks item yang dipilih

  // Daftar warna yang sesuai dengan item yang dipilih atau tidak dipilih
  List<Color> itemColors = [
    Colors.black87,
    Color(0xff0058AB),
    Colors.black87,
    Colors.black87,
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: Text(
            'Temukan Inspirasi',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 26,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Iconsax.shopping_cart4,
                    color: Colors.black,
                    size: 26,
                  )
                ],
              ),
            ),
          ],
          bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: "Inspirasi",
                ),
                Tab(
                  text: "Koleksi",
                ),
                Tab(
                  text: "Edukasi",
                )
              ]),
        ),
        body: TabBarView(children: [
          // Isi tab "Inspiration"
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _listInspiration(0, 'Semua'),
                          _listInspiration(1, 'Ruang Kerja'),
                          _listInspiration(2, 'Dapur'),
                          _listInspiration(3, 'Ruang Tamu'),
                          _listInspiration(4, 'Kamar Tidur'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('27.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Hunian compact yang\nnyaman',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('26.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Lakukan 5 hal ini agar\nsepatumu bebas ...',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('28.png'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hadirkan nuasa elegant dan fancy kedalam kamar tidur anda',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('30.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Rumah lebih sehat dengan\nset tempat ...',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('29.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Membuat kamar anak rapi\njadi lebih mudah',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Isi tab "Edukasi"
          Center(
            child: Text('Konten Edukasi'),
          ),
          // Isi tab "Koleksi"
          Center(
            child: Text('Konten Koleksi'),
          ),
        ]),
        bottomNavigationBar: _BtmNav(),
      ),
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
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()))
                  },
              child: Icon(Icons.home)),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.coffee),
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
          icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
              child: Icon(Icons.supervised_user_circle_rounded)),
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
      for (int i = 1; i < itemColors.length; i++) {
        itemColors[i] = i == index ? Color(0xff0058AB) : Colors.black87;
      }
    });
  }

  Container _listInspiration(int index, String judul) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: 96,
              height: 48,
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Color(0xff0058AB)
                      : Colors.transparent,
                  border: Border.all(
                      color: selectedIndex == index
                          ? Colors.transparent
                          : Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                judul,
                style: TextStyle(
                    color:
                        selectedIndex == index ? Colors.white : Colors.black),
              )),
            ),
          ),
          SizedBox(
            width: 35,
          ),
        ],
      ),
    );
  }
}
