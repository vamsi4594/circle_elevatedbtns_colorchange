import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8.0,
            shape: CircleBorder(),
            minimumSize: Size.square(80)
          )
        )
      ),
      home: CircleButtonColorChangeOnTap(),
    );
  }
}

class CircleButtonColorChangeOnTap extends StatefulWidget {
  @override
  _CircleButtonColorChangeOnTapState createState() => _CircleButtonColorChangeOnTapState();
}

class _CircleButtonColorChangeOnTapState extends State<CircleButtonColorChangeOnTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Elevated Buttons'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white70,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              Text('Button color change onTap', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),),
              SizedBox(height: 10,),
              Expanded(
                child: Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor: getColor(Colors.white, Colors.teal), // splash color
                            backgroundColor: getColor(Colors.white, Colors.red),
                            foregroundColor: getColor(Colors.red, Colors.white),
                            side: getBorder(Colors.red, Colors.black)
                        ),
                        onPressed: (){},
                        child: Icon(Icons.favorite_rounded, size: 40,)
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        style: ButtonStyle(
                          overlayColor: getColor(Colors.white, Colors.teal), // splash color
                            backgroundColor: getColor(Colors.white, Colors.black),
                            foregroundColor: getColor(Colors.black, Colors.white),
                            side: getBorder(Colors.black, Colors.white)
                        ),
                        onPressed: (){},
                        child: Icon(Icons.image, size: 40,)
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        style: ButtonStyle(
                          //overlayColor: getColor(Colors.white, Colors.teal), // splash color
                            backgroundColor: getColor(Colors.yellow, Colors.red),
                            foregroundColor: getColor(Colors.red, Colors.yellow),
                            side: getBorder(Colors.red, Colors.yellow)
                        ),
                        onPressed: (){},
                        child: Icon(Icons.add, size: 40,)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  MaterialStateProperty<Color> getColor(Color color, Color pressedColor){
    final getColor = (Set<MaterialState> states){
      if(states.contains(MaterialState.pressed)){
        return pressedColor;
      }else{
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
  MaterialStateProperty<BorderSide> getBorder(Color color, Color pressedColor){
    final getBorder = (Set<MaterialState> states){
      if(states.contains(MaterialState.pressed)){
        return BorderSide(color: pressedColor, width: 2.0);
      }else{
        return BorderSide(color: color, width: 2.0);
      }
    };
    return MaterialStateProperty.resolveWith(getBorder);
  }
}


