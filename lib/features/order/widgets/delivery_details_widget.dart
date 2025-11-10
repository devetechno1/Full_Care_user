import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/styles.dart';

import '../../address/domain/models/address_model.dart';

class DeliveryDetailsWidget extends StatelessWidget {
  final bool from;
  final AddressModel? address;
  const DeliveryDetailsWidget({super.key, this.from = true, this.address});

  @override
  Widget build(BuildContext context) {
    final List<InlineSpan> floorNumber = _titleBody(
      'floor_no'.tr,
      address?.floor ?? '',
    );
    final List<InlineSpan> houseNumber = _titleBody(
      'house_no'.tr,
      address?.house ?? '',
      separator: floorNumber.isNotEmpty ? ', ' : null,
    );
    final List<InlineSpan> streetNumber = _titleBody(
      'street_number'.tr,
      address?.streetNumber ?? '',
      separator: houseNumber.isNotEmpty || floorNumber.isNotEmpty ? ', ' : null,
    );

    final List<InlineSpan> landmark = _titleBody(
      'landmark'.tr,
      address?.landmark ?? '',
      separator: streetNumber.isNotEmpty ||
              houseNumber.isNotEmpty ||
              floorNumber.isNotEmpty
          ? ', '
          : null,
    );

    final List<InlineSpan> all = [
      ...landmark,
      ...streetNumber,
      ...houseNumber,
      ...floorNumber,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: Dimensions.paddingSizeSmall,
      children: [
        Icon(
          from ? Icons.store : Icons.location_on,
          size: 28,
          color: from ? Colors.blue : Theme.of(context).primaryColor,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimensions.paddingSizeExtraSmall,
            children: [
              if (all.isNotEmpty)
                Text.rich(TextSpan(style: robotoMedium, children: all)),
              Text(
                address?.address ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: robotoRegular.copyWith(
                    color: Theme.of(context).disabledColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<InlineSpan> _titleBody(String title, String value, {String? separator}) {
    value = value.trim();
    if (value.isEmpty || value.toLowerCase() == 'null') return [];
    return [
      TextSpan(text: "$title: "),
      TextSpan(
        text: value,
        style: robotoMedium.copyWith(fontWeight: FontWeight.bold),
      ),
      if (separator != null) TextSpan(text: separator),
    ];
  }
}
