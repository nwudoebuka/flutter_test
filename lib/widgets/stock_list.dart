import 'package:flutter/material.dart';
import 'package:market_stock/exports.dart';

class StockList extends StatelessWidget {
  final List<dynamic> companies;
  final int total;
  const StockList({required this.companies, required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          final company = companies[index];
          final amount = total;
          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderTwo(
                  text: company.symbol ?? "APPLE",
                  color: Colors.white,
                  size: 24,
                ),
                HeaderTwo(text: company.name ?? 'Apple Company', size: 20)
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NormalText(
                  text: "1000", //" \$${company.amount.toString()}",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  size: 18,
                ),
                Container(
                  height: 25,
                  width: 65,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(child: NormalText(text: '-1.09%')),
                )
              ],
            ),
          );
        }),
        separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ),
        itemCount: 10);
  }
}
