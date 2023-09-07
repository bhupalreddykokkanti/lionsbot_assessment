import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lionsbot_assessment/Utililties/Utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'Login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late TabController _tabController;
  List documentdata = [];

  var userData = {
    "id": 1,
    "name": "Victoria Robertson",
    "clean_hours": 18,
    "profile_picture": "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
  };

  List documentdata1 = [
    {
      "id": 1,
      "title": "Successful Operation",
      "description": "+10 Points. Successfully operated on robots without any issues.",
      "datetime": "8 mins ago",

    },
    {
      "id": 2,
      "title": "Cleaning Spree",
      "description": "+50 Points using robot daily!",
      "datetime": "12 mins ago",
    },
    {
      "id": 3,
      "title": "Welcome Reward",
      "description": "+40 Points to test your journey with us.",
      "datetime": "12 mins ago",
    },
    {
      "id": 4,
      "title": "Welcome Reward",
      "description": "+20 Points to kickstart your journey with us.",
      "datetime": "12 mins ago",
    },

  ];

  List documentdata2 = [
    {
      "id": 1,
      "title": "Successful Operation badge",
      "description": "+10 Points. Successfully operated on robots without any issues.",
      "datetime": "8 mins ago",

    },
    {
      "id": 2,
      "title": "Cleaning Spree badge",
      "description": "+50 Points using robot daily!",
      "datetime": "12 mins ago",
    },
    {
      "id": 3,
      "title": "Welcome Reward badge",
      "description": "+40 Points to test your journey with us.",
      "datetime": "12 mins ago",
    },
    {
      "id": 4,
      "title": "Welcome Reward badge",
      "description": "+20 Points to kickstart your journey with us.",
      "datetime": "12 mins ago",
    },

  ];

  @override
  void initState() {
    documentdata = documentdata1;
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.index = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.33,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                        AssetImage("assets/bg.jpeg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: height * 0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Home',
                            style: Utils.getTitleFont(Colors.white),),
                        ),
                        Text('Profile',
                          style:  Utils.getHeaderFont(),),
                        GestureDetector(
                          onTap: (){
                            logoutAlert(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text('Logout',
                              style: Utils.getTitleFont(Colors.white),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),
                    Container(
                      // decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(userData['profile_picture'].toString()),
                              fit: BoxFit.fill
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      child: Text(
                          userData['name'].toString(),
                          style: new TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = LinearGradient(
                                colors: <Color>[
                                  Colors.blue,
                                  Colors.purple,
                                  Colors.red,
                                  Colors.orange
                                  //add more color here.
                                ],
                              ).createShader(Rect.fromLTWH(0.0, 20.0, 500.0, 300.0))
                          )

                      ),
                    ),
                    SizedBox(height: height * 0.0125),
                    Container(
                      child: Text(
                          "Cleaning hours: ${userData['clean_hours'].toString()}",
                          style: Utils.getTitleFont(Colors.black)

                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 240, 240, 1),
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      margin: EdgeInsets.only(
                          left: 40.0,
                          right: 40.0,
                          top: 22.0,
                          bottom: 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TabBar(
                          onTap: (index) async {
                            setState(() {
                              _tabController.index = index;
                              //setInactiveColor(index);
                              if(index == 0){
                                documentdata = documentdata1;
                              }else{
                                documentdata = documentdata2;
                              }
                            });
                          },
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          controller: _tabController,
                          physics: NeverScrollableScrollPhysics(),
                          indicator: BoxDecoration(

                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                            color: Colors.white,
                          ),
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(
                              height: 40,
                              text: 'Points',
                            ),
                            Tab(
                              height: 40,
                              text: 'Badges',
                            ),
                          ],

                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(left: 0.0, right: 0.0),
                          height: (documentdata?.length ?? 0) * 85,
                          child: ListView.builder(
                              shrinkWrap: false,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: documentdata?.length ?? 0,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () async {

                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        height: 65,
                                        child: Container(
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 40.0),
                                                child: Container(
                                                  child: InkWell(
                                                    onTap: () async {
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              width: 50,
                                                              height: 50,
                                                              child: ClipRRect(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      10), // Image border
                                                                  child: SvgPicture
                                                                      .asset(
                                                                    'assets/add.svg',
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Flexible(
                                                                        flex:1,
                                                                        child: Text(
                                                                            '${documentdata?[index]['title']}',
                                                                            maxLines: 1,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: Utils.getTitleFont(Colors.black)),
                                                                      ),

                                                                      Text(
                                                                          '${documentdata?[index]['datetime']}',
                                                                          style: Utils.getSubTitleFont(Color(
                                                                              0xffC5C5C5))),
                                                                    ],
                                                                  ),
                                                                  /*documentdata?[index]
                                                                      .image !=
                                                                      null
                                                                      ? */Container(
                                                                    margin: EdgeInsets.only(top: 5),
                                                                    child: Text(
                                                                        '${documentdata?[index]['description']}',
                                                                        maxLines: 2,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: Utils.getSubTitleFont(Color(
                                                                            0xff27282A))),
                                                                  )

                                                                ],
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              width: 50,
                                                              height: 2,
                                                            ),
                                                            Expanded(
                                                              child: Divider(height: 1,),
                                                            ),

                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                );
                              })),
                    ),

                  ],

                )
              ],

            ),
          ],
        ),
      ),
    );
  }

  logoutAlert(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        // Navigator.of(context).pop();
        // Navigator.pop(context);
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed:  () {
        pushNewScreen(context,
            screen: Login(), withNavBar: false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("LionsBot"),
      content: Text("Are you sure you want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
