import 'dart:async';

import 'package:flutter/material.dart';
import 'package:market_stock/exports.dart';
import 'package:intl/intl.dart';
import 'package:market_stock/models/companies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Data> companyNames = [];

  @override
  void initState() {
    context
        .read<StockViewModel>()
        .getStockMarketDetails()
        .then((value) => null);
    super.initState();
  }

  DateTimeRange? dateRange;
  String getUntil() {
    if (dateRange == null) {
      return 'Until';
    }
    return DateFormat('dd/MM/yyyy').format(dateRange!.end);
  }

  String getFrom() {
    if (dateRange == null) {
      return "From";
    }
    return DateFormat('dd/MM/yyyy').format(dateRange!.start);
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(hours: 24 * 3)));
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(2100),
        initialDateRange: dateRange ?? initialDateRange);
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StockViewModel>(builder: (context, model, child) {
      void searchName(String? query) {
        List<Data> suggestions = <Data>[];
        if (query!.isEmpty) {
          suggestions = model.randomCompanies!.data;
          return;
        } else {
          suggestions = model.randomCompanies!.data
              .where((user) =>
                  user.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
        setState(() {
          model.randomCompanies!.data = suggestions;
        });
      }

      if (model.randomCompanies!.data.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: context.widthPx,
              color: Colors.black.withOpacity(0.5),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderOne(
                          text: 'Market Stocks',
                          color: Colors.white,
                        ),
                        20.vSpace,
                        HeaderTwo(
                            text: DateFormat.yMd()
                                .format(DateTime.now()) //'November 4',
                            ),
                        10.vSpace,
                        Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    pickDateRange(context);
                                  },
                                  child: StatusCard(
                                      text: getFrom(),
                                      fontWeight: FontWeight.w600,
                                      boxColor: Colors.grey,
                                      height: 35,
                                      textColor: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.30),
                                ),
                                const Icon(
                                  Icons.east,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    pickDateRange(context);
                                  },
                                  child: StatusCard(
                                      text: getUntil(),
                                      fontWeight: FontWeight.w600,
                                      boxColor: Colors.grey,
                                      height: 35,
                                      textColor: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.30),
                                ),
                              ]),
                        ),
                        10.vSpace,
                        CustomTextField(
                            textInputType: TextInputType.text,
                            textController: searchController,
                            autoFocus: false,
                            // validate: Validator.password,
                            isPassword: false,
                            hintText: 'Search',
                            height: 52,
                            // onFocus: searchFocus,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade500,
                            ),
                            onChanged: searchName,
                            textInputAction: TextInputAction.done),
                        20.vSpace,
                        SizedBox(
                            height: context.heightPx - 300,
                            child: StockList(
                              companies: model.randomCompanies!.data,
                              total: model.randomCompanies!.pagination.total,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
