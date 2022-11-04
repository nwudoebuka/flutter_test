import 'dart:async';

import 'package:flutter/material.dart';
import 'package:market_stock/exports.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<StockViewModel>(create: (_) => StockViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasInternet = false;
  late StreamSubscription subscription;

  @override
  void initState() {
    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      final color = hasInternet
          ? Colors.green.withOpacity(0.7)
          : Colors.red.withOpacity(0.7);
      final text = hasInternet ? 'Active Internet' : 'No Active Internet';
      setState(() {
        this.hasInternet = hasInternet;
        showSimpleNotification(
            Center(
              child: NormalText(
                text: text,
                color: Colors.white,
              ),
            ),
            background: color);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Market Stocks',
        home: HomePage(),
      ),
    );
  }
}
