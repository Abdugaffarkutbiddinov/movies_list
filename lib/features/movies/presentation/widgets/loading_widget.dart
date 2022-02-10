import 'package:flutter/cupertino.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(
      child: CupertinoActivityIndicator(
        radius: 20,
      ),
    ));
  }
}
