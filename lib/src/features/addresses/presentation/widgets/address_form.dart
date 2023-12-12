import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class AddressForm extends ConsumerStatefulWidget {
  const AddressForm({
    super.key,
    required this.address,
    required this.submit,
  });

  final Address address;
  final Future<void> Function(Address) submit;

  @override
  ConsumerState<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends ConsumerState<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _nameController = TextEditingController();
  final _streetController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void>? _save;

  @override
  void initState() {
    super.initState();

    final address = widget.address;

    _nipController.text = address.nip ?? '';
    _nameController.text = address.name;
    _streetController.text = address.street;
    _postalCodeController.text = address.postalCode;
    _cityController.text = address.city;
    _phoneController.text = address.phone;
    _emailController.text = address.email;
  }

  @override
  void dispose() {
    _nipController.dispose();
    _nameController.dispose();
    _streetController.dispose();
    _postalCodeController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final address = Address(
        id: widget.address.id,
        type: widget.address.type,
        nip: _nipController.text,
        name: _nameController.text,
        street: _streetController.text,
        postalCode: _postalCodeController.text,
        city: _cityController.text,
        phone: _phoneController.text,
        email: _emailController.text,
      );

      setState(() {
        _save = widget.submit(address);
      });

      _save?.then((_) {
        showSuccessSnackbar(
          context: context,
          content: context.l10n.addressesSaveSuccessSnackbar,
        );

        context.pop();
      }).catchError((error) {
        showErrorDialog(
          context: context,
          error: error,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.address.type == AddressType.payment)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: NipField(controller: _nipController),
            ),
          NameField(controller: _nameController),
          gapH10,
          StreetField(controller: _streetController),
          gapH10,
          PostalCodeField(controller: _postalCodeController),
          gapH10,
          CityField(controller: _cityController),
          gapH10,
          PhoneField(controller: _phoneController),
          gapH10,
          EmailField(controller: _emailController),
          gapH14,
          FutureBuilder(
            future: _save,
            builder: (context, snapshot) {
              final isLoading =
                  snapshot.connectionState == ConnectionState.waiting;

              return ElevatedButton(
                onPressed: isLoading ? null : _submit,
                child: isLoading
                    ? const Loader()
                    : Text(context.l10n.addressesSaveButton),
              );
            },
          ),
        ],
      ),
    );
  }
}
