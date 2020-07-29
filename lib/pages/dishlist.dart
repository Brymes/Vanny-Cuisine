import 'package:flutter/material.dart';
import 'package:vanny_cuisine/widgets/grid_list.dart';
import 'package:vanny_cuisine/util/foods.dart';

//TODO ADD SEARCH FUNCTION FOR DISHES
//TODO THE PLeasure of variety In Your Plate

//TODO  ADD SPACE FOR PORTIONS AND ECONOMIC ADVICE
class Dishes extends StatefulWidget {
  static const String routeName = "/dishes";
  @override
  _DishesState createState() => _DishesState();
}

class _DishesState extends State<Dishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dishes",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Text(
              "Meals",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: foodsMeals.length,
              itemBuilder: (BuildContext context, int index) {
                Map foodMeals = foodsMeals[index];
                return GridProduct(
                  img: foodMeals['img'],
                  isFav: false,
                  name: foodMeals['name'],
                  price: foodMeals['price'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
            SizedBox(height: 20.0),
            Text(
              "Soups",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: foodsSoups.length,
              itemBuilder: (BuildContext context, int index) {
                Map foodSoups = foodsSoups[index];
                return GridProduct(
                  img: foodSoups['img'],
                  isFav: false,
                  name: foodSoups['name'],
                  price: foodSoups['price'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
            SizedBox(height: 20.0),
            Text(
              "Sides",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: foodsSides.length,
              itemBuilder: (BuildContext context, int index) {
                Map foodSides = foodsSides[index];
                return GridProduct(
                  img: foodSides['img'],
                  isFav: false,
                  name: foodSides['name'],
                  price: foodSides['price'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
            SizedBox(height: 20.0),
            Text(
              "Proteins",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: foodsProteins.length,
              itemBuilder: (BuildContext context, int index) {
                Map foodProteins = foodsProteins[index];
                return GridProduct(
                  img: foodProteins['img'],
                  isFav: false,
                  name: foodProteins['name'],
                  price: foodProteins['price'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
