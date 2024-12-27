part of '../dropdown/regional_city_drop_down.dart';

mixin _RegionalCityDropDownMixin on State<RegionalCityDropDown> {
  late StoreCityModel _selectedCity;
  List<StoreCityModel> _cities = [];

  void _updateSelectedCity(StoreCityModel value) {
    setState(() {
      _selectedCity = value;
    });
    widget.onSelected(value);
  }

  void _updateCities(List<StoreCityModel> value) {
    setState(() {
      _cities = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _changeRelationalCity();
  }

  Future<void> _changeRelationalCity() async {
    final response = await CollectionPaths.regionalCities.collection
        .withConverter(
          fromFirestore: (value, options) {
            return StoreCityModel().fromFirebase(value);
          },
          toFirestore: (value, options) => throw Exception('Not implemented'),
        )
        .get();
    if (response.docs.isEmpty) {
      assert(false, 'No city found');
    }

    final firstCity = response.docs.first;
    final city = firstCity.data().copyWith(
          documentId: firstCity.id,
        );
    _updateSelectedCity(city);
    _updateCities(response.docs.map((e) => e.data()).toList());
    widget.fetchCities(_cities);
  }
}
