import 'package:angular/angular.dart';
import 'package:http_reqs_scouts/src/scouts/scout.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:html';

@Injectable()
// TODO: Update URLs in ScoutService
class ScoutService {

  static final _headers = {'Content-Type': 'application/json'};
  static const _scoutsUrl =
      'https://scoutmanager.struzzwebsolutions.com/db_scripts/index.php'; //URL to web API

  var wordList;
  final _http;

  ScoutService(this._http);

  Future<List<Scout>> getScouts() async {
    try {
      final scouts = processString(await HttpRequest.getString('$_scoutsUrl?op=getscouts&user=reader'));
      print(scouts);
      //final response = await _http.get('$_scoutsUrl?op=getscouts&user=reader');
      return scouts;
    } catch (e) {
      throw _handleError(e);
    }
  }

//  Future<List<Scout>> getScouts() async {
//    try {
//      final response = await _http.get('$_scoutsUrl?op=getscouts&user=reader');
//      final scouts = _extractData(response)
//          .map((value) => new Scout.fromJson(value))
//          .toList();
//      return scouts;
//    } catch (e) {
//      throw _handleError(e);
//    }
//  }


  processString(String jsonString) {
    List<String> listString = JSON.decode(jsonString);
    for (int i=0; i < listString.length; i++) {
      wordList.children.add(new LIElement()..text = listString[i]);
    }
  }

  //dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];
  //dynamic _extractData(Response resp) => JsonDecoder(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause $e');
  }

}