// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_search/home.dart';

class Detail extends StatefulWidget {
  final String img;
  final String text;
  final String subtext;
  final String harga;
  Detail({
    required this.img,
    required this.text,
    required this.subtext,
    required this.harga,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int index_jumlah = 0;
  bool isLike = true;
  @override
  Widget build(BuildContext context) {
    final img = widget.img;
    final text = widget.text;
    final subText = widget.subtext;
    final harga = widget.harga;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 26,
              )),
        ),
        title: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
                SizedBox(
                  width: 24,
                ),
                Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                SizedBox(
                  width: 24,
                ),
                Icon(
                  Icons.shopping_cart,
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
                Container(
                  width: 470,
                  height: 382,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(122, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('16.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(122, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('23.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(122, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('24.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(122, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('25.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(122, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('22.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(122, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('23.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(122, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('24.png'),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                _detailProdukText(text, subText, harga),
                SizedBox(
                  height: 14,
                ),
                _ratings(),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Ruang terbatas bukan berarti Anda harus menolak belajar atau bekerja dari rumah. Meja ini memakan sedikit ruang lantai namun masih memiliki unit laci tempat Anda dapat menyimpan kertas dan barang penting lainnya.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _tambahKeranjang(context),
    );
  }

  Container _tambahKeranjang(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffE7E7E7)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130,
                height: 56,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffE7E7E7))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => {
                                if (index_jumlah > 0)
                                  {
                                    setState(() {
                                      index_jumlah--;
                                    })
                                  }
                              },
                          child: Icon(Iconsax.minus4)),
                      Text(index_jumlah.toString()),
                      GestureDetector(
                        onTap: () => {
                          setState(() {
                            index_jumlah++;
                          })
                        },
                        child: Icon(
                          Icons.add,
                          color: Color(0xff0058AB),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 237,
                height: 56,
                decoration: BoxDecoration(color: Color(0xff0058AB)),
                child: Center(
                    child: Text(
                  'Tambah Keranjang',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
              )
            ],
          ),
        ));
  }

  Row _ratings() {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 24,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 24,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 24,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 24,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 24,
            ),
          ],
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '4.5 | Terjual 116',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xff6C6C6C)),
        )
      ],
    );
  }

  Column _detailProdukText(String text, String subText, String harga) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            GestureDetector(
              onTap: () => {
                setState(() => {isLike = !isLike})
              },
              child: Icon(
                Iconsax.heart5,
                size: 26,
                color: isLike ? Colors.black : Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          subText,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff6C6C6C)),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          harga,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
