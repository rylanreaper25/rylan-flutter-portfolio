import 'package:flutter/material.dart';
import 'package:background/background.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rylan Reapers Rest',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePage = "About";
  double menuHeight = 70;
  double menuWidth = 700;
  double textSize = 25;
  bool isExpanded = false;

  void _expandBox() {
    setState(() {
      if (!isExpanded) {
        menuHeight = 350;
        isExpanded = true;
      } else {
        menuHeight = 70;
        isExpanded = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Rylan Reapers Rest"),
        backgroundColor: Colors.brown,
      ),
      body: Background(
        path: 'assets/snowy_campfire.mp4',
        child: Stack(
          children: [
            // Header Text
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Text(
                "Welcome to the Campfire. Settle your restless soul for a moment and hear a few stories...",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            // Content Window
            Center(
              child: Container(
                height: 600,
                width: 800,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                child: Text(activePage, style: TextStyle(color: Colors.white, fontSize: textSize)),
              ),
            ),

            // Notepad Menu
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                width: menuWidth,
                height: menuHeight,
                duration: Duration(milliseconds: 250),
                decoration: BoxDecoration(color: Colors.brown),
                child: Center(
                  child: isExpanded
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: GestureDetector(
                                onTap: _expandBox,
                                child: Row(
                                  children: [
                                    Icon(Icons.menu, color: Colors.white),
                                    Text(
                                      "Notes",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: Colors.yellow),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 16,
                                children: [
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      activePage = "About Me";
                                    }),
                                    child: Text(
                                      "About Me",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      activePage = "Education";
                                    }),
                                    child: Text(
                                      "Education",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      activePage = "Experience";
                                    }),
                                    child: Text(
                                      "Experience",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      activePage = "Ghost Stories";
                                    }),
                                    child: Text(
                                      "Ghost Stories",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      activePage = "3D Printing";
                                    }),
                                    child: Text(
                                      "3D Printing",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: textSize,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: _expandBox,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Icon(Icons.menu, color: Colors.white),
                                Text(
                                  "Notes",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: textSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
