import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartwala/controllers/subCategoryController.dart';
import 'package:kartwala/models/category.dart';
import 'package:kartwala/models/subcategorymodel.dart';
import 'package:kartwala/views/screens/Nav_screens/Widgets/reuseable_text_widget.dart';
import 'package:kartwala/views/screens/detail/screens/screens/innerBannerScreenWidget.dart';
import 'package:kartwala/views/screens/detail/screens/screens/innerHeaderScreenWidget.dart';
import 'package:kartwala/views/screens/detail/screens/screens/subCategoryTileWidget.dart';

class Innercategorycontent extends StatefulWidget {
  final Category category;

  const Innercategorycontent({super.key, required this.category});

  @override
  State<Innercategorycontent> createState() => _InnercategoryscreenState();
}

class _InnercategoryscreenState extends State<Innercategorycontent> {
  late Future<List<Subcategorymodel>> subCategory;
  final Subcategorycontroller subcategorycontroller = Subcategorycontroller();

  void initState() {
    super.initState();
    subCategory = subcategorycontroller.getSubCategoriesByName(
      widget.category.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Innerbannerscreenwidget(image: widget.category.banner),
            Center(
              child: Text(
                "Shop by subcategories",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.7,
                  fontSize: 16,
                ),
              ),
            ),
            FutureBuilder(
              future: subCategory,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No Categories Found"));
                }

                final categoryList = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseableTextWidget(
                      title: "Categories",
                      subTitle: "View All",
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          (categoryList.length / 7).ceil(),
                          (index) {
                            final start = index * 7;
                            final end = (index + 1) * 7;

                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: categoryList
                                    .sublist(
                                      start,
                                      end > categoryList.length
                                          ? categoryList.length
                                          : end,
                                    )
                                    .map(
                                      (subcategories) => Subcategorytilewidget(
                                        image: subcategories.subCategoryImage,
                                        title: subcategories.subcategoryname,
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
