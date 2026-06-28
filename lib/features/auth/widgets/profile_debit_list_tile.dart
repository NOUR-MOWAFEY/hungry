import 'package:flutter/material.dart';

import '../../../shared/custom_text.dart';

class ProfileDebitListTile extends StatelessWidget {
  const ProfileDebitListTile({super.key, required this.visaNumber});
  final String? visaNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/icons/visa_icon.png', width: 80),

      title: CustomText(text: 'Debit card', size: 16, color: Colors.black),

      subtitle: CustomText(
        text: visaNumber == null || visaNumber!.isEmpty
            ? '**** **** **** 1234'
            : visaNumber!,
        size: 16,
        color: Colors.grey.shade700,
      ),

      trailing: CustomText(
        text: 'Default',
        size: 14,
        color: Colors.grey.shade700,
      ),
    );
  }
}
