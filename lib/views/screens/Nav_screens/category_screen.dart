import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartwala/controllers/category_controller.dart';
import 'package:kartwala/controllers/subCategoryController.dart';
import 'package:kartwala/models/category.dart';
import 'package:kartwala/models/subcategorymodel.dart';
import 'package:kartwala/views/screens/Nav_screens/Widgets/Header_widgets.dart';
import 'package:kartwala/views/screens/detail/screens/screens/subCategoryTileWidget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> categories;
  List<Subcategorymodel> subCategory = [];
  final Subcategorycontroller subcategorycontroller = Subcategorycontroller();
  Category? categorySelected;

  @override
  void initState() {
    super.initState();
    categories = CategoryController().loadCatogaries();

    categories.then((category) {
      for (var i in category) {
        if (i.name == "Laptops") {
          setState(() {
            categorySelected = i;
          });

          //load sub category for the laptops
          loadSubCategories(i.name);
        }
      }
    });
  }

  //load subCategory
  Future<void> loadSubCategories(String categoryName) async {
    final subCategories = await subcategorycontroller.getSubCategoriesByName(
      categoryName,
    );

    setState(() {
      subCategory = subCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 20),
        child: HeaderWidgets(),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey.shade200,
              child: FutureBuilder(
                future: categories,
                builder: (index, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error ${snapshot.error}"));
                  } else {
                    final category = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final data = category[index];
                        return ListTile(
                          title: Text(
                            data.name,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: categorySelected == data
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              categorySelected = data;
                              loadSubCategories(data.name);
                            });
                          },
                        );
                      },
                      itemCount: category!.length,
                    );
                  }
                },
              ),
            ),
          ),
          //right side
          Expanded(
            flex: 5,
            child: categorySelected != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categorySelected!.name,
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.7,
                            ),
                          ),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(categorySelected!.banner),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          subCategory.isNotEmpty
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: subCategory.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 4,
                                        childAspectRatio: 2 / 3,
                                      ),
                                  itemBuilder: (context, index) {
                                    final subCategoriesData =
                                        subCategory[index];
                                    return Subcategorytilewidget(
                                      image: subCategoriesData.subCategoryImage,
                                      title: subCategoriesData.subcategoryname,
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                    "No Sub Categories",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.7,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
