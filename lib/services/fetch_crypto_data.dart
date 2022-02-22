import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:core';

import 'package:crypto2/models/crypto_data.dart';

class FetchCurrenciesService {
  Future<List<CryptoData>> fetchCryptoData() async {
    final response = await http
        .get(Uri.parse('https://api.minerstat.com/v2/coins?list=BTC,BCH,BSV'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);

      List<CryptoData> listOfData = [];

      data.forEach((e) {
        listOfData.add(CryptoData.fromJson(e));
      });

      return listOfData;
    } else {
      throw Exception('failed to load');

      print('----------------------------failed to load');
    }
  }
}

/*  class FetchCurrenciesService {
  Future<List<CryptoData>> fetchCryptoData() async {
    final response = await http
        .get(Uri.parse('https://api.minerstat.com/v2/coins?list=BTC,BCH,BSV'));

  //2  List<dynamic> data = response.body;
  //  List<CryptoData> listOfData = [];

    if (response.statusCode == 200) {
      //1  print('-------------------------------response----------------');
      //  print(response);
      //  print('----------------------------response-------------------');

      //1  print(CryptoData.fromJson(response.body));
      // return CryptoData.fromJson(Map<String, dynamic>.from(response.body));

     //2 data.forEach((e) {
     //   listOfData.add(CryptoData.fromJson(Map<String, dynamic>.from(e)));
     //   });
     //  return listOfData;

	  //  print('------------------------response---------------');
	    final data =  jsonDecode(response.body);
	 //   print(data);
	 //   print('------------------response---------------');
	 
	   List<CryptoData> listOfData = [];

	    data.forEach((e) {
	   	listOfData.add(CryptoData.fromJson(e));
	    });
     
	    return listOfData;

    } else {
      throw Exception('failed to load');
      print('----------------------------failed to load');
    }
  }
} */
