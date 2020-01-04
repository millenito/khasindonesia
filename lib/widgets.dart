import 'package:flutter/material.dart';

// File untuk menaruh semua widget buatan agar bisa di pakai berulang2

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
                builder: (context) => ItemBuy(
                  productName: this.productName,
                  productImage: this.productImage,
                  productPrice: this.productPrice,
                ),
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
                  tag: this.productName,
                  child: Image.asset(
                    this.productImage,
                    scale: this.productImageScale,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    this.productName,
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    this.productPrice,
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
