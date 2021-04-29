import 'package:api_flutter/Modal/JobClass.dart';
import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';

class JobDesc extends StatefulWidget {
  List<JobClass> array1;
  int index;
  JobDesc({Key key,this.array1,this.index});


  @override
  _JobDescState createState() => _JobDescState();
}

class _JobDescState extends State<JobDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.blueGrey,
    title: Text(widget.array1[widget.index].company),),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(height:200,
          child: Image.network(widget.array1[widget.index].companyLogo,fit: BoxFit.fitWidth,),),
          Container(child: Column(
            children: [
              Divider(color: Colors.grey,),
              Text(widget.array1[widget.index].company,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
              Divider(color: Colors.grey,),
              SizedBox(height: 4,),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                  Icon(Icons.work),
                  Text(widget.array1[widget.index].title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),


                ],
              ),
              SizedBox(height: 4,),
              Row(children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                Icon(Icons.location_pin),
                Text(widget.array1[widget.index].location,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                Icon(Icons.timelapse_rounded),
                Text(widget.array1[widget.index].type,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
              ],)


            ],
          )),
          Divider(thickness: 5,color: Colors.grey[200],),
          Padding(
            padding: const EdgeInsets.only(left: 10,bottom: 5),
            child: Text('Description',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(child: Html(data:widget.array1[widget.index].description,),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 25,),
                Container(child: Text("Posted On  :  "+widget.array1[widget.index].createdAt.toString(),),),
              SizedBox(height: 20,),
                Container(child: Text(widget.array1[widget.index].url,style: TextStyle(color: Colors.blue,fontSize: 12),),),
              SizedBox(height: 20,),
              Container(child: Text(widget.array1[widget.index].companyUrl.toString(),style: TextStyle(color: Colors.blue,fontSize: 12),),),
              SizedBox(height: 20,),
              Center(
                child: Container(height: 50,width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                      color: Colors.blueGrey),
                  child: Center(child: Text('How to Apply',style: TextStyle(color: Colors.white),)),),
              )


            ],),
          ),

        ],
      ),
    );
  }
}
