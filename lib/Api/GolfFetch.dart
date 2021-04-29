import 'package:api_flutter/Api/GolfDescFetch.dart';
import 'package:api_flutter/Modal/GolfClass.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GolfFetch extends StatefulWidget {
  @override
  _GolfFetchState createState() => _GolfFetchState();
}

class _GolfFetchState extends State<GolfFetch> {
  bool liked=false;

  Future<GolfClass> golfdata() async{
    String url="http://www.mocky.io/v2/5c763f50320000611ff45f8d";
    var response= await http.get(url);
    if(response.statusCode==200){
      return GolfClass.fromJson(jsonDecode(response.body));
    }else{
      print('No data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.blueGrey,
      title: Text('Used Normal Cars'),),
        body: ListView(physics: BouncingScrollPhysics(),
      children: [
      FutureBuilder(
        future: golfdata(),
          builder: (context,snapshot){
          if(snapshot.hasData){
            List<VehicleList> arr=snapshot.data.vehicleList;
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: arr.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio:1/1.45
              ),
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>GolfDescFetch()));
                    },
                    child: Container(height: 200,

                      decoration: BoxDecoration(color: Colors.white70,
                          borderRadius: BorderRadius.circular(9.0)),
                      child: Column(children: [
                        Container(height: 30,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(top: 10,left: 5),
                                child: Container(width: 70,height: 20,
                                  color: Colors.green,
                                  child:
                                  Center(child:
                                  Text('INSPECTED',style:
                                  TextStyle(color: Colors.white),),),),
                              ),

                              IconButton(icon: Icon(liked ? Icons.favorite : Icons.favorite_border,
                                color:liked ? Colors.red[600]: Colors.grey,),
                                onPressed: (){
                                  setState(() {
                                    if(liked==false){
                                      liked=true;
                                    }else{
                                      liked=false;
                                    }
                                  });
                                },
                              )
                            ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(child: Image.network(arr[index].image.toString(),height: 90,),),
                        ),

                        Container(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Brand : "+arr[index].name.toString(),style: TextStyle(color: Colors.grey[600],fontSize: 15,fontWeight: FontWeight.bold),),
                              Divider(),
                              Text("Model : "+arr[index].model.toString(),style: TextStyle(color: Colors.grey[600],fontSize: 15,fontWeight: FontWeight.bold)),
                              Divider(),
                              Text("Rate : "+arr[index].rate.toString(),style: TextStyle(color: Colors.grey[600],fontSize: 15,fontWeight: FontWeight.bold),),
                              Divider(),
                              Text("Description : \n"+arr[index].description.toString(),style: TextStyle(color: Colors.grey[600],fontSize: 15,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                            ],),)


                      ],),

                    ),
                  ),
                );
              },);

          }else{
            return Center(child: Container(margin: EdgeInsets.only(top: 300),
                child: CircularProgressIndicator(backgroundColor: Colors.blueGrey,)));
          }

          })
    ],));
  }
}
