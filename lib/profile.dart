import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CircleAvatar(radius: 100,
      backgroundImage:NetworkImage ('https://tse2.mm.bing.net/th?id=OIP.ln0HxxYS_G6kEzF6Z3frkQHaGL&pid=Api&P=0&h=180'),),
      Text('harry style',style: TextStyle(fontSize: 30,color: Colors.teal,),),
      Text('singer',style: TextStyle(fontSize: 30,color: Colors.teal,),),

            Card(child: ListTile(leading: Icon(Icons.phone),
              title: Text("+91 8086508100"),),),

        Card(child: ListTile(leading: Icon(Icons.mail),
    title: Text("diyakeerikkadan@gmail.com"),)
    )]))
    );
  }
}
