// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../controllers/cart_controller.dart';
import '../../../screens/processing_payment_screen.dart';

class BillingInfoSection extends StatefulWidget {
  const BillingInfoSection({super.key});

  @override
  State<BillingInfoSection> createState() => _BillingInfoSectionState();
}

class _BillingInfoSectionState extends State<BillingInfoSection> {
  final _formKey = GlobalKey<FormState>();
  final CartController cartController = Get.find<CartController>();

  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _address3Controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isLoading = false;

  String _getMaskedCard(String rawCard) {
    String clean = rawCard.replaceAll(RegExp(r'\s+'), '');
    if (clean.length < 4) return "xxxx xxxx xxxx 5749";
    return "xxxx xxxx xxxx ${clean.substring(clean.length - 4)}";
  }

  Future<void> _submitOrderToSupabase() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final double total = cartController.totalPrice;
      final String rawCard = _cardNumberController.text.trim();
      final String maskedCard = _getMaskedCard(rawCard);
      
      const String cryptoDest = '7872hd891dqunjxninsbnja';
      const String txHash = 'https://polygonscan.comtx/0x23c7e130e6bb969c43b0bbbc7e510af9b82a27ef3d9a044504f035ec85502c84';

      final List itemsPayload = cartController.cartItems.map((item) => {
        'title': item.title,
        'price': item.price,
        'imageName': item.imageName,
        'quantity': item.quantity.value
      }).toList();

      final response = await Supabase.instance.client.from('orders').insert({
        'card_number': maskedCard,
        'total_price': total,
        'crypto_address': cryptoDest,
        'hash_url': txHash,
        'items_json': itemsPayload,
      }).select().single();

      final String databaseOrderId = response['id'].toString();

      // Clear operational state memory right before shifting view routes
      cartController.cartItems.clear();

      Get.to(() => ProcessingPaymentScreen(
        maskedCard: maskedCard,
        totalPrice: '\$${total.toStringAsFixed(0)}',
        cryptoAddress: cryptoDest,
        orderNumber: '#$databaseOrderId',
        txHash: txHash,
        purchasedItems: itemsPayload,
      ));

    } catch (error) {
      Get.snackbar(
        "Error Processing Order", 
        error.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _address1Controller.dispose();
    _address2Controller.dispose();
    _address3Controller.dispose();
    _emailController.dispose();
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _cvvController.dispose();
    _expController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 354,
        padding: const EdgeInsets.only(bottom: 32),
        decoration: BoxDecoration(
          color: const Color(0xFF0F0F1E), // Deep background for container contrast
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: const Color(0xFF2A2A4A), width: 1),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Title Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 26),
                    Text(
                      'BILLING INFO',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF4463BF), width: 1),
                        ),
                        child: const Icon(Icons.close, color: Color(0xFF4463BF), size: 14),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  'Billing address',
                  style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),

              const SizedBox(height: 16),
              _buildInputFieldLabel('Address 1 *'),
              _buildTextFormField(_address1Controller, validator: (v) => v!.trim().isEmpty ? "Required field" : null),

              _buildInputFieldLabel('Address 2 *'),
              _buildTextFormField(_address2Controller, validator: (v) => v!.trim().isEmpty ? "Required field" : null),

              _buildInputFieldLabel('Address 3'),
              _buildTextFormField(_address3Controller),

              _buildInputFieldLabel('E-mail address *'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                        validator: (v) => !GetUtils.isEmail(v ?? '') ? "Invalid Email layout" : null,
                        decoration: _getInputDecoration(''),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 90.83,
                        height: 46, // Standardized input block height matching text fields
                        decoration: BoxDecoration(color: const Color(0xFF3853A4), borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Confirm', 
                            style: GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              Center(child: Container(width: 310, height: 1, color: const Color(0xFF2A2A4A))),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  'Credit card info',
                  style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),

              _buildInputFieldLabel('Name on card *'),
              _buildTextFormField(_cardNameController, validator: (v) => v!.trim().isEmpty ? "Required field" : null),

              _buildInputFieldLabel('Card number *'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: TextFormField(
                  controller: _cardNumberController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  validator: (v) => v!.replaceAll(' ', '').length < 12 ? "Invalid Card Layout" : null,
                  decoration: _getInputDecoration('xxxx-xxxx-xxxx-xxxx').copyWith(
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.credit_card, color: Colors.white70, size: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CVV *', style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70)),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _cvvController,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            validator: (v) => v!.trim().length < 3 ? "Error" : null,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                            decoration: _getInputDecoration(''),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('EXP date *', style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70)),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _expController,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                            validator: (v) => v!.trim().isEmpty ? "Required" : null,
                            decoration: _getInputDecoration('DD/MM/YYYY'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              _buildInputFieldLabel('Phone number'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: IntlPhoneField(
                  controller: _phoneController,
                  initialCountryCode: 'BE',
                  dropdownTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  pickerDialogStyle: PickerDialogStyle(
                    backgroundColor: const Color(0xFF0F0F1E),
                    countryNameStyle: const TextStyle(color: Colors.white),
                    countryCodeStyle: const TextStyle(color: Colors.white),
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    filled: true,
                    fillColor: const Color(0xFF14142B),
                    hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
                    counterText: '',
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF2A2A4A), width: 1)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF3853A4), width: 1.5)),
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.redAccent, width: 1)),
                    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.redAccent, width: 1.5)),
                  ),
                ),
              ),

              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: _isLoading ? null : _submitOrderToSupabase,
                  child: Container(
                    width: 207,
                    height: 56,
                    decoration: BoxDecoration(color: const Color(0xFF3853A4), borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: _isLoading 
                        ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                        : Text('Complete order', style: GoogleFonts.montserrat(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, bottom: 8),
      child: Text(text, style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70)),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, {String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 16),
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: _getInputDecoration(''),
      ),
    );
  }

  InputDecoration _getInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      filled: true,
      fillColor: const Color(0xFF14142B), // Clear inner textfield layer contrast color
      hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF2A2A4A), width: 1)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF3853A4), width: 1.5)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.redAccent, width: 1)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.redAccent, width: 1.5)),
    );
  }
}