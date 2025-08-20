import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LabtopScreen extends StatefulWidget {
  LabtopScreen({super.key});

  @override
  State<LabtopScreen> createState() => _LabtopScreenState();
}

class _LabtopScreenState extends State<LabtopScreen> {
  List<Widget> screens = [LabtopScreen(), LabtopScreen()];
  Future<List<dynamic>> getData() async {
    Dio dio = Dio();
    final response = await dio.get(
      'https://elwekala.onrender.com/product/Laptops',
    );
    return response.data['product'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 214, 252),

      appBar: AppBar(
        title: const Text(
          'laptop store',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 214, 252),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data as List;
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          item["image"],
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.attach_money,
                                  color: Colors.green,
                                ),
                                Text(
                                  item["price"].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item["description"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
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
          return Container();
        },
      ),
    );
  }
}
