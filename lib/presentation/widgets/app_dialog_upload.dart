import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/styles.dart';

class AppDialogUpload extends StatelessWidget {
  final String title;
  final Widget contentWidget;
  final String txtConfirm;
  final void Function() onConfirm;
  AppDialogUpload(
      {Key? key,
      required this.title,
      required this.contentWidget,
      required this.txtConfirm,
      required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Material(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(20.0),
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
                    Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18)),
                          color: AppColors.lightgray,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(width: 80),
                            ElevatedButton(
                              child: Text(txtConfirm,
                                  style: AppStyles.btnTxtWhite),
                              style: AppStyles.btnElevatedPurple,
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
