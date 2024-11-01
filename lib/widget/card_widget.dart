import 'package:flutter/material.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/style/font_style.dart';

class CategoryCircleCard extends StatelessWidget {
  final String image;
  final String titleCategories;
  const CategoryCircleCard(
      {super.key, required this.image, required this.titleCategories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorStyle.blackColor,
              width: 3, // Ketebalan garis
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              image,
              width: 100,
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Text(titleCategories, style: FontFamily.tittleCategoris),
      ],
    );
  }
}

class CardItemWidget extends StatelessWidget {
  final String image;
  final String nameCollection;
  final String price;
  final String totalLike;
  final String nameBrand;
  final VoidCallback onPress;
  final bool isFavorite;
  final int discount;

  CardItemWidget(
      {super.key,
      required this.discount,
      required this.isFavorite,
      required this.image,
      required this.nameCollection,
      required this.price,
      required this.totalLike,
      required this.nameBrand,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    //hitung finalPrice = prce - discount

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          height: 300,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 300,
                ),
              ),
              Positioned(
                left: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
               
                    children: [
                      const Icon(
                        Icons.favorite,
                        size: 12,
                        color: ColorStyle.errorColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        totalLike,
                        style: FontFamily.text.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Informasi produk di bawah gambar
        Padding(
          padding: const EdgeInsets.only(
            left: 4.0, bottom: 12,
            top: 4, // Mengurangi jarak antara gambar dan teks
          ),
          child: SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nameBrand,
                      style: FontFamily.text.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorStyle.blackColor,
                      ),
                    ),
                    // Atur jarak antara teks nama dan harga
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: onPress, // Menggunakan callback dari parent
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  nameCollection,
                  style: FontFamily.text.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Original price
                    Text(
                      price,
                      style: FontFamily.text.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ColorStyle.errorColor,
                      ),
                    ),
                    // Discounted price with conditional display
                    if (discount != 0)
                      Text(
                        discount.toString(),
                        style: FontFamily.text.copyWith(
                          // warna line-through nya diubah menjadi abu-abu
                          decoration: TextDecoration.lineThrough,
                          
                          decorationColor: Colors.grey,
                         

                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
