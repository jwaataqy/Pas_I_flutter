// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'wislist_model.dart';
import 'package:intl/intl.dart';

class Keranjang extends StatefulWidget {
  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
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
  int hargaJumlah = 1499000;
  int index_jumlah = 1;
  int index_jumlah2 = 1;
  int hargaJumlah2 = 1350000;
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        toolbarHeight: 100,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              onTap: () => {
                  setState(() => {isLike = !isLike})
              },
              child: Icon(
                Iconsax.heart5,
                color: isLike ? Colors.black : Colors.red,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 28),
            child: Column(
              children: [
                _HapusItem(),
                SizedBox(height: 80),
                _barang1(),
                SizedBox(
                  height: 70,
                ),
                _barang2(),
              ],
            ),
          ),
          SizedBox(height: 100),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 104,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xffE7E7E7)))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 30, bottom: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total'),
                      Text(
                        '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(hargaJumlah + hargaJumlah2)}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Container(
                    width: 181,
                    height: 56,
                    decoration: BoxDecoration(color: Color(0xff0058AB)),
                    child: Center(
                        child: Text(
                      'Beli',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _barang1() {
    return Row(
      children: [
        Image.asset('lemari.png'),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'ALEX',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          SizedBox(height: 20),
          Text('Unit laci, abu-abu toska, 36x70 cm'),
          SizedBox(
            height: 10,
          ),
          Text(
              '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(hargaJumlah2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _sampah(),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 38,
                width: 183,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffE7E7E7))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => {
                                  if (index_jumlah2 > -1)
                                    {
                                      setState(() => {
                                            index_jumlah2 = index_jumlah2 - 1,
                                            hargaJumlah2 =
                                                hargaJumlah2 - 1350000
                                          })
                                    }
                                },
                            child: Icon(Iconsax.minus)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(index_jumlah2.toString()),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  setState(() {
                                    index_jumlah2 = index_jumlah2 + 1;
                                    hargaJumlah2 = hargaJumlah2 + 1350000;
                                  })
                                },
                            child: Icon(
                              Iconsax.add,
                              color: Colors.blue,
                            ))
                      ]),
                ),
              )
            ],
          )
        ]),
      ],
    );
  }

  Row _barang2() {
    return Row(
      children: [
        Image.asset('rak.keranjang.png'),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'MACKAPÄR',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          SizedBox(height: 20),
          Text('Kabinet/tempat sepatu, putih,\n80x35x102 cm'),
          SizedBox(
            height: 10,
          ),
          Text(
              '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(hargaJumlah)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _sampah(),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 38,
                width: 183,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffE7E7E7))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => {
                                  if (index_jumlah > 0)
                                    {
                                      setState(() => {
                                            index_jumlah = index_jumlah - 1,
                                            hargaJumlah = hargaJumlah - 1499000
                                          })
                                    }
                                },
                            child: Icon(Iconsax.minus)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(index_jumlah.toString()),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  setState(() {
                                    index_jumlah = index_jumlah + 1;
                                    hargaJumlah = hargaJumlah + 1499000;
                                  })
                                },
                            child: Icon(
                              Iconsax.add,
                              color: Colors.blue,
                            ))
                      ]),
                ),
              )
            ],
          )
        ]),
      ],
    );
  }

  Container _sampah() {
    return Container(
      height: 38,
      width: 72,
      decoration: BoxDecoration(border: Border.all(color: Color(0xffE7E7E7))),
      child: Icon(Iconsax.trash4),
    );
  }

  Row _pordukKeranjang(String imagename, String namaBarang,
      String deskripsiBarang, String hargaBarang, int index) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(imagename),
          )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaBarang,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 16,
            ),
            Text(deskripsiBarang),
            SizedBox(height: 8),
            Text(
              hargaBarang,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 72,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffE7E7E7))),
                    child: Icon(
                      Iconsax.trash4,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    width: 183,
                    height: 38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffE7E7E7))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, left: 16),
                          child: GestureDetector(
                              onTap: () => {
                                    if (index_jumlah > 0)
                                      {
                                        setState(() {
                                          index_jumlah = index_jumlah - 1;
                                        })
                                      }
                                  },
                              child: Icon(Icons.minimize_outlined)),
                        ),
                        Text(index_jumlah.toString()),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {
                              if (index_jumlah == 1) {
                                setState(() {
                                  index_jumlah++;
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Container _produk() {
    return Container(
      width: 183,
      height: 38,
      decoration: BoxDecoration(border: Border.all(color: Color(0xffE7E7E7))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 16),
            child: GestureDetector(
                onTap: () => {
                      if (index_jumlah > -1)
                        {
                          setState(() {
                            index_jumlah = index_jumlah - 1;
                          })
                        }
                    },
                child: Icon(Icons.minimize_outlined)),
          ),
          Text(index_jumlah.toString()),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  index_jumlah++;
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _HapusItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '2',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'barang',
              style: TextStyle(color: Color(0xff6C6C6C)),
            ),
          ],
        ),
        Text(
          'Hapus Semua',
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
