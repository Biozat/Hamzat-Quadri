import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/rendering/box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex=0;
  //late PersistentTabController _controller;

  List pages=[
    SingleChildScrollView(child: BodyPage()),
    Container(child: Center(child: Text("Cart History"))),
    Container(child: Center(child: Text("Cart"))),
    Container(child: Center(child: Text("Sign Up Page"))),
    Container(child: Center(child: Text("Call Page"))),

  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
          leading: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
               Row(
                 children: [
                   Text("U",  style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 13,
                     color: Colors.black
                   ),),
                   Text("Logo", style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 13
                   ),),
                 ],
               ),
                Text("Up", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black
                ),),

              ],
            )
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "TAB1",
              ),
              Tab(
                text: "TAB2",
              ),
              Tab(
                text: "TAB3",
              ),
            ],
          ),
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive),
                label: "home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "cart"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "me"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: "call"
            ),
          ],
        ),/*Column(
          children: [
            Expanded(
              child: const TabBarView(
                children: <Widget>[
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
          ],
        )*/
      ),
    );
  }
}

class BodyPage extends StatelessWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Tab Bar
         Container(
           height: 30,
           child: TabBarView(
                children: <Widget>[
                      Text("Tab 1 view"),
                      Text("Tab 2 view"),
                      Text("Tab 3 view"),


                ]
            ),
         ),
        // Banner Slider
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: ["bag-1","shoe-1","shoe-2","t-shirt","t-shirt-2"].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                      width: double.infinity,  //MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:  AssetImage(
                                  "assets/image/"+i+".jpeg"
                              )
                          )
                      ),
                      child:
                        //  Expanded(child: Image(image: AssetImage("assets/image/"+i+".jpeg"), fit: BoxFit.fill,)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(i)),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 30,
                                color: Colors.blue,
                                child: TextButton(onPressed: (){}, child: Text("Button", style: TextStyle(
                                  color: Colors.white,

                                ),)),
                              )
                            ],
                          )

                  );

              },
            );
          }).toList(),
        ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Category", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ],
          ),
          // Catergory Slider
          SingleChildScrollView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/broom.png"
                                )
                            )
                        ),
                      ), 
                      Text("Part-Time Cleaners", style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
                SizedBox(width:25,),
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/hair-salon.png"
                                )
                            )
                        ),
                      ),
                      Text("Hair Services", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
                  SizedBox(width: 25,),
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/electrician.png"
                                )
                            )
                        ),
                      ),
                      Text("Electricians and Plumbers", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),  overflow: TextOverflow.ellipsis,maxLines: 2,)
                    ],
                  ),
                ),
                  SizedBox(width: 25,),
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/chef.png"
                                )
                            )
                        ),
                      ),
                      Text("Food Services", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),  overflow: TextOverflow.ellipsis,maxLines: 2,)
                    ],
                  ),
                ),
                  SizedBox(width: 25,),
                Container(
                  height: 100,
                  width: 80,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:  AssetImage(
                                      "assets/image/disinfection.png"
                                  )
                              )
                          ),
                        ),
                        Text("Disinfection", style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),  overflow: TextOverflow.ellipsis,maxLines: 2,)
                      ],
                    ),
                ),
                  SizedBox(width: 25,),
                  Container(
                    height: 100,
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:  AssetImage(
                                      "assets/image/painter.png"
                                  )
                              )
                          ),
                        ),
                        Text("Moving & Painter", style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),  overflow: TextOverflow.ellipsis,maxLines: 2,)
                      ],
                    ),
                  ),

              ],
          ),

          ),
          SizedBox(height: 20,),
          Text("Grid View", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          //Body images Scrolling
          CustomScrollView(
            primary: false,
            shrinkWrap: true,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:  AssetImage(
                                        "assets/image/bag-1.jpeg"
                                    )
                                )
                            ),
                          ),
                          Text("Product Bad", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                          ), maxLines: 2,)
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:  AssetImage(
                                        "assets/image/t-shirt.jpeg"
                                    )
                                )
                            ),
                          ),
                          Text("Product T Shirt 1", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ), maxLines: 2,)
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:  AssetImage(
                                        "assets/image/woman-1.jpeg"
                                    )
                                )
                            ),
                          ),
                          Text("Product Woman Cloth 1", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ), maxLines: 2,)
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:  AssetImage(
                                        "assets/image/shoe-1.jpeg"
                                    )
                                )
                            ),
                          ),
                          Text("Product Shoe 1", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ), maxLines: 2,)
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:  AssetImage(
                                        "assets/image/shoe-2.jpeg"
                                    )
                                )
                            ),
                          ),
                          Text("Product Shoe 2", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ), maxLines: 2,)
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:  AssetImage(
                                        "assets/image/t-shirt-2.jpeg"
                                    )
                                )
                            ),
                          ),
                          Text("Product T Shirt 2", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ), maxLines: 2,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text("Top Store/Profile", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          SizedBox(height: 10,),
          // Top Store/Profile
          SingleChildScrollView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/man.png"
                                )
                            )
                        ),
                      ),
                      Text("@User1", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
                SizedBox(width:25,),
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/man-1.png"
                                )
                            )
                        ),
                      ),
                      Text("@User2", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
                SizedBox(width: 25,),
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/programmer.png"
                                )
                            )
                        ),
                      ),
                      Text("@User3", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),  overflow: TextOverflow.ellipsis,maxLines: 2,)
                    ],
                  ),
                ),
                SizedBox(width: 25,),
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/businessman.png"
                                )
                            )
                        ),
                      ),
                      Text("@User4", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),  overflow: TextOverflow.ellipsis,maxLines: 2,)
                    ],
                  ),
                ),
                SizedBox(width: 25,),
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/icons8-user-48.png"
                                )
                            )
                        ),
                      ),
                      Text("@User5", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),  overflow: TextOverflow.ellipsis,maxLines: 2,)
                    ],
                  ),
                ),
                SizedBox(width: 25,),
                Container(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  AssetImage(
                                    "assets/image/icons8-user-64.png"
                                )
                            )
                        ),
                      ),
                      Text("@User6", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),  overflow: TextOverflow.ellipsis,maxLines: 2,)
                    ],
                  ),
                ),

              ],
            ),

          ),
          SizedBox(height: 10,),
          Text("Shop By Category", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          // Shop Categories
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: ["disinfection","electrician","painter", "chef"].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: double.infinity,  //MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,

                      ),
                      child:
                      //  Expanded(child: Image(image: AssetImage("assets/image/"+i+".jpeg"), fit: BoxFit.fill,)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:  AssetImage(
                                        "assets/image/"+i+".png"
                                    )
                                )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 30,
                            color: Colors.blue,
                            child: Text("Sub Category "+i)),

                        ],
                      )

                  );

                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

}


