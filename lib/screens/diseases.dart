import 'package:flutter/material.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  final double imgWidth = 104;
  final double imgHeight = 104;
  final double imgMargin = 5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/classes/healthy.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Healthy",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/classes/early_blight.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Early Blight",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/classes/late_blight.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Late Blight",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/classes/leaf_mold.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Leaf Mold",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/classes/bacterial_spot.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Bacterial Spot",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/classes/mosaic_virus.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Mosaic virus",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image:
                            AssetImage("assets/classes/septoria_leaf_spot.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Septoria Leaf Spot",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/classes/spider_mites.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Spider Mites",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/classes/target_spot.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Target Spot",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image:
                            AssetImage("assets/classes/yellow_leaf_curl.png"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(imgMargin),
                width: imgWidth,
                height: imgHeight,
              ),
              const Text("Yellow Leaf Curl",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
