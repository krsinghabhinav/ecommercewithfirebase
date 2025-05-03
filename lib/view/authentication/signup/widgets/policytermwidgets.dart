
import 'package:flutter/material.dart';

import '../../../../common/cusotm_widgets/customText.dart';
import '../../../../utils/constants/custom_texts_string.dart';

class policytermwidgets extends StatelessWidget {
  const policytermwidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        CustomtextWidget(
          title: CustomTextsString.iAgreeTo,
          color: Colors.grey,
          fontSize: 13,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${CustomTextsString.privacyPolicy}',
                style: TextStyle(
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  decorationColor: Colors.blue,
                ),
              ),
    
              TextSpan(
                text: ' ${CustomTextsString.and} ',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              TextSpan(
                text: '${CustomTextsString.termofuse}',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 13,
                  color: Colors.blue,
                  decorationColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
