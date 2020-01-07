abstract class Produk {
  String _name;
  String _price;
  String _image;

  String get name {
    return _name;
  }

  String get price {
    return _price;
  }

  String get image {
    return _image;
  }
}

class BatikPekalongan extends Produk {
  final String _name = 'Batik Pekalongan';
  final String _price = 'Rp 270.000';
  final String _image = 'assets/images/beli/batik.jpeg';

  String get name {
    return _name;
  }

  String get price {
    return _price;
  }

  String get image {
    return _image;
  }
}

class Angklung extends Produk {
  final String _name = 'Angklung';
  final String _price = 'Rp 1.000.000';
  final String _image = 'assets/images/beli/angklung.jpg';

  String get name {
    return _name;
  }

  String get price {
    return _price;
  }

  String get image {
    return _image;
  }
}

class KainTenun extends Produk {
  final String _name = 'Kain Tenun';
  final String _price = 'Rp 310.000';
  final String _image = 'assets/images/beli/tenun.jpg';

  String get name {
    return _name;
  }

  String get price {
    return _price;
  }

  String get image {
    return _image;
  }
}

class TopengJawa extends Produk {
  final String _name = 'Topeng Jawa';
  final String _price = 'Rp 250.000';
  final String _image = 'assets/images/figur/kerajinan/topeng.jpg';

  String get name {
    return _name;
  }

  String get price {
    return _price;
  }

  String get image {
    return _image;
  }
}

class KainJawaTengah extends Produk {
  final String _name = 'Kain Jawa Tengah';
  final String _price = 'Rp 200.000';
  final String _image = 'assets/images/figur/kain/aceh.jpg';

  String get name {
    return _name;
  }

  String get price {
    return _price;
  }

  String get image {
    return _image;
  }
}

class Anyaman extends Produk {
  final String _name = 'Anyaman';
  final String _price = 'Rp 400.000';
  final String _image = 'assets/images/figur/kerajinan/anyaman.jpg';

  String get name {
    return _name;
  }

  String get price {
    return _price;
  }

  String get image {
    return _image;
  }
}
