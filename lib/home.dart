// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_search/detailProduct.dart';
import 'package:movie_search/inspiration.dart';
import 'package:movie_search/profile.dart';
import 'package:movie_search/wishlist.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int _selectedIndex = 0; // Indeks item yang dipilih
  bool isLike = false;

  // Daftar warna yang sesuai dengan item yang dipilih atau tidak dipilih
  List<Color> itemColors = [
    Color(0xff0058AB),
    Colors.black87,
    Colors.black87,
    Colors.black87
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Image.asset('ikea.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Row(
              children: [
                Icon(Icons.search,color: Colors.black,),
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                SizedBox(
                  width: 24,
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 26,
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Cari barang impianmu',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE7E7E7)),
                      )),
                ),
                SizedBox(
                  height: 24,
                ),
                _banner(),
                SizedBox(height: 24),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _category('5.png', 'Kamar Tidur'),
                        _category('6.png', 'Ruang Kerja'),
                        _category('7.png', 'Dapur'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _category('8.png', 'Bayi & Anak'),
                        _category('9.png', 'Tekstil'),
                        _category('10.png', 'Penyimpanan'),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 48),
                _produkPopularText('Produk popular', 'Lihat Semua'),
                SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _produknya('15.png', 'KROKFJORDEN',
                          'Pengait dengan \nplastik isap ...', 'Rp99.900'),
                      SizedBox(
                        width: 12,
                      ),
                      _produknya('16.png', 'ALEX/LAGKAPTEN',
                          'Meja, hijau muda/\nputih, 120x60 cm', 'Rp1.909.000'),
                      _produknya(
                          '15.png',
                          'FARDAL/PAX',
                          'Kombinasi lemari pakaian,\n putih/hig...',
                          'Rp8.400.000'),
                      _produknya('16.png', 'KROKFJORDEN',
                          'Pengait dengan \nplastik isap ...', 'Rp99.900'),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                _produkPopularText('Telusuri Kolesi Kami', 'Lihat Semua'),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _koleksi(
                        '18.png',
                        'BLÅVINGAD',
                        'Koleksi yang\nterinspirasi dari lautan\nuntuk menciptakan ...',
                        Color(0xff4F707F)),
                    _koleksi(
                        '19.png',
                        'VINTERFINT',
                        'Koleksi VINTERFINT\nhadir dengan warna\ndan pola indah ...',
                        Color(0xff5E4238))
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
                _produkPopularText('Penawaran Terkini', 'Lihat Semua'),
                SizedBox(
                  height: 28,
                ),
                _penawaranTerkini()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _BtmNav(),
    );
  }

  Row _penawaranTerkini() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('20.png'), fit: BoxFit.cover)),
        ),
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('21.png'), fit: BoxFit.cover)),
        ),
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
          icon: Icon(Icons.home),
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

  // BottomNavigationBar _BtmNav({required NavbarProvider ap}) {
  //   return BottomNavigationBar(
  //     currentIndex: _selectedIndex,
  //     selectedItemColor: itemColors[_selectedIndex],
  //     onTap: _onItemTapped,
  //     type: BottomNavigationBarType.fixed,
  //     items: [

  //     ],
  //     unselectedItemColor: Colors.black87,
  //   );
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Mengubah warna item yang dipilih menjadi warna yang diinginkan
      for (int i = 0; i < itemColors.length; i++) {
        itemColors[i] = i == index ? Color(0xff0058AB) : Colors.black87;
      }
    });
  }

  Column _koleksi(String image, String judul, String desk, Color background) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 232,
          color: (background),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12),
                child: Text(
                  judul,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: Text(
                  desk,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  GestureDetector _produknya(
    String nameImg,
    String namaBarang,
    String deskripsiBarang,
    String hargaBarang,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detail(
                img: nameImg,
                text: namaBarang,
                subtext: deskripsiBarang,
                harga: hargaBarang,
              ),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 146,
            height: 146,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(nameImg), fit: BoxFit.cover)),
          ),
          Text(
            namaBarang,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          Text(deskripsiBarang),
          SizedBox(
            height: 8,
          ),
          Text(hargaBarang)
        ],
      ),
    );
  }

  Row _produkPopularText(String nama, String lihat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(nama),
        Text(
          lihat,
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  Column _category(String image, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 117,
          height: 80,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 6,
        ),
        Text(text)
      ],
    );
  }

  Container _banner() {
    return Container(
      width: 470,
      height: 280,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('banner.png'), fit: BoxFit.cover)),
    );
  }
}


// bottomNavigationBar: BottomNavigationBar(
//         currentIndex: ap.selectedIndex,
//         onTap: (i) {
//           ap.selectedIndex = i;
//           isLike ? Colors.black : Colors.blue;
//         },
//         type: BottomNavigationBarType.fixed,
//         items: ap.items
//             .map((e) => BottomNavigationBarItem(
//                 label: e.label,
//                 icon: Icon(
//                   e.iconData,
//                 )))
//             .toList(),
//       ),


