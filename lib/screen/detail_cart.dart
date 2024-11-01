import 'package:flutter/material.dart';
import 'package:submission_first/models/data_collection.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/style/font_style.dart';
import 'package:submission_first/widget/button_widget.dart';

class DetailCollectionScreen extends StatefulWidget {
  final Product product;

  const DetailCollectionScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<DetailCollectionScreen> createState() => _DetailCollectionScreenState();
}

class _DetailCollectionScreenState extends State<DetailCollectionScreen> {
  bool isFavorite = false;
  String? selectedSize; // Holds the currently selected size
  @override
  Widget build(BuildContext context) {
    final selectedStock = widget.product.sizes!
        .firstWhere(
          (sizeInfo) => sizeInfo.size == selectedSize,
          orElse: () => SizeInfo(size: "", stock: 0),
        )
        .stock;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name, style: FontFamily.subTittle),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Jika lebar lebih dari 600, maka tampilan horizontal (desktop/tablet)
          bool isWideScreen = constraints.maxWidth > 600;

          return ListView(
            children: [
              isWideScreen
                  ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Gambar produk
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: SizedBox(
                              
                                  height: 450,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          widget.product.image,
                                          fit: BoxFit.cover,
                                          width: 350,
                                          height: 450,
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
                                                size: 16,
                                                color: ColorStyle.errorColor,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                widget.product.like.toString(),
                                                style: FontFamily.text.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            
                            // Informasi produk
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
                                child: buildProductDetails(),
                              ),
                            ),
                          ],
                        ),
                        
                    ],
                  )
                  : Column(
                      children: [
                        Center(
                          child: SizedBox(
                            width: 310,
                            height: 450,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    widget.product.image,
                                    fit: BoxFit.cover,
                                    width: 350,
                                    height: 450,
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
                                          size: 16,
                                          color: ColorStyle.errorColor,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          widget.product.like.toString(),
                                          style: FontFamily.text.copyWith(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, bottom: 12, top: 12, right: 20.0),
                          child: buildProductDetails(),
                        ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }

// Fungsi untuk menampilkan detail produk
  Widget buildProductDetails() {
    final selectedStock = widget.product.sizes!
        .firstWhere(
          (sizeInfo) => sizeInfo.size == selectedSize,
          orElse: () => SizeInfo(size: "", stock: 0),
        )
        .stock;

    return Padding(
      padding: const EdgeInsets.only(
          left: 4.0,
          bottom: 12,
          top: 12,
          right: 4.0 // Mengurangi jarak antara gambar dan teks
          ),
      child: SizedBox(
 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.brand,
                  style: FontFamily.text.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorStyle.blackColor,
                  ),
                ),
                // Atur jarak antara teks nama dan harga
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 24,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              widget.product.name,
              style: FontFamily.text.copyWith(fontSize: 14),
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'IDR ${(widget.product.price - widget.product.discount).toString()}',
                  style: FontFamily.text.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorStyle.errorColor,
                  ),
                ), // Atur jarak antara teks nama dan harga
                // kalau discount = 0 maka tidak perlu tampilkan
                if (widget.product.discount > 0)
                  Text(
                    'IDR ${widget.product.price.toString()}',
                    style: FontFamily.text.copyWith(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey,
                        color: Colors.grey),
                  ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Size",
              style: FontFamily.text.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: ColorStyle.blackColor,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Wrap(
                      spacing: 8, // Spacing between items
                      runSpacing: 8,
                      children: widget.product.sizes!.map((sizeInfo) {
                        final isSelected = sizeInfo.size == selectedSize;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize =
                                  sizeInfo.size; // Update the selected size
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.black
                                  : Colors
                                      .transparent, // Change color if selected
                              border: Border.all(
                                color: ColorStyle.blackColor,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              sizeInfo.size,
                              textAlign: TextAlign.center,
                              style: FontFamily.text.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : ColorStyle.blackColor,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(
                    height:
                        16), // Add space between size options and stock text
                Text(
                  selectedSize != null
                      ? "Stock: $selectedStock"
                      : "Select a size to see stock", // Display stock or a message
                  style: FontFamily.text.copyWith(
                    fontSize: 14,
                    color: selectedSize != null
                        ? ColorStyle.errorColor
                        : ColorStyle.blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Description",
              style: FontFamily.text.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: ColorStyle.blackColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.product.description,
              style: FontFamily.text.copyWith(
                fontSize: 12,
                color: ColorStyle.textColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 4.0, right: 4.0, bottom: 46.0, top: 24),
              child: ButtonWidget(
                title: 'Add to Cart',
                onPressed: () {
                  // Menampilkan SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: ColorStyle.blackColor,
                      content: Text(
                        ' Item Successfully Added to Cart',
                        style: FontFamily.text
                            .copyWith(color: ColorStyle.whiteColor),
                      ),
                      duration: Duration(seconds: 2), // Durasi tampil SnackBar
                      behavior:
                          SnackBarBehavior.floating, // Tipe tampilan SnackBar
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: ColorStyle.whiteColor,
                        onPressed: () {
                          // Tindakan tambahan jika diperlukan
                        },
                      ),
                    ),
                  );

                  // Anda dapat menambahkan kode lainnya di sini jika perlu
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
