import 'package:flutter/material.dart';
// TODO  import 'package:vanny_cuisine/pages/dishDetails.dart';
import 'package:vanny_cuisine/util/const.dart';
import 'package:vanny_cuisine/widgets/smooth_star_rating.dart';

class GridProduct extends StatelessWidget {
  final String name;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;
  final int price;

  GridProduct(
      {Key key,
      @required this.name,
      @required this.img,
      @required this.isFav,
      @required this.rating,
      @required this.raters,
      @required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 2.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              "$name     $price",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
          ),
          //TODO ADD FUNCTIONALITY TO ADD REVIEWS
          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
            child: Row(
              children: <Widget>[
                SmoothStarRating(
                  starCount: 5,
                  color: Constants.ratingBG,
                  allowHalfRating: true,
                  rating: rating,
                  size: 10.0,
                ),
                Text(
                  " $rating ($raters Reviews)",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //TODO onTap: () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (BuildContext context) {
      //         return ProductDetails();
      //       },
      //     ),
      //   );
      // },
    );
  }
}
