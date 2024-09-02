import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_play_shop/generated/assets.dart';
import 'package:google_play_shop/utils/colors_manager.dart';
import 'package:google_play_shop/utils/style_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

CachedNetworkImage buildCacheNetworkImage(
    {double? width, double? height, url, placeholder, imageColor}) {
  return CachedNetworkImage(
    placeholder: (context, url) {
      return SizedBox(
        width: width,
        height: height,
        child: placeholder ??
            Image.asset(
              Assets.imagesLoading,
              height: height,
              width: width,
              fit: BoxFit.fitHeight,
            ),
      );
    },
    errorWidget: (context, url, error) {
      return Container(
        color: imageColor,
        width: width,
        height: height,
        child: Image.asset(Assets.imagesImageError,
            fit: BoxFit.cover, width: width, height: height),
      );
    },
    imageUrl: url ?? "",
    fit: BoxFit.cover,
    alignment: Alignment.center,
    width: (width ?? 0) > 0 ? width : null,
    height: (height ?? 0) > 0 ? height : null,
    color: imageColor,
  );
}

Widget buildTextFieldWidget(
    {required TextEditingController? controller,
    required String hint,
    TextFieldType? type,
    Widget? suffix,
    FocusNode? focus,
    FocusNode? nextFocus,
    Color? textColor}) {
  return AppTextField(
    suffix: suffix,
    controller: controller,
    textFieldType: type ?? TextFieldType.OTHER,
    readOnly: type == null,
    textStyle: primaryTextStyle(size: 14,color: textColor ?? textPrimaryColorGlobal),
    focus: focus,
    nextFocus: nextFocus,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      filled: true,
      fillColor: grey.withOpacity(0.1),
      hintText: hint,
      hintStyle: secondaryTextStyle(),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    ),
  );
}

Widget buildButtonWidget(BuildContext context, String text, Function onTap,
    {bool enabled = true}) {
  return AppButton(
    disabledColor: Colors.grey,
    enabled: enabled,
    text: text,
    textStyle: boldTextStyle(color: white),
    color: ColorsManager.primary,
    onTap: onTap,
    width: context.width(),
  ).cornerRadiusWithClipRRect(20);
}

Widget buildCustomButton({
  double width = double.infinity,
  double height = 60,
  Color background = Colors.blue,
  double radius = 0.0,
  double fontSize = 16.0,
  Color fontColor = Colors.white,
  bool isIcon = false,
  IconData? icon,
  Color iconColor = Colors.white,
  required Function() function,
  required String text,
}) =>
    MaterialButton(
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      color: background,
      elevation: 7,
      onPressed: function,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isIcon)
            Row(
              children: [
                Text(
                  text,
                  style: StyleManager.textStyle16
                      .copyWith(fontWeight: FontWeight.normal,
                    fontSize: fontSize,
                    color: fontColor,),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  icon,
                  size: 24,
                  color: iconColor,
                ),
              ],
            ),
          if (!isIcon)
            Text(
              text,
              style: StyleManager.textStyle16.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: fontSize,
                color: fontColor,
              ),
            ),
        ],
      ),
    );

buildWebViewWidget(String url) {
  return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(Uri.parse(url)));
}
