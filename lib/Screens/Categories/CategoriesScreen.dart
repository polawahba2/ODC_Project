import 'package:flutter/material.dart';
import 'package:odc_project/Compounent/CategoryImageAndText.dart';

import '../../Compounent/Consts.dart';
import '../CourseInformationsWithSearch/CourseInformationsWithSearch.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(color: K_BLACK_Color, fontSize: 19),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: K_BLACK_Color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Align(
        alignment: AlignmentDirectional.topCenter,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: size.height * 0.3,
            mainAxisExtent: size.height * 0.18,
            childAspectRatio: 3 / 2,
            // crossAxisSpacing: 20,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                pushOnly(route: const CourseInformations(), context: context);
              },
              child: CategoryImageAndText(
                text: 'Web Development ',
                textSize: 15,
              ),
            );
          },
          itemCount: 7,
        ),
      ),
    );
  }
}


/**
GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: Text(myProducts[index]["name"]),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              );
            }),
 */