import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';

const bgColor = Color(0xff232227);
var btnColor = Color.fromARGB(255, 244, 67, 54);
var shadowColor = Colors.black.withOpacity(0.4);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: Icon(Icons.sort_rounded, color: Colors.white),
          actions: [
            Icon(Icons.search, color: Colors.white),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              var iconList = [
                Icons.email,
                Icons.favorite,
                Icons.home,
                Icons.notifications,
                Icons.person
              ];
              return Transform.scale(
                  scale: 1.2,
                  child: CircleAvatar(
                    backgroundColor: index == 2 ? btnColor : Colors.transparent,
                    radius: index == 2 ? 30 : 20,
                    child: Icon(
                      iconList[index],
                      color: Colors.white,
                    ),
                  ));
            }),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            textWidget(text: "Hot & fast Food", size: 32, Color: Colors.white),
            textWidget(
                text: "deliver on time",
                size: 18,
                Color: Colors.white.withOpacity(0.5)),
            const SizedBox(height: 12),
            TabBar(
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                tabs: [
                  Tab(text: "Nasi"),
                  Tab(text: "Ice"),
                  Tab(text: "Indomie"),
                  Tab(
                    text: "Nasi",
                  ),
                ]),
            Expanded(
              child: TabBarView(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext Context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: bgColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 8,
                                spreadRadius: 1),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/img$index.jpg'),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget textWidget({text, required double size, Color}) {
    return Text("$text",
        style: TextStyle(
          fontSize: size,
          color: Color,
          fontWeight: FontWeight.bold,
        ));
  }
}
