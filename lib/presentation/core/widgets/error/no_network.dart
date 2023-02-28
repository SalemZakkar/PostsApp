import 'package:flutter/material.dart';

class NoNetwork extends StatefulWidget {
  const NoNetwork({Key? key}) : super(key: key);

  @override
  State<NoNetwork> createState() => _NoNetworkState();
}

class _NoNetworkState extends State<NoNetwork> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.wifi_off_rounded,
        color: Theme.of(context).colorScheme.error,
        size: 40,
      ),
    );
  }
}
