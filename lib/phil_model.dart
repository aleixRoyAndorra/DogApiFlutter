import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Dogs {
  final String name;
  String imageUrl;
  String apiname;
  String Desc;

  int rating = 10;

  Dogs(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      apiname = name.toLowerCase();
      var claudatorApertura = "[";
      var claudatorCierre = "]";
      var uri = new Uri.https('philosophyapi.herokuapp.com', '/api/philosophers/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      List data =
          json.decode('$claudatorApertura$responseBody$claudatorCierre');
      imageUrl = data[0]["photo"];
      Desc = "$apiname Beautiful Dog!";

      print(Desc);
    } catch (exception) {
      print(exception);
    }
  }
}
