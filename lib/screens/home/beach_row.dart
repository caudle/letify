import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letify/screens/home/beach_listview.dart';
import 'package:letify/services/blocs/homes_provider.dart';

class BeachRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _beachHomes = HomesProvider.of(context);

    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 9, bottom: 0,right: 12),
        height: 192,
        child: StreamBuilder<List<QuerySnapshot>>(
          stream: _beachHomes.beachStream,
          builder: (context, AsyncSnapshot<List<QuerySnapshot>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('loading beach homes.....'));
            } else {
              final homeSnapshots =
                  snapshot.data[0].documents + snapshot.data[1].documents;
              homeSnapshots.shuffle();
              return BeachListView(
                homeSnapshots: homeSnapshots,
              );
            }
          },
        ),
      ),
    );
  }
}
