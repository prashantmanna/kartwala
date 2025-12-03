import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartwala/controllers/category_controller.dart';
import 'package:kartwala/models/category.dart';
import 'package:kartwala/views/screens/Nav_screens/Widgets/reuseable_text_widget.dart';
import 'package:kartwala/views/screens/detail/screens/innerCategoryScreen.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({super.key});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  late Future<List<Category>> categories;

  @override
  void initState() {
    super.initState();
    categories = CategoryController().loadCatogaries();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: categories,
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
            ReuseableTextWidget(title: "Categories", subTitle: "View All"),
            GridView.builder(
              itemCount: categoryList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final data = categoryList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Innercategoryscreen(category: data);
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.network(data.image, height: 67, width: 67),
                      Text(
                        data.name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
