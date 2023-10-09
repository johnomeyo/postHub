import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

class MyPostsShimmer extends StatelessWidget {
  const MyPostsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 100,
                                  height: 20,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            );
  }
}