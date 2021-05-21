import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_gift.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class SuggestAFriendScreen extends StatefulWidget {
  @override
  _SuggestAFriendScreenState createState() => _SuggestAFriendScreenState();
}

class _SuggestAFriendScreenState extends State<SuggestAFriendScreen> {
  final _pageMatchRequestController = PageController(viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Navigation bar
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigation(),

        body: Container(
          padding: EdgeInsets.only(
            top: ConfigSize.blockSizeVertical * 2,
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              //App bar
              CustomAppBar(titletext: 'Find a Match'),

              SizedBox(height: ConfigSize.blockSizeVertical * 6),

              //list of friends suggestions
              Container(
                height: ConfigSize.blockSizeVertical * 50,
                width: ConfigSize.blockSizeHorizontal * 90,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _pageMatchRequestController,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Center(child: profileCard());
                  },
                ),
              ),
              SizedBox(height: ConfigSize.blockSizeVertical * 4),

              // Match or Unmatch container
              Container(
                width: ConfigSize.blockSizeHorizontal * 60,
                height: ConfigSize.blockSizeVertical * 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DeclineContainer(onPress: () {
                      context.push((context) => GiftScreen());
                    }),
                    AcceptContainer(onPress: () {
                      context.push((context) => GiftScreen());
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileCard() {
  return Stack(
    children: <Widget>[
      Container(
        height: ConfigSize.blockSizeVertical * 50,
        width: ConfigSize.blockSizeVertical * 50,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 4.0,
          child: Image.asset(
            'assets/images/girl.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: 1.0,
        left: 1.0,
        right: 1.0,
        child: infoContainer(),
      ),
    ],
  );
}

Widget infoContainer() {
  return Container(
    padding: EdgeInsets.all(25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kylie,',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Vx.white,
                  fontSize: 15,
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              'California',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Vx.white,
                fontSize: 15,
                fontFamily: defaultFontFamily,
              ),
            ),
          ],
        ),
        // age
        Text(
          ' 29',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget AcceptContainer({Function onPress}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(70.0),
      ),
      color: red,
    ),
    child: IconButton(
      alignment: Alignment.center,
      icon: Icon(
        Icons.check,
        color: Vx.white,
      ),
      onPressed: () {
        onPress();
      },
    ),
  );
}

Widget DeclineContainer({Function onPress}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(70.0),
      ),
      border: Border.all(color: red),
      color: Vx.white,
    ),
    child: IconButton(
      alignment: Alignment.center,
      icon: Icon(
        Icons.close,
        color: Colors.red,
      ),
      onPressed: () {
        // onPress();
      },
    ),
  );
}

class CustomDialogBox extends StatefulWidget {
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: [
              "Notifications".text.white.size(20).make(),
              "You were Suggested by:".text.white.size(20).make(),
              Container(
                alignment: Alignment.center,
                height: ConfigSize.convertHeight(context, 25),
                width: ConfigSize.convertHeight(context, 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      ConfigSize.convertHeight(context, 15),
                    )),
                child: "1".text.size(13).color(Colors.red.shade400).make(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
