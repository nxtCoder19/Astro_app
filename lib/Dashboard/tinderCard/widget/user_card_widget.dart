import 'package:astro_app/Dashboard/CardSection/CardsDetailsPage.dart';
import 'package:astro_app/Dashboard/tinderCard/model/user.dart';
import 'package:astro_app/Dashboard/tinderCard/provider/feedback_position_provider.dart';
import 'package:astro_app/model/MatchesDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCardWidget extends StatelessWidget {
  final MatchesDetails user;
  final bool isUserInFocus;

  const UserCardWidget({
    @required this.user,
    @required this.isUserInFocus,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FeedbackPositionProvider>(context);
    final swipingDirection = provider.swipingDirection;
    final size = MediaQuery.of(context).size;

    return Material(
      child: GestureDetector(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(user.zodiaccard,user)));
      },
              child: Container(
          height: size.height * 0.72,
          width: size.width * 0.95,
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(user.zodiaccard),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black12, spreadRadius: 0.5),
              ],
              gradient: LinearGradient(
                colors: [Colors.black12, Colors.black87],
                begin: Alignment.center,
                stops: [0.4, 1],
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  left: 10,
                  bottom: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildUserInfo(user: user),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16, right: 8),
                        child: Icon(Icons.info, color: Colors.white),
                      )
                    ],
                  ),
                ),
                if (isUserInFocus) buildLikeBadge(swipingDirection)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLikeBadge(SwipingDirection swipingDirection) {
    final isSwipingRight = swipingDirection == SwipingDirection.right;
    final color = isSwipingRight ? Colors.green : Colors.pink;
    final angle = isSwipingRight ? -0.5 : 0.5;

    if (swipingDirection == SwipingDirection.none) {
      return Container();
    } else {
      return Positioned(
        top: 20,
        right: isSwipingRight ? null : 20,
        left: isSwipingRight ? 20 : null,
        child: Transform.rotate(
          angle: angle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 2),
            ),
            child: Text(
              isSwipingRight ? 'LIKE' : 'NOPE',
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget buildUserInfo({@required MatchesDetails user}) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(//'ppp',
              '${user.name}, ${user.zodiac}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(//'kk',
              user.city,
              style: TextStyle(color: Colors.white),
            ),
            // SizedBox(height: 4),
            // Text(//'kkl',
            //   '${user.zodiac}',
            //   style: TextStyle(color: Colors.white),
            // )
          ],
        ),
      );
}
