import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SoupMenu extends StatefulWidget {
  SoupMenu({Key? key}) : super(key: key);

  @override
  _SoupStateMenu createState() => _SoupStateMenu();
}

class _SoupStateMenu extends State<SoupMenu> {
  var _menuData;
  CollectionReference _starter = FirebaseFirestore.instance.collection('Soup');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _starter.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(child: Text("No Bookings"));
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong !"),
          );
        }
        if (snapshot.hasData ||
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                _menuData = snapshot.data?.docs[index];
                return Card(
                    elevation: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Color(0xFFFEEAE6),
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            _menuData.get("ImageUrl"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(_menuData.get("MenuName"),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF442c2e))),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 100,
                              ),
                            ),
                            Text(_menuData.get("Rating").toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF442c2e))),
                            Icon(
                              Icons.star,
                              color: Color(0xfff50057),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_outline,
                                  color: Color(0xFF442c2e),
                                ))
                          ],
                        )
                      ],
                    ));
              });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
