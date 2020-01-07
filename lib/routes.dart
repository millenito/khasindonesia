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
        centerTitle: true,
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
                        product: BatikPekalongan(),
                      ),
                      ItemCard(
                        product: Angklung(),
                      ),
                      ItemCard(
                        product: KainTenun(),
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
                        product: TopengJawa(),
                        productImageScale: 3.7,
                      ),
                      ItemCard(
                        product: KainJawaTengah(),
                        productImageScale: 3.7,
                      ),
                      ItemCard(
                        product: Anyaman(),
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
  final Produk product;

  ItemBuy({@required this.product, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartState cart = CartState.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Produk'),
        centerTitle: true,
      ),
      // backgroundColor: Color(this.bgColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Hero(
              tag: this.product.name,
              child: Image.asset(
                this.product.image,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              this.product.name,
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
              this.product.price,
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
              GestureDetector(
                onTap: () {
                  cart.addCart(this.product);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ),
                  );
                },
                child: Container(
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
              ),
              GestureDetector(
                onTap: () {
                  cart.addCart(this.product);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('SUKSES!'),
                        content: Text('Produk ditambahkan ke keranjang'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop(); // Kembali ke home
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartState cart = CartState.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.productsInCart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('${cart.productsInCart[index].image}'),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            title: Text('${cart.productsInCart[index].name}'),
          );
        },
      ),
    );
  }
}
