import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todr/api_service.dart';
import 'package:todr/details.dart';
import 'package:todr/todo_model.dart';


class Lists extends StatefulWidget {
  Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}
class _ListsState extends State<Lists> {
  late List<TodoModel>? _todoModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _todoModel = (await ApiService().getLists())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar:  AppBar(
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
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.sort_outlined,
                    color: Color(0xff000000),
                    size: 24.0,
                  ),
                ),
              );
            },
          ),
          title: Container(
            width: 70,
            height:50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Image.asset('assets/images/todl_mini_blue.png'),

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:15,bottom:1,left:15,right:25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Find your todo",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                color: Color(0xff555555),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:2,bottom:0,left:0,right:10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width:300,
                          margin: EdgeInsets.only(bottom:0,left:10,right:10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xffffffff)
                          ),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(
                                    0xffffffff)),
                                borderRadius: BorderRadius.circular(6),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffffffff)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffffffff)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusColor: Color(0xffffffff),
                              contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                              hintText: 'Search here',
                              hintStyle: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                  color: Color(0xffB3B3B3),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  'assets/images/icon_search.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            cursorColor: Color(0xffB3B3B3),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:25,bottom:5,left:15,right:25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "ALL TODOS",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                color: Color(0xff007aeb),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              _todoModel == null || _todoModel!.isEmpty
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : ListView.builder(
                itemCount: _todoModel!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(),
                              ),);
                          },
                          child:  Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom:0,left:0,right:0,top:0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    color: Color(0xffffffff)
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(top:10,bottom:10,left:15,right:10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(top: 5, left: 7),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(4),
                                                        child: Container(
                                                          child: Text(_todoModel![index].id.toString(),
                                                            style: GoogleFonts.mulish(
                                                              textStyle: TextStyle(
                                                                color: Color(0xffB3B3B3),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w400,

                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 200,
                                                        child:  Padding(
                                                          padding: const EdgeInsets.all(4),
                                                          child: Container(
                                                            child: Text(
                                                              _todoModel![index].title,
                                                              textAlign: TextAlign.left,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: GoogleFonts.mulish(
                                                                textStyle: TextStyle(
                                                                  color: Color(0xffB3B3B3),
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w400,

                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )


                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              size:18,
                                              color: Color(0xffB3B3B3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Divider(
                                          height: 1,
                                          color: Color(0xfff3f3f3),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                },
              )
            ],
          ),
        )

    );
  }
}