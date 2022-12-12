import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';
import 'package:readmore/readmore.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.time,
    required this.color,
    required this.date,
  });
  final String image;
  final String name;
  final String price;
  final String time;
  final int color;
  final String date;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: SvgPicture.string(
                      Jdenticon.toSvg(image),
                      fit: BoxFit.fill,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const Gap(15),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: size.width < 380
                              ? size.width * 0.2
                              : size.width * 0.43,
                          child: ReadMoreText(
                            name,
                            trimLines: 1,
                            trimCollapsedText: '...',
                            trimExpandedText: ' ...',
                            delimiter: " ",
                            trimMode: TrimMode.Line,
                            style: const TextStyle(
                              color: Color(0xFF041a0e),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                            color: Color(0xFF979797),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          price,
                          style: const TextStyle(
                            color: Color(0xFF041a0e),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          date,
                          style: const TextStyle(
                            color: Color(0xFF979797),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
      ],
    );
  }
}
