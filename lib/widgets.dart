import 'package:flutter/material.dart';
import 'package:khasindonesia/routes.dart';
import 'package:khasindonesia/produk.dart';

// File untuk menaruh semua widget buatan agar bisa di pakai berulang2

// Widget yang akan menyimpan semua data variable global dari jumlah barang yang ada di keranjang, dan barang apa saja. Yang akan mewarisi ke semua widget di aplikasi ini
class CartState extends InheritedWidget {
  CartState(
      {Key key,
      this.productsInCart,
      this.addCart,
      this.removeCart,
      Widget child})
      : super(key: key, child: child);

  final List<Produk> productsInCart;
  final Function addCart;
  final Function removeCart;

  // Method yang akan menentukan kapan semua widget yang diwarisi oleh widget ini di rebuild atau tidak
  // Menerima parameter state widget ini sebelum terjadi perubahan data atau rebuild
  // Dalam kasus ini menunjukan untuk JANGAN rebuild widget ini dan semua widget yang diwarisi widget ini jika data count yang lama sama dengan data count yang baru
  @override
  bool updateShouldNotify(CartState oldWidget) {
    return productsInCart.length != oldWidget.productsInCart.length;
  }

  // Method yang akan digunakan untuk widget yang diwarisi untuk mengakses data
  static CartState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartState>();
  }
}

// Widget yang menjalankan aplikasi dengan menjalnkan CartState
class KhasindonesiaApp extends StatefulWidget {
  @override
  _KhasindonesiaAppState createState() => _KhasindonesiaAppState();
}

class _KhasindonesiaAppState extends State<KhasindonesiaApp> {
  List<Produk> productsInCart = [];

  void addCart(product) {
    setState(() {
      productsInCart.add(product);
    });
  }

  void removeCart(product) {
    setState(() {
      productsInCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CartState(
      productsInCart: productsInCart,
      addCart: addCart,
      removeCart: removeCart,
      child: MaterialApp(
        title: 'Khasindonesia',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
        ),
        home: Home(), // Route home
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
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Produk product;
  final double productImageScale;

  ItemCard({@required this.product, this.productImageScale = 2.5});

  @override
  Widget build(BuildContext context) {
    print(this.product.image);
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
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemBuy(product: product),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: this.product.name,
                  child: Image.asset(
                    this.product.image,
                    scale: this.productImageScale,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    this.product.name,
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    this.product.price,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
