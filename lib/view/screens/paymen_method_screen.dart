import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/payment/payment_method_section.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF080818),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Standard global header layout component
            NavbarWidget(),
            
            // Core selection card widget section holding buttons
            Expanded(
              child: PaymentMethodSection(),
            ),
          ],
        ),
      ),
    );
  }
}