import 'package:flutter/material.dart';
import 'package:posts_app/presentation/core/widgets/error/no_network.dart';
import 'package:salem_package/enums/failure_type.dart';

class DisplayErrorWidget extends StatelessWidget  {
  final String message;
  final FailureType type;
  final Function retry;
  const DisplayErrorWidget(
      {Key? key, required this.message, required this.retry , required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getFailWidget(type),
        const SizedBox(
          height: 20,
        ),
        Text(message),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () => retry.call(),
          child: Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Theme.of(context).colorScheme.error),
            alignment: Alignment.center,
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}



Widget getFailWidget(FailureType type) {
  if (type == FailureType.networkError) {
    return const NoNetwork();
  } else {
    return const Center();
  }
}
