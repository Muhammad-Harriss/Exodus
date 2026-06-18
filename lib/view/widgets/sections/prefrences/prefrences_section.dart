// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controllers/auth_controller.dart';

class PreferencesSection extends StatefulWidget {
  const PreferencesSection({super.key});

  @override
  State<PreferencesSection> createState() => _PreferencesSectionState();
}

class _PreferencesSectionState extends State<PreferencesSection> {

  final authController = Get.find<AuthController>();

  bool _isEditing = false;

  final _firstNameController     = TextEditingController();
  final _lastNameController      = TextEditingController();
  final _fullNameController      = TextEditingController();
  final _emailController         = TextEditingController();
  final _phoneController         = TextEditingController();
  final _cryptoAddressController = TextEditingController();

  bool _agreeToOffers = true;

  @override
  void initState() {
    super.initState();
    _populateFromProfile();
  }

  void _populateFromProfile() {
    final profile = authController.userProfile.value;
    if (profile == null) return;

    _firstNameController.text     = profile['first_name']     ?? '';
    _lastNameController.text      = profile['last_name']      ?? '';
    _fullNameController.text      = profile['full_name']      ?? '';
    _emailController.text         = profile['email']          ?? '';
    _phoneController.text         = profile['phone_number']   ?? '';
    _cryptoAddressController.text = profile['crypto_address'] ?? '';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cryptoAddressController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    if (_isEditing) {
      authController.updateProfile(
        firstName    : _firstNameController.text,
        lastName     : _lastNameController.text,
        fullName     : _fullNameController.text,
        email        : _emailController.text,
        phoneNumber  : _phoneController.text,
        cryptoAddress: _cryptoAddressController.text,
      );
    }
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      if (authController.userProfile.value == null) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 80),
          child  : Center(
            child: CircularProgressIndicator(
              color: Color(0xFF3853A4),
            ),
          ),
        );
      }

      return Container(
        width  : double.infinity,
        color  : const Color(0xFF080818),
        padding: const EdgeInsets.fromLTRB(18, 22, 18, 40),
        child  : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children          : [

            // ── Card wrapping all fields ─────────────────
            // Gives the data a defined boundary so it reads
            // as one grouped block instead of floating text.
            Container(
              width     : double.infinity,
              padding   : const EdgeInsets.fromLTRB(18, 22, 18, 22),
              decoration: BoxDecoration(
                color       : const Color(0xFF0D0D17),
                borderRadius: BorderRadius.circular(14),
                border      : Border.all(
                  color: Colors.white.withOpacity(0.06),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children          : [

                  _PreferenceField(
                    label      : 'First Name',
                    controller : _firstNameController,
                    isEditing  : _isEditing,
                  ),

                  _Divider(),

                  _PreferenceField(
                    label      : 'Last Name',
                    controller : _lastNameController,
                    isEditing  : _isEditing,
                  ),

                  _Divider(),

                  _PreferenceField(
                    label      : 'Full Name',
                    controller : _fullNameController,
                    isEditing  : _isEditing,
                  ),

                  _Divider(),

                  _PreferenceField(
                    label       : 'Email',
                    controller  : _emailController,
                    isEditing   : _isEditing,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  _Divider(),

                  _PreferenceField(
                    label       : 'Phone Number',
                    controller  : _phoneController,
                    isEditing   : _isEditing,
                    keyboardType: TextInputType.phone,
                  ),

                  _Divider(),

                  _PreferenceField(
                    label      : 'Crypto Address',
                    controller : _cryptoAddressController,
                    isEditing  : _isEditing,
                    isLast     : true,
                  ),

                  // ── Checkbox — only in edit mode ──────────
                  if (_isEditing) ...[
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children          : [
                        GestureDetector(
                          onTap: () => setState(() {
                            _agreeToOffers = !_agreeToOffers;
                          }),
                          child: Container(
                            width : 18,
                            height: 18,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              color       : _agreeToOffers
                                  ? const Color(0xFF3853A4)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(3),
                              border      : Border.all(
                                color: const Color(0xFF3853A4),
                                width: 1.4,
                              ),
                            ),
                            child: _agreeToOffers
                                ? const Icon(
                                    Icons.check,
                                    size : 13,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Send me test offers, news and updates',
                            style: GoogleFonts.montserrat(
                              fontSize  : 12,
                              fontWeight: FontWeight.w500,
                              color     : Colors.white60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ],
              ),
            ),

            const SizedBox(height: 28),

            // ── Edit preferences / Save button ────────────
            Obx(() => GestureDetector(
              onTap: authController.isLoading.value ? null : _toggleEdit,
              child: Container(
                width : double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3853A4),
                      Color(0xFF4463BF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow   : [
                    BoxShadow(
                      color     : const Color(0xFF3853A4).withOpacity(0.35),
                      blurRadius: 14,
                      offset    : const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: authController.isLoading.value
                      ? const SizedBox(
                          width : 20,
                          height: 20,
                          child : CircularProgressIndicator(
                            color     : Colors.white,
                            strokeWidth: 2.2,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children         : [
                            Icon(
                              _isEditing
                                  ? Icons.check_rounded
                                  : Icons.edit_outlined,
                              color: Colors.white,
                              size : 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _isEditing ? 'Save' : 'Edit preferences',
                              style: GoogleFonts.montserrat(
                                fontSize  : 15,
                                fontWeight: FontWeight.w600,
                                color     : Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            )),

          ],
        ),
      );
    });
  }
}

// ── Divider between fields inside the card ──────────────
class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child  : Container(
        height: 1,
        color : Colors.white.withOpacity(0.06),
      ),
    );
  }
}

// ── Reusable Preference Field ───────────────────────────
class _PreferenceField extends StatelessWidget {
  final String                 label;
  final TextEditingController  controller;
  final bool                   isEditing;
  final TextInputType          keyboardType;
  final bool                   isLast;

  const _PreferenceField({
    required this.label,
    required this.controller,
    required this.isEditing,
    this.keyboardType = TextInputType.text,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [

        // ── Label — uppercase, muted, small ───────────
        // This is the key clarity fix: label is now visually
        // distinct (smaller, letter-spaced, muted blue-grey)
        // from the value (larger, white, clearly the answer).
        Text(
          label.toUpperCase(),
          style: GoogleFonts.montserrat(
            fontSize     : 10.5,
            fontWeight   : FontWeight.w700,
            color        : const Color(0xFF6080DE),
            letterSpacing: 0.8,
          ),
        ),

        const SizedBox(height: 6),

        // ── Value: read-only text OR editable input ────
        isEditing
            ? Container(
                width : double.infinity,
                height: 42,
                decoration: BoxDecoration(
                  color       : Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(6),
                  border      : Border.all(
                    color: Colors.white.withOpacity(0.15),
                    width: 0.8,
                  ),
                ),
                child: TextField(
                  controller  : controller,
                  keyboardType: keyboardType,
                  style       : GoogleFonts.montserrat(
                    fontSize  : 14,
                    fontWeight: FontWeight.w500,
                    color     : Colors.white,
                  ),
                  decoration: InputDecoration(
                    border        : InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                  ),
                ),
              )
            : Text(
                controller.text.isEmpty ? '—' : controller.text,
                style: GoogleFonts.montserrat(
                  fontSize  : 15.5,
                  fontWeight: FontWeight.w500,
                  color     : Colors.white,
                ),
              ),

      ],
    );
  }
}