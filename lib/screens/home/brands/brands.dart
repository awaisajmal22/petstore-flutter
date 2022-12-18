import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/utils/badge.dart';
import 'package:petstore/utils/customeAppBar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ShopByBrands extends StatefulWidget {
  static const routeName = '/brands';

  @override
  State<ShopByBrands> createState() => _ShopByBrandsState();
}

class _ShopByBrandsState extends State<ShopByBrands> {
  Faker fake = Faker();

  List name = List<String>.generate(40, (index) => faker.person.firstName(),
      growable: true);
      final alphabets =
      List.generate(26, (index) => String.fromCharCode(index + 65));
  int _searchIndex = 0;
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  void setSearchIndex(String searchLetter) {
    setState(() {
      _searchIndex = name.indexWhere((element) => element[0] == searchLetter);
      if (_searchIndex > 0) _itemScrollController.jumpTo(index: _searchIndex);
    });
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Shop By Brand', actionButton: Badge(value: 2.toString(), color: Colors.red), searchButton: Container(
        height: 0,
        width: 0,
      )),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: ScrollablePositionedList.builder(
                itemScrollController: _itemScrollController,
                itemPositionsListener: _itemPositionsListener,
                itemCount: name.length,
                itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                       
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    )),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: alphabets
                  .map((alphabet) => InkWell(
                        onTap: () {
                          setSearchIndex(alphabet);
                        },
                        child: Text(
                          alphabet,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
