import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: <Widget>[

          Container(
            margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('BG'),
                backgroundColor: Colors.purple,
              ),
          )
        ]
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          
          _cardTipo1(),
          SizedBox(height: 30.0),
          
          _cardTipo2(),

        ],
      ),
    );
  }

  Widget _cardTipo1(){

    final card = Container(
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://scontent.faep12-1.fna.fbcdn.net/v/t1.0-9/14462754_10210681460542688_1813274318501931352_n.jpg?_nc_cat=101&_nc_oc=AQksjAydBkxbtBwOPL1ar4N2wAt6QHbj0HKWwdYpp9SBo7fCG1nP20t7LiLy8ahRX9k&_nc_ht=scontent.faep12-1.fna&oh=25c7f042f2a3e1b6b7668a1fcfcf8055&oe=5DCB3EC5'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),

          Container(
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ), 
    );
  }

 Widget _cardTipo2(){
    
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Age'),
            subtitle: Text('30'),
          ),
          Divider(),
          ListTile(
            title: Text('Gender'),
            subtitle: Text('Male'),
          ),
          Divider(),
          ListTile(
            title: Text('Civil Status'),
            subtitle: Text('Married'),
          ),
        ],
      ),

    );
    
  }


}