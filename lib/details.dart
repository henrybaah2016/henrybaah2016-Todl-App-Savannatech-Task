import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todr/api_service.dart';
import 'package:todr/list.dart';
import 'package:todr/todo_model.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key,);

  @override
  _DetailsState createState() => _DetailsState();
}
class _DetailsState extends State<Details> {
  late Future<TodoModel> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = fetchTodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xfffafafa),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return  Container(
                margin: EdgeInsets.only(left:0,right:0),
                height: 18,
                width: 18,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Lists(),
                      ),);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff000000),
                    size: 24.0,
                  ),
                ),
              );
            },
          ),
          title: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Details- No styling',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mulish',
                  ),
                ),

              ],
            ),
          ),
          actions: <Widget>[


            Container(
              margin: EdgeInsets.only(left:5,right:25),
              height: 25,
              width: 25,
              child:  GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.more_vert_outlined,
                  color: Color(0xff000000),
                  size: 24.0,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Divider(
                          height: 1,
                        ),
                      )
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(top:40,bottom:0,left:15,right:10),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:1.0,bottom: 8.0),
                                child: Text('UserID: ',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:1.0,bottom: 8.0),
                                child:FutureBuilder<TodoModel>(
                                  future: futureTodos,
                                  builder: (context, todos) {
                                    if (todos.hasData) {
                                      return Text(todos.data!.userId.toString());
                                    } else if (todos.hasError) {
                                      return SizedBox(
                                        child: Text('${todos.error}',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                              color: Color(0xff555555),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    // By default, show a loading spinner.
                                    return const CircularProgressIndicator();
                                  },
                                ),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:1.0,bottom: 8.0,),
                                child: Text('STATUS: ',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:1.0,bottom: 8.0),
                                child:FutureBuilder<TodoModel>(
                                  future: futureTodos,
                                  builder: (context, todos) {
                                    if (todos.hasData) {
                                      return Text(todos.data!.completed.toString());
                                    } else if (todos.hasError) {
                                      return SizedBox(
                                        child: Text('${todos.error}',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                              color: Color(0xff555555),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    // By default, show a loading spinner.
                                    return const CircularProgressIndicator();
                                  },
                                ),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:1.0,bottom: 8.0,),
                                child: Text('TITLE: ',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:1.0,bottom: 8.0),
                                child:FutureBuilder<TodoModel>(
                                  future: futureTodos,
                                  builder: (context, todos) {
                                    if (todos.hasData) {
                                      return Text(todos.data!.title.toString());
                                    } else if (todos.hasError) {
                                      return SizedBox(
                                        child: Text('${todos.error}',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                              color: Color(0xff555555),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    // By default, show a loading spinner.
                                    return const CircularProgressIndicator();
                                  },
                                ),

                              )],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),


            ],
          ),
        )

    );
  }

}