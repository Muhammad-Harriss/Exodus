import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../widgets/sections/navbar_widget.dart';
import 'order_completed_screen.dart';

class ProcessingPaymentScreen extends StatefulWidget {
  final String maskedCard;
  final String totalPrice;
  final String cryptoAddress;
  final String orderNumber;
  final String txHash;
  final List purchasedItems;

  const ProcessingPaymentScreen({
    super.key,
    required this.maskedCard,
    required this.totalPrice,
    required this.cryptoAddress,
    required this.orderNumber,
    required this.txHash,
    required this.purchasedItems,
  });

  @override
  State<ProcessingPaymentScreen> createState() => _ProcessingPaymentScreenState();
}

class _ProcessingPaymentScreenState extends State<ProcessingPaymentScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => OrderCompletedScreen(
        maskedCardNumber: widget.maskedCard,
        orderTotalPrice: widget.totalPrice,
        cryptoAddress: widget.cryptoAddress,
        orderIdNumber: widget.orderNumber,
        txHashUrl: widget.txHash,
        upgradedItems: widget.purchasedItems,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080818),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavbarWidget(),
            Expanded(
              child: Center(
                child: Container(
                  width: 309.42,
                  height: 277,
                  decoration: BoxDecoration(
                    color: const Color(0xFF131313),
                    borderRadius: BorderRadius.circular(13.39),
                    border: Border.all(color: const Color(0xFF4F4F4F), width: 0.7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Transaction pending',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.61,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 44.76),
                      Text(
                        'Processing...',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.61,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70, // Increased contrast logic opacity
                        ),
                      ),
                      const SizedBox(height: 21.52),
                      SizedBox(
                        width: 259,
                        height: 9.96,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.28),
                          child: const LinearProgressIndicator(
                            backgroundColor: Color(0xFF1A1A1A),
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3853A4)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}