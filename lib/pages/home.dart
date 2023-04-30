import 'package:flutter/material.dart';
import 'package:learning/models/category_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categoriesSection()
        ],
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 120,
          // color: Colors.red,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: categories[index].boxColor.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: categories[index].icon,
                          // child: SvgPicture.asset(
                          //   categories[index].iconPath,
                          // ),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Column _searchField() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.11),
              spreadRadius: 0.0,
              blurRadius: 40,
            )
          ]),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Search for food',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(LucideIcons.search, color: Colors.grey[400]),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.grey[400],
                        thickness: 1,
                        width: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child:
                            Icon(LucideIcons.filter, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(LucideIcons.chevronLeft,
            size: 20, color: Color(0xff000000)),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(LucideIcons.menu,
                size: 20, color: Color(0xff000000)),
          ),
        ),
      ],
    );
  }
}
