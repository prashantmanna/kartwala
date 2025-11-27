import 'package:flutter/material.dart';
import 'package:kartwala/controllers/banner_controller.dart';
import 'package:kartwala/models/banner_model.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late Future<List<BannerModel>> futureBanner;

  @override
  void initState() {
    super.initState();

    futureBanner = BannerController().getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 157,
      decoration: BoxDecoration(
        color: Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: FutureBuilder(
        future: futureBanner,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Banners"));
          } else {
            final banners = snapshot.data!;
            return PageView.builder(
              itemCount: banners.length,
              itemBuilder: (context, index) {
                final banner = banners[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.network(banner.imageUrl, fit: BoxFit.cover),
                );
              },
            );
          }
        },
      ),
    );
  }
}
