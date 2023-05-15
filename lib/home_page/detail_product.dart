import 'package:flutter/material.dart';
import 'package:trainingassignment/navbar.dart';
import '../fetch/model.dart';

class DetailProduct extends StatelessWidget {
  late Products detail;
  late String username = '';
  DetailProduct({Key? key, required this.detail, this.username = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? ScreenArguments()
        : ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    if (args.username.isNotEmpty) username = args.username;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 50),
        child: Navbar(
          username: username,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  detail.image,
                  width: 550,
                  height: 500,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.category,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        detail.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '\$${detail.price}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Description: ${detail.description}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              // alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: const Color(0xFF414042),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 60, // Adjust the height as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          '© 2023 BINUSMART',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
