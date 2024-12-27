import 'package:flutter/material.dart';
import 'package:life_shared/life_shared.dart';

part 'regional_city_drop_down_mixin.dart';

/// City DropDown for regional Hatay,Mersin
final class RegionalCityDropDown extends StatefulWidget {
  const RegionalCityDropDown({
    super.key,
    required this.onSelected,
    required this.fetchCities,
  });
  final ValueChanged<StoreCityModel> onSelected;
  final ValueChanged<List<StoreCityModel>> fetchCities;

  @override
  State<RegionalCityDropDown> createState() => _RegionalCityDropDownState();
}

class _RegionalCityDropDownState extends State<RegionalCityDropDown>
    with _RegionalCityDropDownMixin {
  @override
  Widget build(BuildContext context) {
    if (_cities.isEmpty) {
      return const SizedBox.shrink();
    }
    return DropdownMenu<String>(
      initialSelection: _selectedCity.documentId,
      onSelected: (value) {
        if (value == null) return;
        _updateSelectedCity(
          _cities.firstWhere((e) => e.documentId == value),
        );
      },
      dropdownMenuEntries: _cities
          .map(
            (e) => DropdownMenuEntry(
              value: e.documentId,
              label: e.name,
            ),
          )
          .toList(),
    );
  }
}
