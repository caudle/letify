import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letify/screens/home/trendy_listview.dart';
import 'package:letify/services/blocs/homes_provider.dart';

class TrendyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _trendyHomes = HomesProvider.of(context);

    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 9, bottom: 0,right: 12),
        height: 192,
        child: StreamBuilder<List<QuerySnapshot>>(
          stream: _trendyHomes.trendyStream,
          builder: (context, AsyncSnapshot<List<QuerySnapshot>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('loading trendy homes.....'));
            } else {
              final homeSnapshots =
                  snapshot.data[0].documents + snapshot.data[1].documents;
              homeSnapshots.shuffle();
              return TrendyListView(
                homeSnapshots: homeSnapshots,
              );
            }
          },
        ),
      ),
    );
  }
}
