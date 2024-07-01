import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/styles.dart';

class AppDialogUpload extends StatelessWidget {
  final String title;
  final Widget contentWidget;
  final String txtConfirm;
  final void Function()? onConfirm;
  final void Function()? onCancel;
  final bool isBtnDisable;
  AppDialogUpload(
      {Key? key,
      required this.title,
      required this.contentWidget,
      required this.txtConfirm,
      this.onConfirm,
      this.onCancel,
      required this.isBtnDisable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Material(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              style: AppStyles.dialogTitle,
                            ),
                            AppStyles.vSpaceSmall,
                            contentWidget
                          ],
                        )),
                    isBtnDisable
                        ? AppStyles.vSpaceXSmall
                        : Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(18),
                                  bottomRight: Radius.circular(18)),
                              color: AppColors.lightgray,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                const SizedBox(width: 40),
                                OutlinedButton(
                                  child: Text('Cancel',
                                      style: AppStyles.btnTxtPink),
                                  style: AppStyles.btnOutlineCancel,
                                  onPressed: onCancel,
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  child: Text(txtConfirm,
                                      style: AppStyles.btnSmTxtWhite),
                                  style: AppStyles.btnSmElevatedPurple,
                                  onPressed: onConfirm,
                                ),
                              ],
                            ))
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
