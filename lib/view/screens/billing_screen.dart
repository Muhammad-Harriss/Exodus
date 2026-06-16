import 'package:flutter/material.dart';
import '../widgets/sections/navbar_widget.dart';
import '../widgets/sections/payment/billing_info_section.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF080818),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Standard global header layout component
              NavbarWidget(),
              
              SizedBox(height: 24),
              
              // Core Billing UI block configuration component
              BillingInfoSection(),
              
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}