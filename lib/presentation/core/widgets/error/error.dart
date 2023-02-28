import 'package:flutter/material.dart';
import 'package:posts_app/domain/core/entities/failure.dart';
import 'package:posts_app/presentation/core/widgets/error/no_network.dart';

class DisplayErrorWidget extends StatelessWidget {
  final Failure failure;
  final Function retry;
  const DisplayErrorWidget(
      {Key? key, required this.failure, required this.retry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getFailWidget(parseFail(failure)),
        const SizedBox(
          height: 20,
        ),
        Text(failure.message),
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

enum ErrorType { network, remote }

ErrorType parseFail(Failure failure) {
  if (failure is ServerFailure) {
    if (failure.code == ServerErrorCode.noNetwork) {
      return ErrorType.network;
    } else {
      return ErrorType.remote;
    }
  } else {
    return ErrorType.remote;
  }
}

Widget getFailWidget(ErrorType type) {
  if (type == ErrorType.network) {
    return const NoNetwork();
  } else {
    return const Center();
  }
}
