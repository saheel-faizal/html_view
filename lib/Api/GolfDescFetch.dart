import 'dart:convert';
import 'package:api_flutter/Modal/GolfDescClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GolfDescFetch extends StatefulWidget {
  @override
  _GolfDescFetchState createState() => _GolfDescFetchState();
}

class _GolfDescFetchState extends State<GolfDescFetch> {
  Future<GolfDescClass> golfdescdata() async{
    String url="http://www.mocky.io/v2/5c7792ea3000004f009d631b";
    var response=await http.get(url);
    if(response.statusCode==200){
      return GolfDescClass.fromJson(jsonDecode(response.body));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,
      title: Text('Normal Cars'),),
      body: ListView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
      FutureBuilder(
          future: golfdescdata(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<Datum> arr1=snapshot.data.data;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: arr1.length,
                  itemBuilder: (context,index){
                    return Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            CircleAvatar(child: Image.asset('images/job.png',),),
                            SizedBox(width: 5,),
                            Text('User'),
                            SizedBox(width: 5,),
                            Container(
                              child: Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('profile',style: TextStyle(color: Colors.white),),
                              ),),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: Colors.lightBlue[900]),)
                          ],),
                        ),
                        Container(height: 230,width:MediaQuery.of(context).size.width,
                          child: Image.network(arr1[index].image.toString(),fit: BoxFit.fitWidth,),),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(top:5,left: 5),
                            child: Container(width: 100,height: 40,
                              color: Colors.green,
                              child:
                              Center(child:
                              Text('INSPECTED',style:
                              TextStyle(color: Colors.white),),),),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.3090,),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Image.network(arr1[index].imageSubimageOne.toString(),height: 40,),
                          ),
                          Image.network(arr1[index].imageSubimageTwo.toString(),height: 40,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Image.network(arr1[index].imageSubimageOne.toString(),height: 40,),
                          ),
                        ],),

                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Text("Model name : "+arr1[index].name,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Text("Option : "+arr1[index].option,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Text("Price : "+arr1[index].rate,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                        ),
                        Divider(thickness: 5,color: Colors.grey[200],),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top:5),
                          child: Text('Overview',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                        ),
                        SizedBox(height: 10,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10,),
                                Icon(Icons.calendar_today_sharp),
                                Container(child: Column(children: [Text('Year',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(arr1[index].year),
                                ],),),
                                SizedBox(width: MediaQuery.of(context).size.width*0.07,),
                                Icon(Icons.speed_sharp),
                                Container(child: Column(children: [Text('Km drives',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(arr1[index].kmDriven),
                                ],),),
                                SizedBox(width: MediaQuery.of(context).size.width*0.07,),
                                Icon(Icons.location_pin),
                                Container(child: Column(children: [Text(arr1[index].kmAway,style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('Royal'),
                                ],),),
                                SizedBox(width: MediaQuery.of(context).size.width*0.07,),
                                Icon(Icons.color_lens_outlined),
                                Container(child: Column(children: [Text('Color',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(arr1[index].color),
                                ],),),


                              ],),
                            SizedBox(height: 25,),

                            Row(
                              children: [
                                SizedBox(width: 12,),

                                Container(child: Column(children: [Text('Fuel',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(arr1[index].fuel),
                                ],),),
                                SizedBox(width: MediaQuery.of(context).size.width*0.1,),

                                Container(child: Column(children: [Text('Insurance',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(arr1[index].insurance),
                                ],),),
                                SizedBox(width: MediaQuery.of(context).size.width*0.1,),

                                Container(child: Column(children: [Text('Ownership',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(arr1[index].ownership),
                                ],),),



                              ],),
                            Divider(thickness: 5,color: Colors.grey[200],),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 7),
                              child: Text("Description",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10),
                              child: Text(arr1[index].description),
                            ),
                            Divider(thickness: 5,color: Colors.grey[200],),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                                child: Text("Other Specifications :",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                                child: Container(child: Column(
                                  children: [
                                    Text(' Overall length : '+arr1[index].overallLenght.toString(),),
                                    Text(' Overall weight : '+arr1[index].overallWight.toString(),),
                                    Text(' Overall base : '+arr1[index].overallBase.toString(),),
                                    Text(' Overall height : '+arr1[index].overallHeight.toString(),),
                                    Text(' Wheel base : '+arr1[index].whellBase.toString(),),
                                    Text(' No of Doors : '+arr1[index].noOfDoord.toString(),),
                                    Text(' Seating Capacity : '+arr1[index].seatingCapacity.toString(),),
                                    Text(' Torque : '+arr1[index].torque.toString(),),
                                    Text(' Maximum Speed : '+arr1[index].maximumSpeed.toString(),),
                                    Text(' Power : '+arr1[index].power.toString(),),
                                    Text(' Value mechanism : '+arr1[index].valueMechanisum.toString(),),
                                    Text(' abs : '+arr1[index].abs.toString(),),
                                    Text(' ebd : '+arr1[index].ebd.toString(),),
                                    Text(' Child Safety Lock  : '+arr1[index].childSafetyLock.toString(),),
                                    Text(' Immobilizer : '+arr1[index].immobilizer.toString(),),
                                    Text(' Power Steering : '+arr1[index].powerSteering.toString(),),
                                    Text(' Value mechanism : '+arr1[index].valueMechanisum.toString(),),


                                ],crossAxisAlignment: CrossAxisAlignment.start,),),
                              )
                            ],),
                            SizedBox(height: 15,),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Ask more Details',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600],fontSize: 16),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.0),
                                        color: Colors.lightBlue[900]),
                                    height: 40,
                                    width: 90,
                                    child: Center(child: Text('CHAT',style: TextStyle(color: Colors.white),),),
                                  ),
                                )

                              ],)
                          ],)
                      ],);



                  });
            }else{
              return Center(
                child: Container(
                    child: CircularProgressIndicator(backgroundColor: Colors.blueGrey,),
                  margin: EdgeInsets.only(top: 300 ),
                ),
              );
            }


      })
    ],),);
  }
}
