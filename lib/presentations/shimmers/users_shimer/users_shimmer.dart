import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUsers extends StatelessWidget {
  const ShimmerUsers({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (c, i) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey,
            child: ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
              ),
              trailing: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
              ),
              title: Container(
                color: Colors.grey,
                width: size.width,
                height: 10,
              ),
              subtitle: Container(
                color: Colors.grey,
                width: size.width,
                height: 10,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade100,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ));
        },
      ),
    );
  }
}
