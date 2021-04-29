import 'dart:convert';

import 'package:api_flutter/JobDesc.dart';
import 'package:api_flutter/Modal/JobClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JobFetch extends StatefulWidget {
  @override
  _JobFetchState createState() => _JobFetchState();
}

class _JobFetchState extends State<JobFetch> {
  Future<List<JobClass>> jobdata() async{
    String url="https://jobs.github.com/positions.json?description=api";
    var response=await http.get(url);
    List<JobClass> arr=[];
    if(response.statusCode==200){
      var jsonresponse = json.decode(response.body);
      for(var i in jsonresponse){
        JobClass data=JobClass(
          i["id"],
          i['type'],
          i['url'],
          i['created_at'],
          i['company'],
          i['company_url'],
          i['location'],
          i['title'],
          i['description'],
          i['how_to_apply'],
          i['company_logo']

        );
        arr.add(data);
      }

    }else{
      print('no data to show');
    }
    return arr;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jobdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,
      title: Text('Home',style: TextStyle(color: Colors.white),),),
      body: ListView(
        physics: BouncingScrollPhysics(),
      children: [
        FutureBuilder(
          future: jobdata(),
            builder: (context,snapshot){
            if(snapshot.hasData){

              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> JobDesc(array1:  snapshot.data,index: index,)));
                    },
                      child: ListTile(title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].type),
                        leading: Image.network(snapshot.data[index].companyLogo.toString(),height:80,width: 80,),),
                    ),
                  );
                },);

            }else{
              return Center(child: Container(margin: EdgeInsets.only(top: 250),child: CircularProgressIndicator()));
            }

        })
      ],
    ),);
  }
}
