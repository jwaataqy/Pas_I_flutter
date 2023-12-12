// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_search/home.dart';
import 'package:movie_search/inspiration.dart';
import 'package:movie_search/keranjang.dart';
import 'package:movie_search/profile.dart';
import 'wislist_model.dart';

class wishlist extends StatefulWidget {
  @override
  State<wishlist> createState() => _barangSearchState();
}

class _barangSearchState extends State<wishlist> {
  static List<WishlistModel> list_barang = [
    WishlistModel('lemari.png', 'ALEX', 'Unit laci, abu-abu toska,\n36x70 cm',
        'Rp1.350.000'),
    WishlistModel(
        'kursi.png', 'MILLBERGET', 'Kursi putar, murum hitam', 'Rp1.799.000'),
    WishlistModel(
        'kasur.png',
        'SONGESAND',
        'Rngk tmpt tdr dg 2 ktk penyimpanan,\ncokelat, 160x200 cm',
        'Rp3.499.000'),
    WishlistModel(
        'lampu.png', 'HEKTAR', 'Lampu lantai, abu-abu tua', 'Rp1.299.000'),
  ];

  List<WishlistModel> displaybarang = List.of(list_barang);

  void updateListVideo(String value) {
    setState(() {
      displaybarang = list_barang
          .where((element) =>
              element.namaBarang.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  int selectedIndex = 0;
  int _selectedIndex = 2; // Indeks item yang dipilih
  bool isLike = false;

  // Daftar warna yang sesuai dengan item yang dipilih atau tidak dipilih
  List<Color> itemColors = [
    Colors.black87,
    Colors.black87,
    Color(0xff0058AB),
    Colors.black87,
    Colors.black87
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            'Wishlist',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Icon(
              Icons.shopping_cart,
              size: 26,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => updateListVideo(value),
              decoration: InputDecoration(
                  hintText: 'Cari barang di wishlist',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: false,
                  fillColor: Color.fromARGB(114, 158, 158, 158),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE7E7E7)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: displaybarang.isEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(displaybarang.length.toString()),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Barang',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xffE7E7E7)),
                            )
                          ],
                        ),
                        Icon(
                          Icons.list,
                          size: 26,
                          color: Colors.black,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(displaybarang.length.toString()),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'barang',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xffE7E7E7)),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.list,
                          size: 26,
                          color: Colors.black,
                        )
                      ],
                    ),
            ),
            Expanded(
                child: displaybarang.isEmpty
                    ? Center(
                        child: Text('Barang tidak ditemukan'),
                      )
                    : ListView.builder(
                        itemCount: displaybarang.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8),
                              child: ListTile(
                                  contentPadding: EdgeInsets.only(),
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      displaybarang[index].namaBarang,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${displaybarang[index].deskripsiBarang}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '${displaybarang[index].hargaBarang}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Keranjang()));
                                        },
                                        child: Container(
                                          height: 38,
                                          width: 271,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 111, 140, 167))),
                                          child: Center(
                                              child: Text(
                                            'Tambahkan Ke Keranjang',
                                            style: TextStyle(
                                                color: Color(0xff0058AB)),
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                  trailing: Icon(Icons.more_vert),
                                  leading: Image.asset(
                                    displaybarang[index].gambarBarang,
                                    width: 100,
                                    height: 100,
                                  )),
                            )))
          ],
        ),
      ),
      bottomNavigationBar: _BtmNav(),
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
      for (int i = 0; i < itemColors.length; i++) {
        itemColors[i] = i == index ? Color(0xff0058AB) : Colors.black87;
      }
    });
  }
}
