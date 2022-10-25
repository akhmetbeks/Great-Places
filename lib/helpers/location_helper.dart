import 'package:http/http.dart' as http;
import 'dart:convert';

const GOOGLE_API_KEY = 'AIzaSyD1WjzP_ABIA-uB-dpKm7-SrJ7LiLOlm8A';

class LocationHelper {
  static String generateLocationPreviewImage(double lat, double long) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long&zoom=18&size=600x300&maptype=roadmap&markers=color:red%7Clabel:B%7C$lat,$long&key=$GOOGLE_API_KEY';
    
  }

  static Future<String> getPlaceAdress(double lat, double lng) async{
    final params = {
      'latlng': '$lat,$lng',
      'key': GOOGLE_API_KEY,
    };
    
    final url = Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      params,
    );
 
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
