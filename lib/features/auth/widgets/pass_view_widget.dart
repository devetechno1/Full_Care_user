import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/features/auth/controllers/deliveryman_registration_controller.dart';
import 'package:sixam_mart/features/auth/controllers/store_registration_controller.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/styles.dart';

import '../controllers/auth_controller.dart';

class PassViewWidget extends StatelessWidget {
  final bool forStoreRegistration;
  final bool forUserRegistration;

  const PassViewWidget({
    super.key,
    this.forStoreRegistration = false,
    this.forUserRegistration = true,
  });

  @override
  Widget build(BuildContext context) {
    if (forStoreRegistration) {
      return GetBuilder<StoreRegistrationController>(builder: (storeRegController) {
        return _buildPassView(
          context,
          lengthCheck: storeRegController.lengthCheck,
          numberCheck: storeRegController.numberCheck,
          uppercaseCheck: storeRegController.uppercaseCheck,
          lowercaseCheck: storeRegController.lowercaseCheck,
          specialCheck: storeRegController.spatialCheck,
        );
      });
    } else if (forUserRegistration) {
      return GetBuilder<AuthController>(builder: (userRegController) {
        return _buildPassView(
          context,
          lengthCheck: userRegController.lengthCheck,
          numberCheck: userRegController.numberCheck,
          uppercaseCheck: userRegController.uppercaseCheck,
          lowercaseCheck: userRegController.lowercaseCheck,
          specialCheck: userRegController.spatialCheck,
        );
      });
    } else {
      return GetBuilder<DeliverymanRegistrationController>(builder: (deliveryRegController) {
        return _buildPassView(
          context,
          lengthCheck: deliveryRegController.lengthCheck,
          numberCheck: deliveryRegController.numberCheck,
          uppercaseCheck: deliveryRegController.uppercaseCheck,
          lowercaseCheck: deliveryRegController.lowercaseCheck,
          specialCheck: deliveryRegController.spatialCheck,
        );
      });
    }
  }

  Widget _buildPassView(
    BuildContext context, {
    required bool lengthCheck,
    required bool numberCheck,
    required bool uppercaseCheck,
    required bool lowercaseCheck,
    required bool specialCheck,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
      child: Wrap(
        children: [
          view('8_or_more_character'.tr, lengthCheck),
          view('1_number'.tr, numberCheck),
          view('1_upper_case'.tr, uppercaseCheck),
          view('1_lower_case'.tr, lowercaseCheck),
          view('1_special_character'.tr, specialCheck),
        ],
      ),
    );
  }

  Widget view(String title, bool done) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(done ? Icons.check : Icons.clear, color: done ? Colors.green : Colors.red, size: 12),
          Text(title, style: robotoRegular.copyWith(color: done ? Colors.green : Colors.red, fontSize: 12)),
        ],
      ),
    );
  }
}
