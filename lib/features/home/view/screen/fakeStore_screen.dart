import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FakestoreScreen extends StatelessWidget {
  FakestoreScreen({super.key});

  Future<List<dynamic>> getData() async {
    Dio dio = Dio();
    final response = await dio.get('https://fakestoreapi.com/products');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 214, 252),
      appBar: AppBar(
        title: const Text(
          'Fake store closed',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),

          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 167, 214, 252),
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
                      Padding(
                        padding: const EdgeInsets.all(11),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                item["title"],
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 66, 116, 204),
                                ),
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  109,
                                  146,
                                  211,
                                ),
                              ),
                              child: Text(
                                item['category'],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          item["image"],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["category"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                                const Spacer(),
                                if (item['rating']['rate'] <= 1)
                                  const Icon(Icons.star, color: Colors.yellow),
                                if (item['rating']['rate'] >= 2 &&
                                    item['rating']['rate'] < 3)
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                    ],
                                  ),
                                if (item['rating']['rate'] > 3 &&
                                    item['rating']['rate'] < 4)
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                    ],
                                  ),
                                if (item['rating']['rate'] >= 4 &&
                                    item['rating']['rate'] < 5)
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                    ],
                                  ),
                                if (item['rating']['rate'] == 5)
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                    ],
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
