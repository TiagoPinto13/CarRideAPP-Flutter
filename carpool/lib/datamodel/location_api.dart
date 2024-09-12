import 'dart:async';
import 'package:carpool/datamodel/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';

class LocationApi extends ChangeNotifier {
  List<Place> places = [];
  final addressController;
  final _deley = Deley(milliseconds: 500);
  final _controller = StreamController<List<Place>>.broadcast();
  bool _isSuggestionsMenuVisible = false;

  LocationApi({required this.addressController});

  Stream<List<Place>> get controllerOut => _controller.stream.asBroadcastStream();

  StreamSink<List<Place>> get controllerIn => _controller.sink;

  addPlace(Place place) {
    places.add(place);
    controllerIn.add(places);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  void toggleSuggestionsMenuVisibility() {
    _isSuggestionsMenuVisible = !_isSuggestionsMenuVisible;
    notifyListeners();
  }

  bool get isSuggestionsMenuVisible => _isSuggestionsMenuVisible;

  handleSearch(String query) async {
    if (query.length > 2) {
      _deley.run(() async {
        try {
          List<Location> locations = await locationFromAddress(query);

          locations.forEach((location) async {
            List<Placemark> placeMarks =
            await placemarkFromCoordinates(location.latitude, location.longitude);

            for (var placeMark in placeMarks) {
              if (placeMark.country != 'Portugal') {
                continue;
              }
              addPlace(Place(
                name: placeMark.name,
                street: placeMark.street,
                locality: placeMark.locality,
                country: placeMark.country,
              ));
            }
          });
        } on Exception catch (e) {
          print(e);
        }
      });
    } else {
      places.clear();
    }
  }

  void clearSearch() {
    addressController.clear();
    notifyListeners();
  }
}

class Deley {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Deley({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
