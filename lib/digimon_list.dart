import 'package:digimon_app/digimon_card.dart';
import 'package:flutter/material.dart';
import 'phil_model.dart';

class DogList extends StatelessWidget {
  final List<Dogs> doggies;
  DogList(this.doggies);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: doggies.length,
      itemBuilder: (context, int) {
        return new DigimonCard(doggies[int]);
      },
    );
  }
}
