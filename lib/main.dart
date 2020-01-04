import 'package:flutter/material.dart';
import 'package:khasindonesia/produk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khasindonesia',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      home: Home(),
    );
  }
}

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

class SubHeader extends StatelessWidget {
  final IconData icon;
  final String text;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  SubHeader(
      {@required this.icon,
      @required this.text,
      @required this.marginTop,
      this.marginBottom = 0.0,
      this.marginLeft = 20.0,
      this.marginRight = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(
          this.marginLeft, this.marginTop, this.marginRight, this.marginBottom),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(8.0, 0.0, 0, 0),
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final double productImageScale;

  ItemCard(
      {@required this.productName,
      @required this.productPrice,
      @required this.productImage,
      this.productImageScale = 2.5});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
            offset: Offset(
              2.0, // horizontal
              5.0, // vertical
            ),
          )
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                this.productImage,
                scale: this.productImageScale,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(this.productName),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  this.productPrice,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
