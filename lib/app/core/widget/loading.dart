import 'package:flutter/material.dart';
import 'package:flutter_getx_tdd_template/app/core/widget/elevated_container.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ElevatedContainer(
        padding: EdgeInsets.all(AppValues.margin),
        child: CircularProgressIndicator(
          color: AppColors.loading,
        ),
      ),
    );
  }
}
