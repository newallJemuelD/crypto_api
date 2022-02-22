import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';

import 'package:crypto2/models/crypto_data.dart';
import 'package:crypto2/services/fetch_crypto_data.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CryptoData>? futureCryptoData = [];

  @override
  void initState() {
    super.initState();
   // FetchCurrenciesService().fetchCryptoData();
        
   // ListFuture<CryptoData> data=[];
   // setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto-currency'),
      ),
      body: Container(
		child: FutureBuilder<List<CryptoData>>(
          future:  FetchCurrenciesService().fetchCryptoData(),
          builder: (context, snapshot) {
      	
            if (snapshot.hasData) {
		    futureCryptoData = snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: futureCryptoData!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.amber,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data![index].name),
                        SizedBox(
                          height: 10,
                        ),
                        Text((snapshot.data![index].price).toString()),
                      ],
                    ),
                  );
                },
              ); //gridview builder
            } else if (snapshot.hasError) {
              return Text("Error -------");
            }
            return Text('Loading...');
          },
        ),
      ),
    );
  }
}
