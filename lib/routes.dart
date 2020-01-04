import 'package:flutter/material.dart';
import 'package:khasindonesia/produk.dart';
import 'package:khasindonesia/widgets.dart';

// File untuk menaruh semua route / activity dari aplikasi

class Home extends StatelessWidget {
  final int bgColor = 0XFFC5CCCE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Khasindonesia'),
      ),
      backgroundColor: Color(this.bgColor),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/banner/banner-4.png'),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[700],
                      blurRadius: 10, // has the effect of softening the shadow
                      spreadRadius:
                          5.0, // has the effect of extending the shadow
                      offset: Offset(
                        1.0, // horizontal
                        5.0, // vertical
                      ),
                    )
                  ],
                ),
              ),
              SubHeader(
                icon: Icons.shopping_cart,
                marginTop: 20.0,
                text: 'Produk Terlaris',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.all(9),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ItemCard(
                        productName: BatikPekalongan.name,
                        productPrice: BatikPekalongan.price,
                        productImage: BatikPekalongan.image,
                      ),
                      ItemCard(
                        productName: Angklung.name,
                        productPrice: Angklung.price,
                        productImage: Angklung.image,
                      ),
                      ItemCard(
                        productName: KainTenun.name,
                        productPrice: KainTenun.price,
                        productImage: KainTenun.image,
                      ),
                    ],
                  ),
                ),
              ),
              SubHeader(
                icon: Icons.new_releases,
                marginTop: 20.0,
                text: 'Produk Baru',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.all(9),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ItemCard(
                        productName: TopengJawa.name,
                        productPrice: TopengJawa.price,
                        productImage: TopengJawa.image,
                        productImageScale: 3.7,
                      ),
                      ItemCard(
                        productName: KainJawaTengah.name,
                        productPrice: KainJawaTengah.price,
                        productImage: KainJawaTengah.image,
                        productImageScale: 3.7,
                      ),
                      ItemCard(
                        productName: Anyaman.name,
                        productPrice: Anyaman.price,
                        productImage: Anyaman.image,
                        productImageScale: 3.7,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemBuy extends StatelessWidget {
  final int bgColor = 0XFFC5CCCE;
  final String productName;
  final String productPrice;
  final String productImage;

  ItemBuy({
    @required this.productName,
    @required this.productPrice,
    @required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khasindonesia'),
      ),
      // backgroundColor: Color(this.bgColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Hero(
              tag: this.productName,
              child: Image.asset(
                this.productImage,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              this.productName,
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 25,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Text(
              this.productPrice,
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  'Beli Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
                decoration: BoxDecoration(
                  // border: Border.all(),
                  color: Colors.black,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  'Tambahkan ke Keranjang',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
