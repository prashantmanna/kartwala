import 'package:flutter/material.dart';

class Innerheaderscreenwidget extends StatelessWidget {
  const Innerheaderscreenwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      child: Stack(
        children: [
          Image.asset(
            "assets/icons/searchBanner.jpeg",
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 1,
            top: 63,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          Positioned(
            left: 45,
            top: 60,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 130,
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search for products",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.camera_alt_outlined),
                  contentPadding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 0,
                    bottom: 0,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 330,
            top: 67,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                overlayColor: WidgetStateProperty.all(
                  Colors.grey.withOpacity(0.3),
                ),
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/bell.png"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 370,
            top: 67,

            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                overlayColor: WidgetStateProperty.all(
                  Colors.grey.withOpacity(0.3),
                ),
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/message.png"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
