import 'package:flutter/material.dart';
import 'package:hacktoon/presentation/Plan/view/add_new_plan.dart';
import 'package:hacktoon/presentation/Plan/view/plan.dart';
import 'package:hacktoon/presentation/home/view/widgets/current_plan.dart';

import 'package:hacktoon/presentation/home/view/widgets/imag_description.dart';
import 'package:hacktoon/presentation/home/view/widgets/show_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> images;
  late List<ImgDescription> imgDescription;

  @override
  void initState() {
    images = [
      "lib/Images/japen.jpg",
      "lib/Images/frensh.jpg",
      "lib/Images/egypt.jpg",
    ];
    imgDescription = [
      ImgDescription("Japen", "Tokyo", 4.9, 2000),
      ImgDescription("French", "Paris", 4.9, 1000),
      ImgDescription("Egypt", "Cairo", 5, 500),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(right: 30),
              title: Text(
                "Hi, Amir",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              subtitle: Text(
                "Explore The World Of Travels",
                style: TextStyle(fontSize: 15, color: Color(0xffA29B9A)),
              ),
              trailing: SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset("lib/Images/gg.jpg", fit: BoxFit.cover),
                ),
              ),
            ),

            CurrentPlan(
              img: imgDescription[0],
              showImgDetails: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreatePlanScreen()),
              ),
              imglink: images[0],
            ),

            Padding(
              padding: EdgeInsets.only(left: 5, right: 25, top: 25, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Travels",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 15, color: Color(0xffA29B9A)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              width: 400,
              child: ListView.builder(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowImageDetails(
                            imagePath: images[i],
                            imgDescription: imgDescription[i],
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(images[i]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffCAC3C2),
                                spreadRadius: -2,
                                blurRadius: 10,
                                offset: Offset(0, 10),
                              ),
                              BoxShadow(
                                color: Color(0xffCAC3C2),
                                spreadRadius: -6,
                                blurRadius: 10,
                                offset: Offset(10, 8),
                              ),
                              BoxShadow(
                                color: Color(0xffCAC3C2),
                                spreadRadius: -6,
                                blurRadius: 10,
                                offset: Offset(-10, 8),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          width: 265,
                          left: 30,
                          height: 90,
                          bottom: 10,
                          child: Container(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black.withValues(alpha: .6),
                            ),
                            child: Column(
                              spacing: 10,
                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    Text(
                                      "${imgDescription[i].country},",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      imgDescription[i].city,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    Text(
                                      "${imgDescription[i].city},",
                                      style: TextStyle(color: Colors.grey),
                                    ),

                                    SizedBox(width: 100),

                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    Text(
                                      "${imgDescription[i].rate}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => AddNewPlan()));
                },
                child: const Text(
                  "New Plan",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
