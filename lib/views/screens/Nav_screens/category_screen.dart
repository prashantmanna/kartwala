import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartwala/controllers/category_controller.dart';
import 'package:kartwala/controllers/subCategoryController.dart';
import 'package:kartwala/models/category.dart';
import 'package:kartwala/models/subcategorymodel.dart';
import 'package:kartwala/views/screens/Nav_screens/Widgets/Header_widgets.dart';

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
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: subCategory.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 4,
                              ),
                          itemBuilder: (context, index) {
                            final subCategoriesData = subCategory[index];
                            return Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Center(
                                    child: Image.network(
                                      subCategoriesData.subCategoryImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    subCategoriesData.subcategoryname,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
