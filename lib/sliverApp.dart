// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'detailProduct.dart';
import 'wishlist.dart';
import 'inspiration.dart';
import 'profile.dart';

class HomeII extends StatefulWidget {
  @override
  State<HomeII> createState() => _sliverState();
}

class _sliverState extends State<HomeII> {
  bool _showTextField = true;
  bool _showSearchIcon = true;
  ScrollController _scrollController = ScrollController();
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
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double currentScroll = _scrollController.position.pixels;
    if (currentScroll > 20 && _showTextField) {
      setState(() {
        _showTextField = false;
        _showSearchIcon = true;
      });
    } else if (currentScroll <= 20 && !_showTextField) {
      setState(() {
        _showTextField = true;
        _showSearchIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(left: 1, top: 12),
              child: Container(
                width: 84,
                height: 33,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('ikea.png'),
                )),
              ),
            ),
            actions: <Widget>[
              if (_showSearchIcon)
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _showTextField = true;
                      _showSearchIcon = false;
                    });
                  },
                ),
              SizedBox(
                width: 8,
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 8,
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
            pinned: true,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  title: _showTextField
                      ? Container(
                          height: 36,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 12),
                                      hintText: 'Cari barang impianmu',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffE7E7E7)),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 18,
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  centerTitle: true,
                );
              },
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 23),
              child: Column(
                children: [
                  Container(
                    width: 470,
                    height: 280,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('banner.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _category('5.png', 'Kamar Tidur'),
                      _category('6.png', 'Ruang Kerja'),
                      _category('7.png', 'Dapur'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _category('8.png', 'Kamar Tidur'),
                      _category('9.png', 'Ruang Kerja'),
                      _category('10.png', 'Dapur'),
                    ],
                  ),
                  SizedBox(height: 30),
                  _produkPopularText('Produk Popular', 'Lihat Semua'),
                  SizedBox(
                    height: 18,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _produknya('15.png', 'KROKFJORDEN',
                            'Pengait dengan \nplastik isap ...', 'Rp99.900'),
                        SizedBox(
                          width: 8,
                        ),
                        _produknya(
                            '16.png',
                            'ALEX/LAGKAPTEN',
                            'Meja, hijau muda \nputih, 120x60 cms',
                            'Rp1.909.000'),
                        SizedBox(
                          width: 8,
                        ),
                        _produknya(
                            '17.png',
                            'FARDAL/PAX',
                            'Kombinasi lemari \npakaian,putih/hig...',
                            'Rp8.400.000'),
                        SizedBox(
                          width: 8,
                        ),
                        _produknya('10.png', 'KROKFJORDEN',
                            'Pengait dengan plastik isap ...', 'Rp99.900'),
                        SizedBox(
                          width: 8,
                        ),
                        _produknya('15.png', 'KROKFJORDEN',
                            'Pengait dengan plastik isap ...', 'Rp99.900'),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  _produkPopularText('Telusuri Koleksi Kamu', 'Lihat Semua'),
                  SizedBox(
                    height: 24,
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
                  SizedBox(height: 24),
                  _produkPopularText("Penawaran Terkini", 'Lihat semua'),
                  SizedBox(
                    height: 24,
                  ),
                  _penawaranTerkini()
                ],
              ),
            ),
          ]))
        ],
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Mengubah warna item yang dipilih menjadi warna yang diinginkan
      for (int i = 0; i < itemColors.length; i++) {
        itemColors[i] = i == index ? Color(0xff0058AB) : Colors.black87;
      }
    });
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
          Text(
            hargaBarang,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
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
}
