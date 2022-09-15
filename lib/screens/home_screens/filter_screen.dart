import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/lists.dart';
import 'package:food_delivery/widgets/home_screen_widgets/top_title_see_all_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const String id = '/filter_screen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            ),
          ),
          title: Column(
            children: const [
              Text(
                'Filters',
                style: TextStyle(color: kBlackColor),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            TopTitleWidget(
              titleText: 'Categories',
              onPressedSeeAll: () {},
              text: 'Clear All',
              textColor: kGreyColor,
            ),
            FilterChipListWidget(
              onSelected: (index, value) {
                setState(() {
                  categories[index]['isSelected'] =
                      !categories[index]['isSelected'];
                });
              },
              list: categories,
            ),
            TopTitleWidget(
              titleText: 'Dietary',
              onPressedSeeAll: () {},
              text: 'Clear All',
              textColor: kGreyColor,
            ),
            FilterChipListWidget(
              onSelected: (index, value) {
                setState(() {
                  categories[index]['isSelected'] =
                      !categories[index]['isSelected'];
                });
              },
              list: dietary,
            ),
          ]),
        ));
  }
}

class FilterChipListWidget extends StatelessWidget {
  const FilterChipListWidget({
    Key? key,
    required this.onSelected,
    required this.list,
  }) : super(key: key);

  final List list;
  final Function(int index, bool value) onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
          list.length,
          (index) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: FilterChip(
                  labelStyle: TextStyle(
                      color: list[index]['isSelected']
                          ? kWhiteColor
                          : kBlackColor),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(list[index]['text']),
                  ),
                  selectedColor: kGreenColor,
                  backgroundColor: list[index]['isSelected']
                      ? kGreenColor
                      : Colors.grey.shade300,
                  onSelected: (value) {
                    onSelected(index, value);
                  },
                ),
              )),
    );
  }
}
