import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoesplace/views/shared/appstyle.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image});

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1))
          ]),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.image))),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: null,
                        child: const Icon(MaterialCommunityIcons.heart_outline),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: appstyleWithHt(
                            24, Colors.black, FontWeight.bold, 1.1),
                      ),
                      Text(
                        widget.category,
                        style: appstyleWithHt(
                            18, Colors.grey, FontWeight.bold, 1.5),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.price,
                            style: appstyle(24, Colors.black, FontWeight.w600),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Colors",
                              style: appstyle(18, Colors.grey, FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 16, // 원하는 너비로 조정
                              height: 16, // 원하는 높이로 조정
                              child: ChoiceChip(
                                label: const Text(" "),
                                selected: selected,
                                visualDensity: VisualDensity.compact,
                                selectedColor: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
