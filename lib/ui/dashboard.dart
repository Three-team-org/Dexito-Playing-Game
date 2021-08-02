import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DashboardScreen extends StatefulWidget{
  @override
  _DashboardScreenState createState() => _DashboardScreenState();

}
class _DashboardScreenState extends State<DashboardScreen>{
  final TextStyle whiteText = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 40.0),
          _buildHeader(),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "DASHBOARD",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _buildTile(
                    color: Colors.pink,
                    icon: Icons.portrait,
                    title: "DATA",
                    data: "1200",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    color: Colors.green,
                    icon: Icons.portrait,
                    title: "RECIPIES",
                    data: "857",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _buildTile(
                    color: Colors.blue,
                    icon: Icons.favorite,
                    title: "ADVICES",
                    data: "864",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    color: Colors.pink,
                    icon: Icons.portrait,
                    title: "HOSPITAL",
                    data: "857",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    color: Colors.blue,
                    icon: Icons.favorite,
                    title: "CALENDAR",
                    data: "698",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );

  }
  Container _buildHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Dr. John Doe",
              style: whiteText.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Md, (General Medium), DM(Cardiology)",
              style: whiteText.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTile(
      {Color color, IconData icon, String title, String data}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: whiteText.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            data,
            style:
            whiteText.copyWith(fontWeight: FontWeight.bold, fontSize: 10.0),
          ),
        ],
      ),
    );
  }

}