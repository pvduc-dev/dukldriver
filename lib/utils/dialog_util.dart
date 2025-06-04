import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtil {
  static void showErrorDialog(BuildContext context, String? message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Lỗi', style: TextStyle(color: Color(0xFFDC3545))),
        content: Text(
          message ?? 'Đã có lỗi xảy ra, vui lòng thử lại.',
          style: TextStyle(fontSize: 16),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true,
            child: Text('Đóng', style: TextStyle(color: Color(0xFFDC3545))),
          ),
        ],
        insetAnimationDuration: const Duration(milliseconds: 200),
        insetAnimationCurve: Curves.decelerate,
      ),
    );
  }

  static void showLoadingDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          Center(child: CupertinoActivityIndicator(radius: 15)),
    );
  }

  static void showSuccessDialog(BuildContext context, String? message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Thành công', style: TextStyle(color: Color(0xFF28A745))),
        content: Text(message ?? 'Thành công', style: TextStyle(fontSize: 16)),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text('Đóng', style: TextStyle(color: Color(0xFF28A745))),
          ),
        ],
        insetAnimationDuration: const Duration(milliseconds: 200),
        insetAnimationCurve: Curves.decelerate,
      ),
    );
  }

  static Future<void> showConfirmDialog(
    BuildContext context,
    String? message,
    Function() onConfirm,
  ) async {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Xác nhận', style: TextStyle(color: Colors.blue)),
        content: Text(
          message ?? 'Bạn có chắc chắn muốn thực hiện hành động này?',
          style: TextStyle(fontSize: 16),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Không', style: TextStyle(color: Colors.red)),
          ),
          CupertinoDialogAction(
            onPressed: () => {onConfirm(), Navigator.pop(context, true)},
            child: Text('Có', style: TextStyle(color: Colors.blue)),
          ),
        ],
        insetAnimationDuration: const Duration(milliseconds: 200),
        insetAnimationCurve: Curves.decelerate,
      ),
    );
  }
}
