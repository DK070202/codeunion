import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({
    required this.errorMessage,
    required this.postDismiss,
    super.key,
  });
  final String errorMessage;
  final VoidCallback postDismiss;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Input is not valid'),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          errorMessage,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Okay'),
          onPressed: () {
            context.pop();
            postDismiss();
          },
        )
      ],
    );
  }
}
