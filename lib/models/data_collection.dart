class Product {
  int like;
  String image;
  String brand;
  String name;
  int discount;
  int price;
  String description;
  List<SizeInfo>? sizes;
  List<ColorInfo>? colors;

  Product({
    required this.discount,
    required this.like,
    required this.image,
    required this.brand,
    required this.name,
    required this.price,
    required this.description,
    this.sizes,
    this.colors,
  });
}

class SizeInfo {
  String size;
  int stock;
  int? width; // Tambahkan jika perlu untuk data yang memiliki width
  int? length; // Tambahkan jika perlu untuk data yang memiliki length

  SizeInfo({
    required this.size,
    required this.stock,
    this.width,
    this.length,
  });
}

class ColorInfo {
  String color;
  int stock;

  ColorInfo({
    required this.color,
    required this.stock,
  });
}

class Category {
  String name;
  String image;
  List<Product> items;

  Category({
    required this.image,
    required this.name,
    required this.items,
  });
}

class Profile {
  String name;
  String email;
  String phone;
  String address;
  List<EWallet> eWallets;

  Profile({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.eWallets,
  });
}

class EWallet {
  String name;
  String image;

  EWallet({
    required this.name,
    required this.image,
  });
}

// Example instantiation
List<Category> categories = [
  Category(
    name: "Clothing",
    image: "assets/image/women.png",
    items: [
      Product(
        discount: 0,
        like: 11,
        image: "assets/image/new_collection_woman.png",
        brand: "Executive",
        name: "Black Dress Blings ",
        price: 299000,
        description:
            "Comfortable sportswear from Nike, perfect for everyday activities. This sweater is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various sizes",
        sizes: [
          SizeInfo(size: "S", stock: 10),
          SizeInfo(size: "M", stock: 8),
          SizeInfo(size: "L", stock: 5),
          SizeInfo(size: "XL", stock: 3),
        ],
      ),
      Product(
        discount: 100000,
        like: 11,
        image: "assets/image/new_collection_man.png",
        brand: "Uniqlo",
        name: "Yelllow Rock Man",
        price: 299000,
        description:
            "Comfortable sportswear from Nike, perfect for everyday activities. This sweater is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various sizes",
        sizes: [
          SizeInfo(size: "S", stock: 10),
          SizeInfo(size: "M", stock: 8),
          SizeInfo(size: "L", stock: 5),
          SizeInfo(size: "XL", stock: 3),
        ],
      ),
    ],
  ),

  Category(
    name: "Sports",
    image: "assets/image/sports.png",
    items: [
      Product(
        discount: 60110,
        like: 11,
        image: "assets/image/jaket3.png",
        brand: "Nike",
        name: "Jacket Sportswear Trendy",
        price: 299000,
        description:
            "Comfortable sportswear from Nike, perfect for everyday activities. This sweater is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various sizes",
        sizes: [
          SizeInfo(size: "38", stock: 10),
          SizeInfo(size: "39", stock: 8),
          SizeInfo(size: "40", stock: 5),
          SizeInfo(size: "41", stock: 3),
        ],
      ),
      Product(
        discount: 0,
        like: 11,
        image: "assets/image/jaket1.png",
        brand: "Nike",
        name: "Jakcet Sportswear Trendy cool",
        price: 299000,
        description:
            "Comfortable sportswear from Nike, perfect for everyday activities. This sweater is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various",
        sizes: [
          SizeInfo(size: "38", stock: 10),
          SizeInfo(size: "39", stock: 8),
          SizeInfo(size: "40", stock: 5),
          SizeInfo(size: "41", stock: 3),
        ],
      ),
    ],
  ),
  Category(
    name: "Bags",
    image: "assets/image/bags.png",
    items: [
      Product(
        discount: 70110,
        like: 11,
        image: "assets/image/tas1.png",
        brand: "Fossil",
        name: "Bags Fossil Trendy",
        price: 299000,
        description:
            "Bags Fossil is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various sizes",
        sizes: [
          SizeInfo(size: "38", stock: 10),
          SizeInfo(size: "39", stock: 8),
          SizeInfo(size: "40", stock: 5),
          SizeInfo(size: "41", stock: 3),
        ],
      ),
      Product(
        discount: 10110,
        like: 11,
        image: "assets/image/tas2.png",
        brand: "Channel",
        name: "Channel Bags Trendy",
        price: 299000,
        description:
            "Channel Bags is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various sizes",
        sizes: [
          SizeInfo(size: "38", stock: 10),
          SizeInfo(size: "39", stock: 8),
          SizeInfo(size: "40", stock: 5),
          SizeInfo(size: "41", stock: 3),
        ],
      ),
    ],
  ),
  Category(
    name: "Shoes",
    image: "assets/image/shoes.png",
    items: [
      Product(
        discount: 0,
        like: 11,
        image: "assets/image/sepatu1.png",
        brand: "Nike",
        name: "Nike Sports Shoes",
        price: 299000,
        description:
            "Shoes from Nike, perfect for everyday activities. This sweater is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various sizes",
        sizes: [
          SizeInfo(size: "38", stock: 10),
          SizeInfo(size: "39", stock: 8),
          SizeInfo(size: "40", stock: 5),
          SizeInfo(size: "41", stock: 3),
        ],
      ),
      Product(
        discount: 1111,
        like: 11,
        image: "assets/image/sepatu2.png",
        brand: "Puma",
        name: "Shoes Puma Trendy",
        price: 299000,
        description:
            "Shoes Puma is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various",
        sizes: [
          SizeInfo(size: "38", stock: 10),
          SizeInfo(size: "39", stock: 8),
          SizeInfo(size: "40", stock: 5),
          SizeInfo(size: "41", stock: 3),
        ],
      ),
    ],
  ),
  Category(
    name: "Accessories",
    image: "assets/image/accecories.png",
    items: [
      Product(
        discount: 10000,
        like: 11,
        image: "assets/image/kalung1.png",
        brand: "Frank & Co",
        name: "Necklace Frank & Co",
        price: 299000,
        description:
            "Necklace Frank & Co is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various sizes",
        sizes: [
          SizeInfo(size: "38", stock: 10),
          SizeInfo(size: "39", stock: 8),
          SizeInfo(size: "40", stock: 5),
          SizeInfo(size: "41", stock: 3),
        ],
      ),
      Product(
        discount: 10000,
        like: 11,
        image: "assets/image/kalung2.png",
        brand: "Tiffany & Co",
        name: "Necklace Tiffany & Co",
        price: 299000,
        description:
            "Necklace Tiffany & Co is made from soft, warm material with a modern design and stylish color options. Perfect for casual wear, it features ribbed cuffs and comes in various",
        sizes: [
          SizeInfo(size: "38", stock: 10),
          SizeInfo(size: "39", stock: 8),
          SizeInfo(size: "40", stock: 5),
          SizeInfo(size: "41", stock: 3),
        ],
      ),
    ],
  ),

  // Add other categories here
];

Profile profile = Profile(
  name: "John Doe",
  email: "johndoe@example.com",
  phone: "081234567890",
  address: "Jl. Mawar No. 123, Jakarta",
  eWallets: [
    EWallet(name: "GoPay", image: "assets/image/gopay.png"),
    EWallet(name: "Dana", image: "assets/image/dana.png"),
    EWallet(name: "OVO", image: "assets/image/ovo.png"),
    EWallet(name: "ShopeePay", image: "assets/image/shopepay.png"),
  ],
);
