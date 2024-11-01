import 'package:flutter/material.dart';
import 'package:submission_first/models/data_collection.dart';
import 'package:submission_first/screen/detail_cart.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/style/font_style.dart';
import 'package:submission_first/widget/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'L', // Huruf sebelum "I"
              style: FontFamily.tittle.copyWith(color: ColorStyle.primaryColor),
            ),
            TextSpan(
              text: 'una', // Huruf "I" berwarna ungu
              style: FontFamily.tittle.copyWith(
                  color: ColorStyle.blackColor // Ubah warna sesuai kebutuhan
                  ),
            ),
              TextSpan(
              text: 'L', // Huruf sebelum "I"
              style: FontFamily.tittle.copyWith(color: ColorStyle.primaryColor),
            ),
            TextSpan(
              text: 'uxe', // Huruf setelah "I"
              style: FontFamily.tittle.copyWith(
                color: ColorStyle.blackColor,
              ),
            ),
          ],
        ),
      )),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 20,
            ),
            child: Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                // shadow
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  // Gambar sebagai background
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/image/banner.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 110,
                    ),
                  ),
                  // Teks di atas gambar
                  Positioned(
                    left: 16,
                    top: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '80% OFF',
                          style: FontFamily.tittle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Discount fashion that\nsuits your style',
                            style:
                                FontFamily.text.copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
                  // Tombol di atas gambar
                  Positioned(
                    right: 16,
                    bottom: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Shop Now',
                        style: FontFamily.textButton.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 12, bottom: 12),
            child: Text('Categories', style: FontFamily.subTittle),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Loop through the categories list
                  ...categories.map((category) => Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: CategoryCircleCard(
                          image: category.image,
                          titleCategories: category.name,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 12.0),
            child: Text('New Collections', style: FontFamily.subTittle),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  // Mengambil semua item dari kategori yang berbeda, lalu membatasi hingga 10 item
                  categories
                      .expand((category) => category.items)
                      .take(10)
                      .length,
                  (index) {
                    // Ambil item sesuai dengan index dari gabungan semua items
                    final item = categories
                        .expand((category) => category.items)
                        .take(10)
                        .toList()[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailCollectionScreen(
                                product: item,
                              ),
                            ),
                          );
                        },
                        child: CardItemWidget(
                          discount: item.price,
                          isFavorite: isFavorite,
                          image: item.image,
                          nameCollection: item.name,
                          price:
                              // price - discount , if discount is 0 no show discount
                              'IDR ${(item.price - item.discount).toString()}',
                            
                          totalLike: '105', // atau data sesuai yang diinginkan
                          nameBrand: item.brand,
                          onPress: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
