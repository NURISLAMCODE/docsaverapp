import 'package:doc_saver_app/model/file_card.dart';
import 'package:flutter/material.dart';

class FileCardWidget extends StatelessWidget {
  final FileCardModel model;
  const FileCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              spreadRadius: 4,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "images/doc.png",
                  width: 50,
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${model.title}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "${model.subTitle}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    Text(
                      "${model.dateAdded}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
