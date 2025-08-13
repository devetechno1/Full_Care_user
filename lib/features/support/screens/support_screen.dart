import 'package:sixam_mart/features/splash/controllers/splash_controller.dart';
import 'package:sixam_mart/features/support/widgets/web_help_support_widget.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/common/widgets/custom_app_bar.dart';
import 'package:sixam_mart/common/widgets/custom_snackbar.dart';
import 'package:sixam_mart/common/widgets/footer_view.dart';
import 'package:sixam_mart/common/widgets/menu_drawer.dart';
import 'package:sixam_mart/features/support/widgets/support_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../helper/route_helper.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    final String url =
        "https://wa.me/${Get.find<SplashController>().configModel!.phone!.replaceAll('+', '')}";
    return Scaffold(
      appBar: CustomAppBar(title: 'help_support'.tr),
      endDrawer: const MenuDrawer(),
      endDrawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        padding: ResponsiveHelper.isDesktop(context)
            ? EdgeInsets.zero
            : const EdgeInsets.all(Dimensions.paddingSizeSmall),
        physics: const BouncingScrollPhysics(),
        child: Center(
            child: FooterView(
          child: ResponsiveHelper.isDesktop(context)
              ? const SizedBox(
                  width: double.infinity,
                  height: 650,
                  child: WebSupportScreen(),
                )
              : SizedBox(
                  width: Dimensions.webMaxWidth,
                  child: Column(children: [
                    const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                    Transform.scale(scale:2,child: Image.asset(Images.supportImage, height: 140,width: double.infinity)),
                    const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                    Image.asset(Images.logo, width: 140),
                    const SizedBox(height: 40),
                    SupportButtonWidget(
                      icon: Icons.location_on,
                      title: 'address'.tr,
                      color: Colors.blue,
                      info: Get.find<SplashController>().configModel!.address,
                      onTap: () {},
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    SupportButtonWidget(
                      icon: Icons.call,
                      title: 'call'.tr,
                      color: Colors.red,
                      info: Get.find<SplashController>().configModel!.phone,
                      onTap: () async {
                        if (await canLaunchUrlString(
                            'tel:${Get.find<SplashController>().configModel!.phone}')) {
                          launchUrlString(
                              'tel:${Get.find<SplashController>().configModel!.phone}');
                        } else {
                          showCustomSnackBar(
                              '${'can_not_launch'.tr} ${Get.find<SplashController>().configModel!.phone}');
                        }
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    SupportButtonWidget(
                      icon: Icons.mail_outline,
                      title: 'email_us'.tr,
                      color: Colors.green,
                      info: Get.find<SplashController>().configModel!.email,
                      onTap: () {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: Get.find<SplashController>().configModel!.email,
                        );
                        launchUrlString(emailLaunchUri.toString());
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    SupportButtonWidget(
                      icon: Icons.chat,
                      title: 'live_chat'.tr,
                      color: Colors.deepPurpleAccent,
                      info: "contact_with_our_team".tr,
                      onTap: () {
                        Get.toNamed(RouteHelper.getConversationRoute());
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    SupportButtonWidget(
                      image: 'assets/image/whatsapp_icon.png',
                      title: 'whatsapp'.tr,
                      color: Colors.green,
                      info: Get.find<SplashController>().configModel!.phone,
                      onTap: () {
                        launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ])),
        )),
      ),
    );
  }
}
