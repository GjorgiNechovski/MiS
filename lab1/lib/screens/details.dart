import 'package:flutter/material.dart';
import 'package:lab1/models/ClothingItem.dart';

import '../widgets/details/detailsData.dart';
import '../widgets/details/detailsTitle.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as ClothingItem;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "211177",
          style: TextStyle(color: Colors.white70, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.5,
              child: Image.network(arguments.image, fit: BoxFit.contain, alignment: Alignment.center)
            ),

            SizedBox(
              height: screenHeight * 0.1,
              child: DetailTitle(id: arguments.id, name: arguments.title),
            ),

            SizedBox(
              height: screenHeight * 0.4,
              child: DetailData(price: arguments.price, description: arguments.description),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const BackButton(),
    );
  }
}
