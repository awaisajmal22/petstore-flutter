import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petstore/utils/app_text.dart';

class Sort extends StatefulWidget {
  const Sort({super.key, required this.title, required this.done});
  final String title;
  final Function()? done;

  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  int? sortValue;
  int? value;
  int? value2;
  int? value3;
  bool tile1 = false;
  bool tile2 = false;
  bool tile3 = false;
  @override
  Widget build(BuildContext context) {
    var tile1Style = ['Brand', 'Pet', 'Bread Sized'];
    var sortingStyle = [
      'Price Low to High',
      'Price high to Low',
      'Name A to Z',
      'Name Z to A',
      'Reset Sort',
    ];
    var pets = ['Dog', 'Cat'];
    var breadSized = ['Small', 'Extra Small'];
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
          title: pageTitle(text: widget.title),
          centerTitle: true,
          actions: [
            Center(
              child: GestureDetector(
                onTap: widget.done,
                child: Text('Done'),
              ),
            ),
            SizedBox(width: width * 0.030,)
          ],
        ),
        body: widget.title == 'Sort' ? sorting(width, sortingStyle) : filterBody(tile1Style, width, pets, breadSized));
  }

  Container filterBody(List<String> tile1Style, double width, List<String> pets, List<String> breadSized) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.030),
      child: Column(
          children: [
            //Brand
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                onExpansionChanged: (val) {
                  setState(() {
                    tile1 = val;
                  });
                },
                title: Text(
                  tile1Style[0],
                ),
                trailing:
                    tile1 ? Icon(Icons.remove) : Icon(Icons.add),
                children: List.generate(1, (index) {
                  return Column(
                    children: [
                      index == 0
                          ? Container(
                              height: 1,
                              width: width,
                              color: Colors.black45,
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.060),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print("click00");

                                setState(() {
                                  value2 = index;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  appText(text: 'ROYAL CANIN'),
                                  Radio(
                                      value: index,
                                      groupValue: value,
                                      onChanged: (val) {
                                        setState(() {
                                          value = val;
                                        });
                                      })
                                ],
                              ),
                            ),
                            Container(
                              width: width,
                              height: 1,
                              color: Colors.black45,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            tile1 == false
                ? Container(
                    width: width,
                    height: 1,
                    color: Colors.black45,
                  )
                : Container(),
            //Pets
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                onExpansionChanged: (val) {
                  setState(() {
                    tile2 = val;
                  });
                },
                title: Text(
                  tile1Style[1],
                ),
                trailing:
                    tile2 ? Icon(Icons.remove) : Icon(Icons.add),
                children: List.generate(2, (index) {
                  return Column(
                    children: [
                      index == 0
                          ? Container(
                              height: 1,
                              width: width,
                              color: Colors.black45,
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.060),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print("click00");

                                setState(() {
                                  value2 = index;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  appText(text: pets[index]),
                                  Radio(
                                      value: index,
                                      groupValue: value2,
                                      onChanged: (val) {
                                        setState(() {
                                          value2 = val;
                                        });
                                      })
                                ],
                              ),
                            ),
                            Container(
                              width: width,
                              height: 1,
                              color: Colors.black45,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            tile2 == false
                ? Container(
                    width: width,
                    height: 1,
                    color: Colors.black45,
                  )
                : Container(),
            //Bread Sized
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                onExpansionChanged: (val) {
                  setState(() {
                    tile3 = val;
                  });
                },
                title: Text(
                  tile1Style[2],
                ),
                trailing:
                    tile3 ? Icon(Icons.remove) : Icon(Icons.add),
                children: List.generate(2, (index) {
                  return Column(
                    children: [
                      index == 0
                          ? Container(
                              height: 1,
                              width: width,
                              color: Colors.black45,
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.060),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print("click00");

                                setState(() {
                                  value2 = index;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  appText(text: breadSized[index]),
                                  Radio(
                                      value: index,
                                      groupValue: value3,
                                      onChanged: (val) {
                                        setState(() {
                                          value3 = val;
                                        });
                                      })
                                ],
                              ),
                            ),
                            Container(
                              width: width,
                              height: 1,
                              color: Colors.black45,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            tile2 == false
                ? Container(
                    width: width,
                    height: 1,
                    color: Colors.black45,
                  )
                : Container(),
          ],
        ),
    );
  }

  Padding sorting(double width, List<String> sortingStyle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.030, vertical: 20),
      child: ListView.builder(
          itemCount: sortingStyle.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    print("click00");

                    setState(() {
                      sortValue = index;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(text: sortingStyle[index]),
                      Radio(
                          value: index,
                          groupValue: sortValue,
                          onChanged: (val) {
                            setState(() {
                              sortValue = val;
                            });
                          })
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: width * 0.020),
                //   width: width,
                //   height: 1,
                //   color: Colors.black45,
                // ),
              ],
            );
          }),
    );
  }
}
