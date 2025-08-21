import 'package:api_app/features/home/model/datalaptob.dart';
import 'package:api_app/features/home/model/laptob_model.dart';
import 'package:api_app/features/home/view/wedgit/customwidget_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LabtopScreen extends StatefulWidget {
  const LabtopScreen({super.key});

  @override
  State<LabtopScreen> createState() => _LabtopScreenState();
}

class _LabtopScreenState extends State<LabtopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Laptop Store',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 228, 228),
      ),
      body: FutureBuilder<List<laptobModel>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            final laptops = snapshot.data!;
            return ListView.builder(
              itemCount: laptops.length,
              itemBuilder: (context, index) {
                return CustomCard(laptob: laptops[index]);
              },
            );
          }

          return const Center(child: Text("No Data Found"));
        },
      ),
    );
  }
}
