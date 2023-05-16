import 'package:flutter/material.dart';

class ShopListMoveToPage extends StatelessWidget {
  const ShopListMoveToPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        title: const Text('Przenieś do'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          opacity: 0.4,
          fit: BoxFit.cover,
          image: AssetImage(
            'images/openfridge.jpg',
          ),
        )),
        child: Column(
          children: [
            ShopListMoveToPageItem(
              title: 'Leki',
              onTap: () {},
            ),
            ShopListMoveToPageItem(
              title: 'Napoje',
              onTap: () {},
            ),
            ShopListMoveToPageItem(
              title: 'Produkty długoterminowe',
              onTap: () {},
            ),
            ShopListMoveToPageItem(
              title: 'Produkty lodówkowe',
              onTap: () {},
            ),
            ShopListMoveToPageItem(
              title: 'Słodycze',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ShopListMoveToPageItem extends StatelessWidget {
  const ShopListMoveToPageItem({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: const Color.fromARGB(255, 0, 51, 54),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
