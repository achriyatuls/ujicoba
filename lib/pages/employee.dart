import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './employee_add.dart';
import './employee_edit.dart';
import '../models/employee_model.dart';
import '../providers/employee_provider.dart';

class Employee extends StatefulWidget {
  final void Function(bool isFavorite) onFavoriteChanged;
  final bool isFavorite;

  Employee({Key key, this.isFavorite, this.onFavoriteChanged})
      : super(key: key);

  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.isFavorite == null;
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      widget.onFavoriteChanged(isFavorited);
    });
  }

  final data = [
    EmployeeModel(
      // this.id,
      // this.title,
      // this.imageurl,
      // this.description,
      // this.rating,
      // this.year,
      // this.duration

      id: "1",
      title: "Tiger Nixon",
      imageurl: "320800",
      description: "61",
      rating: "",
      year: "",
      duration: "",
    ),
    EmployeeModel(
      id: "2",
      title: "Tiger Nixon",
      imageurl: "320800",
      description: "61",
      rating: "",
      year: "",
      duration: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Korean Drama'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Text('+'),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EmployeeAdd()));
        },
      ),
      //bagian buat tombol add

      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<EmployeeProvider>(context, listen: false).getEmployee(),
        color: Colors.red,
        //bagian pembuatan refresh indicator

        child: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder(
            future: Provider.of<EmployeeProvider>(context, listen: false)
                .getEmployee(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<EmployeeProvider>(
                builder: (context, data, _) {
                  return ListView.builder(
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EmployeeEdit(
                                id: data.dataEmployee[i].id,
                              ),
                            ),
                          );
                        },
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (DismissDirection direction) async {
                            final bool res = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Konfirmasi'),
                                    content: Text('Kamu Yakin?'),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: Text('HAPUS'),
                                      ),
                                      FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: Text('BATALKAN'),
                                      )
                                    ],
                                  );
                                });
                            return res;
                          },
                          onDismissed: (value) {
                            Provider.of<EmployeeProvider>(context,
                                    listen: false)
                                .deleteEmployee(data.dataEmployee[i].id);
                          },

                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.arrow_drop_down_circle),
                                  title: Text("${data.dataEmployee[i].title}"),
                                  subtitle: Text(
                                    'Secondary Text',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "${data.dataEmployee[i].description}",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        icon: isFavorited
                                            ? Icon(Icons.favorite_border)
                                            : Icon(Icons.favorite),
                                        color: Colors.red[500],
                                        onPressed: toggleFavorite),

                                    // FlatButton(
                                    // textColor: const Color(0xFF6200EE),
                                    // onPressed: () {
                                    //   // Perform some action
                                    // },
                                    // child: const Text('ACTION 1'),
                                    //),
                                    // FlatButton(
                                    //   textColor: const Color(0xFF6200EE),
                                    //   onPressed: () {
                                    //     // Perform some action
                                    //   },
                                    //   child: const Text('ACTION 2'),
                                    // ),
                                    //                            child: IconButton(
                                    //   icon: Icon(Icons.android),
                                    //   color: Colors.white,
                                    //   onPressed: () {},
                                    // ),
                                    //unutuk nambahin icon icon
                                  ],
                                ),

                                // Image.asset('assets/card-sample-image.jpg'),
                                // Image.asset('assets/card-sample-image-2.jpg'),
                                Image.network(
                                    "http://192.168.54.23/crud_pegawai/images/" +
                                        '${data.dataEmployee[i].imageurl}'),
                              ],
                            ),
                          ),
                          //end perubahan
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

//LIST EMPLOYEE > SEMUA DATA EMPLOYEE
//CREATE EMPLOYEE > FORM INPUT DATA
//EDIT EMPLOYEE > MENAMPILKAN DATA KE DALAM FORM INPUT
//UPDATE EMPLOYEE
//DELETE EMPLOYEE
