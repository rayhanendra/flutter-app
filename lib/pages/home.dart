import 'package:flutter/material.dart';
import 'package:learning/models/category_model.dart';
import 'package:learning/models/diet_model.dart';
import 'package:learning/models/popular_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialState() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialState();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categoriesSection(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popularDietSection()
        ],
      ),
    );
  }

  Column _popularDietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Popular Diets',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
        const SizedBox(height: 15),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                  color: popularDiets[index].boxIsSelected
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: popularDiets[index].boxIsSelected
                      ? [
                          BoxShadow(
                            color: const Color(0xff1D1617).withOpacity(0.07),
                            offset: const Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0,
                          )
                        ]
                      : []),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    popularDiets[index].icon,
                    size: 60,
                    color: Colors.green[400],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                        style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: const Icon(
                      LucideIcons.chevronRight,
                      size: 30,
                      color: Color(0xff7B6F72),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 25),
          itemCount: popularDiets.length,
          padding: const EdgeInsets.only(left: 20, right: 20),
        ),
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          // color: Colors.blue,
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            diets[index].icon,
                            size: 60,
                            color: Colors.green[400],
                          ),
                          // child: SvgPicture.asset(
                          //   categories[index].iconPath,
                          // ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            diets[index].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                            style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              diets[index].viewIsSelected
                                  ? const Color(0xff9DCEFF)
                                  : Colors.transparent,
                              diets[index].viewIsSelected
                                  ? const Color(0xff92A3FD)
                                  : Colors.transparent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: diets[index].viewIsSelected
                                  ? Colors.white
                                  : const Color(0xffC58BF2),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
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
        SizedBox(
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
              suffixIcon: SizedBox(
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
