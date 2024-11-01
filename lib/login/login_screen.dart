import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:submission_first/bottomnavbar/bottom_navbar.dart';
import 'package:submission_first/bottomnavbar/home_screen.dart';
import 'package:submission_first/style/color_style.dart';
import 'package:submission_first/style/font_style.dart';
import 'package:submission_first/widget/button_widget.dart';
import 'package:submission_first/widget/text_field_widget.dart';

class BlurredCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Warna lingkaran pertama dengan blur
    final paintCircle1 = Paint()
      ..color = ColorStyle.secondaryColor
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(800),
      ); // Efek blur

    // Warna lingkaran kedua dengan blur
    final paintCircle2 = Paint()
      ..color = ColorStyle.primaryColor // Ganti dengan warna yang diinginkan
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(800),
      ); // Efek blur

    // Warna lingkaran kedua dengan blur
    final paintCircle3 = Paint()
      ..color = ColorStyle.primaryColor // Ganti dengan warna yang diinginkan
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(800),
      ); // Efek blur

    // Warna lingkaran kedua dengan blur
    final paintCircle4 = Paint()
      ..color = ColorStyle.secondaryColor // Ganti dengan warna yang diinginkan
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(800),
      ); // Efek blur

    // Menggambar lingkaran blur pertama
    canvas.drawCircle(const Offset(400, 600), 117.5,
        paintCircle1); // Posisi dan ukuran lingkaran pertama

    // Menggambar lingkaran blur kedua di sebelah kiri
    canvas.drawCircle(const Offset(50, 600), 180,
        paintCircle2); // Posisi dan ukuran lingkaran kedua

    // Menggambar lingkaran blur kedua di sebelah kiri
    canvas.drawCircle(const Offset(50, 29), 120,
        paintCircle3); // Posisi dan ukuran lingkaran kedua

    canvas.drawCircle(const Offset(300, 150), 120,
        paintCircle4); // Posisi dan ukuran lingkaran kedua
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  // Fungsi untuk mengkonversi radius blur ke sigma
  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _showNameError = false;
  bool _showPasswordError = false;
  final _focusNameNode = FocusNode();
  final _focusPasswordNode = FocusNode();
  bool _isVisibility = false;

  @override
  void initState() {
    super.initState();
    _focusNameNode.addListener(() {
      if (!_focusNameNode.hasFocus) {
        _validateInput(); // Periksa input ketika kehilangan fokus
      }
      if (_focusPasswordNode.hasFocus) {
        _validateInput(); // Periksa input ketika kehilangan fokus
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _focusPasswordNode.dispose();
    _focusNameNode.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      _showNameError = _nameController.text.isEmpty;
      _showPasswordError = _passwordController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Mengecek jika lebar lebih dari 600
          bool isWideScreen = constraints.maxWidth > 600;
          return Stack(
            children: [
              CustomPaint(
                size: Size(double.infinity, double.infinity),
                painter: BlurredCirclePainter(),
              ),
              Center(
                child: Container(
                  width: isWideScreen ? 500 : double.infinity,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/image/LuxeLune-Logo.png',
                                  height: 58,
                                  width: 58,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Sign in to continue to your\n account and explore the world',
                              style: FontFamily.text,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            TextFieldWidget(
                              controller: _nameController,
                              focusNode: _focusNameNode,
                              hintText: 'Username',
                              showError: _showNameError,
                              errorText: 'Field is required',
                              onChanged: (text) {
                                setState(() {
                                  _showNameError = text.isEmpty;
                                });
                              },
                              onEditingComplete: _validateInput,
                            ),
                            const SizedBox(height: 12),
                            TextFieldWidget(
                              obscureText: !_isVisibility,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisibility = !_isVisibility;
                                  });
                                },
                                icon: Icon(
                                  _isVisibility
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorStyle.textColor,
                                ),
                              ),
                              controller: _passwordController,
                              focusNode: _focusPasswordNode,
                              hintText: 'Password',
                              showError: _showPasswordError,
                              errorText: 'Field is required',
                              onChanged: (text) {
                                setState(() {
                                  _showPasswordError = text.isEmpty;
                                });
                              },
                              onEditingComplete: _validateInput,
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot Password',
                                  style: FontFamily.text,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            ButtonWidget(
                              title: 'Sign In',
                              onPressed: () {
                                if (_nameController.text.isNotEmpty &&
                                    _passwordController.text.isNotEmpty) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavbarScreen(
                                                activeScreen: 0,
                                              )),
                                      (route) => false);
                                } else {
                                  setState(() {
                                    _showNameError =
                                        _nameController.text.isEmpty;
                                    _showPasswordError =
                                        _passwordController.text.isEmpty;
                                  });
                                }
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: ColorStyle.textColor,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Or',
                              style: FontFamily.text,
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: ColorStyle.textColor,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8.0, // Spasi antara setiap item
                        runSpacing: 8.0, // Spasi antara setiap baris
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: ColorStyle.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/image/google.png',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: ColorStyle.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/image/apple.png',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: ColorStyle.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/image/facebook.png',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
