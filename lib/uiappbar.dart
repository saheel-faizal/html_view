import 'package:flutter/material.dart';

class UiappBar extends StatefulWidget {
  @override
  _UiappBarState createState() => _UiappBarState();
}

class _UiappBarState extends State<UiappBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.grey,),
          title: Text('Home',style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.chat,color: Colors.grey,),
              title: Text('Classes',style: TextStyle(color: Colors.black))),
          BottomNavigationBarItem(icon: Icon(Icons.wifi_protected_setup_sharp,color: Colors.grey,),
              title: Text('Exams',style: TextStyle(color: Colors.black))),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp,color: Colors.grey,),
              title: Text('My Account',style: TextStyle(color: Colors.black))),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail,color: Colors.grey,),
              title: Text('Contact us',style: TextStyle(color: Colors.black)))
        ],
      ),
      backgroundColor: Colors.cyanAccent[100],
      appBar:PreferredSize(preferredSize: Size.fromHeight(100),

      child: AppBar(backgroundColor: Colors.cyanAccent[100],
      elevation: 0.001,
      title: Text('Notifications',style: TextStyle(color: Colors.grey[700]),),
      centerTitle: true,
      leading: IconButton(icon: Icon(Icons.menu),),
      actions: [
        Icon(Icons.notifications_none_outlined,color: Colors.grey[700],)
      ],),
    ),
    body: Container(height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45),topRight: Radius.circular(45))),
      child: ListView(children: [
      Padding(
      padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text('Today ●',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
          Text('Mark as Read',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),)
        ],),
    ),
      SizedBox(height: 15,),
        ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 15),
            child: ListTile(leading: Container(
                height: 90,
                width: 90,
                child: CircleAvatar(backgroundImage: AssetImage('images/images.png'),)),
              title: Text('You have an unattended class in English',style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text('Prof. Ashwati Rajan Chapter: 08 - Part03',style: TextStyle(fontSize: 13,color: Colors.grey),),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('Now ●',style: TextStyle(color: Colors.teal),),
              ),
            ),
          );

            })




      ],
      physics: BouncingScrollPhysics(),),
    ),);
  }
}
