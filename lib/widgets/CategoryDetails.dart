import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jayzapp/screens/product.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';

import 'DrawerWidget.dart';

class CategoryDeatils extends StatefulWidget {
  CategoryDeatils({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  _CategoryDeatilsState createState() => _CategoryDeatilsState();
}

class _CategoryDeatilsState extends State<CategoryDeatils> {
  List<Product> searchedProducts = [];

  @override
  void initState() {
    super.initState();
    if (widget.product.category == "Premium Burgers"){
      searchedProducts = premiumBurger;
      print(premiumBurger.length);
    }
    else if(widget.product.category=="Burgers"){
      searchedProducts = burger;
    }
    else if(widget.product.category=="Pizzas"){
      searchedProducts = pizza;
    }
    else if(widget.product.category=="Deals"){
      searchedProducts=deal;
      ;
    }
    else if(widget.product.category=="Wraps"){
      searchedProducts = wrap;
    }
    else if(widget.product.category=="BreakFast"){
      searchedProducts = breakFast;
    }
    else if(widget.product.category=="Desserts"){
      searchedProducts = dessert;
    }
    else if(widget.product.category=="Shakes"){
      searchedProducts = shake;
    }
    else if(widget.product.category=="Salads"){
      searchedProducts = salad;
    }

    // Display all products by default
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (widget.product.category == "Premium Burgers") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              AppBarWidget(),
              // Search Bar
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          // Filter the lists based on the search value
                          searchedProducts = premiumBurger
                              .where((product) => product.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: GestureDetector(
                          onTap: () {
                            // Handle the search icon tap
                          },
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.red,
                          ),
                        ),
                        hintText: 'What would you like to have?',
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.filter_list),
                      ),
                    ),
                  ),
                ),
              ),
               if (searchedProducts.isEmpty)
                 Text('No products found.'),
              if (searchedProducts.isNotEmpty)
                Column(
                  children: List<Widget>.generate(
                    ((searchedProducts.length ) / 2).ceil(),
                        (index) {
                      final startIndex = index * 2;
                      final endIndex = startIndex + 1;
                      final productsInRow = searchedProducts.sublist(
                        startIndex,
                        endIndex < searchedProducts.length ? endIndex + 1 : endIndex,
                      );
                      return Row(
                        children: productsInRow.map((product) {
                          return Expanded(
                            child: OneCategory(product, context),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),

            ],
          ),
        ),
      );
    }
    else if (widget.product.category == "Burgers") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children: [
                AppBarWidget(),
                //Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            // Filter the lists based on the search value
                            searchedProducts = burger
                                .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Handle the search icon tap
                            },
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'What would you like to have?',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.filter_list),
                        ),
                      ),
                    ),
                  ),
                ),
                if (searchedProducts.isEmpty)
                  Text('No products found.'),
                if (searchedProducts.isNotEmpty)
                  Column(
                    children: List<Widget>.generate(
                      ((searchedProducts.length ) / 2).ceil(),
                          (index) {
                        final startIndex = index * 2;
                        final endIndex = startIndex + 1;
                        final productsInRow = searchedProducts.sublist(
                          startIndex,
                          endIndex < searchedProducts.length ? endIndex + 1 : endIndex,
                        );
                        return Row(
                          children: productsInRow.map((product) {
                            return Expanded(
                              child: OneCategory(product, context),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),

              ]
          ),
        ),
      );
    }
    else if (widget.product.category == "Pizzas") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children: [
                AppBarWidget(),
                //Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            // Filter the lists based on the search value
                            searchedProducts = pizza
                                .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Handle the search icon tap
                            },
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'What would you like to have?',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.filter_list),
                        ),
                      ),
                    ),
                  ),
                ),
                if (searchedProducts.isEmpty)
                  Text('No products found.'),
                if (searchedProducts.isNotEmpty)
                  Column(
                    children: List<Widget>.generate(
                      ((searchedProducts.length ) / 2).ceil(),
                          (index) {
                        final startIndex = index * 2;
                        final endIndex = startIndex + 1;
                        final productsInRow = searchedProducts.sublist(
                          startIndex,
                          endIndex < searchedProducts.length ? endIndex + 1 : endIndex,
                        );
                        return Row(
                          children: productsInRow.map((product) {
                            return Expanded(
                              child: OneCategory(product, context),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),

              ]
          ),
        ),
      );
    }
    else if (widget.product.category == "Deals") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children: [
                AppBarWidget(),
                //Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            // Filter the lists based on the search value
                            searchedProducts = deal
                                .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Handle the search icon tap
                            },
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'What would you like to have?',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.filter_list),
                        ),
                      ),
                    ),
                  ),
                ),
                if (searchedProducts.isEmpty)
                  Text('No products found.'),
                if (searchedProducts.isNotEmpty)
                  Column(
                    children: List<Widget>.generate(
                      ((searchedProducts.length )/ 2).ceil(),
                          (index) {
                        final startIndex = index * 2;
                        final endIndex = startIndex + 1;
                        final productsInRow = searchedProducts.sublist(
                          startIndex,
                          endIndex < searchedProducts.length ? endIndex + 1 : endIndex,
                        );
                        return Row(
                          children: productsInRow.map((product) {
                            return Expanded(
                              child: OneCategory(product, context),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
              ]
          ),
        ),
      );
    }
    else if (widget.product.category == "Wraps") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children:[
                AppBarWidget(),
                //Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            // Filter the lists based on the search value
                            searchedProducts = wrap
                                .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Handle the search icon tap
                            },
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'What would you like to have?',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.filter_list),
                        ),
                      ),
                    ),
                  ),
                ),
                if (searchedProducts.isEmpty)
                  Text('No products found.'),
                if (searchedProducts.isNotEmpty)
                  Column(
                    children: List<Widget>.generate(
                      ((searchedProducts.length )/ 2).ceil(),
                          (index) {
                        final startIndex = index * 2;
                        final endIndex = startIndex + 1;
                        final productsInRow = searchedProducts.sublist(
                          startIndex,
                          endIndex < searchedProducts.length ? endIndex + 1 : endIndex,
                        );
                        return Row(
                          children: productsInRow.map((product) {
                            return Expanded(
                              child: OneCategory(product, context),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
              ]
          ),
        ),
      );
    }
    else if (widget.product.category == "BreakFast") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children: [
                AppBarWidget(),
                //Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            // Filter the lists based on the search value
                            searchedProducts = breakFast
                                .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Handle the search icon tap
                            },
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'What would you like to have?',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.filter_list),
                        ),
                      ),
                    ),                  ),
                ),
                if (searchedProducts.isEmpty)
                  Text('No products found.'),
                if (searchedProducts.isNotEmpty)
                  Column(
                    children: List<Widget>.generate(
                      ((searchedProducts.length )/ 2).ceil(),
                          (index) {
                        final startIndex = index * 2;
                        final endIndex = startIndex + 1;
                        final productsInRow = searchedProducts.sublist(
                          startIndex,
                          endIndex < searchedProducts.length ? endIndex + 1 : endIndex,
                        );
                        return Row(
                          children: productsInRow.map((product) {
                            return Expanded(
                              child: OneCategory(product, context),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
              ]
          ),
        ),
      );
    }
    else if (widget.product.category == "Desserts") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children: [
                AppBarWidget(),
                //Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            // Filter the lists based on the search value
                            searchedProducts = dessert
                                .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Handle the search icon tap
                            },
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'What would you like to have?',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.filter_list),
                        ),
                      ),
                    ),
                  ),
                ),
                if (searchedProducts.isEmpty)
                  Text('No products found.'),
                if (searchedProducts.isNotEmpty)
                  Column(
                    children: List<Widget>.generate(
                      ((searchedProducts.length )/ 2).ceil(),
                          (index) {
                        final startIndex = index * 2;
                        final endIndex = startIndex + 1;
                        final productsInRow = searchedProducts.sublist(
                          startIndex,
                          endIndex < searchedProducts.length ? endIndex + 1 : endIndex,
                        );
                        return Row(
                          children: productsInRow.map((product) {
                            return Expanded(
                              child: OneCategory(product, context),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
              ]
          ),
        ),
      );
    }
    else if (widget.product.category == "Shakes") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children: [
                AppBarWidget(),
                //Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            // Filter the lists based on the search value
                            searchedProducts = shake
                                .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Handle the search icon tap
                            },
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'What would you like to have?',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.filter_list),
                        ),
                      ),
                    ),
                  ),
                ),
                if (searchedProducts.isEmpty)
                  Text('No products found.'),
                if (searchedProducts.isNotEmpty)
                  Column(
                    children: List<Widget>.generate(
                      ((searchedProducts.length )/ 2).ceil(),
                          (index) {
                        final startIndex = index * 2;
                        final endIndex = startIndex + 1;
                        final productsInRow = searchedProducts.sublist(
                          startIndex,
                          endIndex < searchedProducts.length ? endIndex + 1 : endIndex,
                        );
                        return Row(
                          children: productsInRow.map((product) {
                            return Expanded(
                              child: OneCategory(product, context),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
              ]
          ),
        ),
      );
    }
    else if (widget.product.category == "Salads") {
      body = SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              children: [
                AppBarWidget(),
                //Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            // Filter the lists based on the search value
                            searchedProducts = salad
                                .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // Handle the search icon tap
                            },
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'What would you like to have?',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.filter_list),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    OneCategory(salad[0],context),
                    OneCategory(salad[0],context),
                  ],
                ),
                Row(
                  children: [
                    OneCategory(salad[0],context),
                    OneCategory(salad[0],context),
                  ],
                ),
                Row(
                  children: [
                    OneCategory(salad[0],context),
                    OneCategory(salad[0],context),
                  ],
                ),
                Row(
                  children: [
                    OneCategory(salad[0],context),
                    //OneCategory(salad[0],context),
                  ],
                ),

              ]
          ),
        ),
      );
    }
    else {
      body = Center(
        child: Text('Category is not specified'),
      );
    }

    return Scaffold(
      body: body,
      drawer: DrawerWidget(),
    );
  }
}
