import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants/app_config.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

/**
 * Created by karthi_rt on 18-08-2025.
 */

class Helpers {
  // Capitalize the first letter of a string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  // Format a DateTime to a readable string
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  // SizedBox
  static Widget appSizedBox({
    double? width,
    double? height,
    Widget? child,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }


  // Text
  static Widget appText({
    String? text,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.left,
    Color? color,
    FontStyle fontStyle = FontStyle.normal,
    String? fontFamily,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    double? width,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    TextDirection? textDirection,
    EdgeInsets padding = EdgeInsets.zero,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    return Container(
      margin: margin,
      width: width,
      child: Padding(
        padding: padding,
        child: Text(
          text ?? '',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color ?? AppColors.textPrimary,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            decorationThickness: decorationThickness,
          ),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
        ),
      ),
    );
  }

  // ElevatedButton
  static Widget appElevatedButton({
    required VoidCallback? onPressed,
    String? label, // Optional if child is provided
    Widget? child, // Optional custom child widget
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    EdgeInsets margin = EdgeInsets.zero,
    Size? minimumSize,
    Size? fixedSize,
    double? width,
    double? height,
    BorderRadius? borderRadius,
    BorderSide? side,
    OutlinedBorder? shape,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    Color? textColor,
    FontStyle fontStyle = FontStyle.normal,
    String? fontFamily,
    double? letterSpacing,
    double? wordSpacing,
    TextDecoration? textDecoration,
    bool enabled = true,
    Duration? animationDuration,
    Curve? curve,
  }) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: foregroundColor ?? AppColors.textPrimary,
          elevation: elevation,
          padding: padding,
          minimumSize: minimumSize,
          fixedSize: (width != null || height != null)
              ? Size(width ?? double.infinity, height ?? double.infinity)
              : fixedSize,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(AppConfig.defaultBorderRadius),
                side: side ?? BorderSide.none,
              ),
          animationDuration: animationDuration ?? AppConfig.animationDuration,
        ),
        child: child ??
            (label != null
                ? appText(
              text: label,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor ?? foregroundColor ?? AppColors.textPrimary,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              decoration: textDecoration,
            )
                : const SizedBox.shrink()),
      ),
    );
  }

  // header row
  static Widget appHeaderRow({
    required String text,
    IconData? leadingIcon,
    IconData? trailingIcon,
    VoidCallback? onLeadingTap,
    VoidCallback? onTrailingTap,
  }) {
    return Row(
      children: [
        if (leadingIcon != null)
          InkWell(
            onTap: onLeadingTap ?? () {},
            child: Icon(leadingIcon),
          ),
        Expanded(
          child: Helpers.appText(
            text: text,
            width: Get.width,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
        if (trailingIcon != null)
          InkWell(
            onTap: onTrailingTap ?? () {},
            child: Icon(trailingIcon),
          ),
      ],
    );
  }

  // account row
  static Widget appAccountRow({
    required String title,
    required String subtitle,
    required String svgPath,
    Color? iconBackgroundColor,
    EdgeInsets padding = const EdgeInsets.all(12.0),
    double textSize = 16.0,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(color: iconBackgroundColor ?? AppColors.backgroundSecondary, borderRadius: BorderRadius.circular(10.0),),
            padding: padding,
            child: SvgPicture.asset(svgPath, width: 24.0, height: 24.0, fit: BoxFit.contain, colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),)
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Helpers.appText(text: title, fontWeight: FontWeight.bold, fontSize: 16, textAlign: TextAlign.start, color: textColor,),
                  Helpers.appText(text: subtitle, fontSize: 14, textAlign: TextAlign.start, color: AppColors.textSecondary,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Notification widget
  static Widget notificationWidgetTwo({
    String labelText = AppStrings.daysBefore,
    String valueText = AppStrings.two,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Helpers.appText(
            text: labelText,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            textAlign: TextAlign.start,
            color: AppColors.textPrimary,
          ),
          Helpers.appText(
            text: valueText,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            textAlign: TextAlign.start,
            color: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }

  // switch row
  static Widget appSwitchRow({
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Helpers.appText(text: title, fontWeight: FontWeight.bold, fontSize: 16, textAlign: TextAlign.start, color: AppColors.textPrimary,),
              if (subtitle != null)
                Helpers.appText(text: subtitle, fontSize: 14, textAlign: TextAlign.start, color: AppColors.textSecondary,),
            ],
          ),
        ),
        Switch(
          activeTrackColor: AppColors.backgroundSecondary,
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: AppColors.backgroundSecondary,
          value: value,
          activeColor: AppColors.primary,
          onChanged: onChanged,
        ),
      ],
    );
  }
}


// TextForm Field
class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.suffix,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.sentences,
    this.validator,
    this.onChanged,
    this.autofillHints,
    this.enabled = true,
    this.maxLines = 1,
    this.fillColor,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;
  final bool enabled;
  final int maxLines;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(14);

    OutlineInputBorder outline(Color color, {double width = 1}) =>
        OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: color, width: width),
        );

    final colorScheme = theme.colorScheme;
    final fill = theme.brightness == Brightness.dark
        ? colorScheme.surfaceContainerHighest.withOpacity(0.25)
        : colorScheme.surfaceContainerHighest.withOpacity(0.6);

    return TextFormField(
      controller: controller,
      style: const TextStyle(color: AppColors.textSecondary),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      validator: validator,
      onChanged: onChanged,
      autofillHints: autofillHints,
      enabled: enabled,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.normal),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffix,
        filled: true,
        fillColor: fillColor ?? fill,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: outline(Colors.transparent),
        enabledBorder: outline(Colors.transparent),
        disabledBorder: outline(Colors.transparent),
        errorBorder: outline(colorScheme.error),
        focusedErrorBorder: outline(Colors.transparent),
        focusedBorder: outline(Colors.transparent),
      ),
    );
  }
}

// DateForm Field
class AppDateFormField extends FormField<DateTime> {
  AppDateFormField({
    super.key,
    super.initialValue,
    this.label,
    this.hintText,
    this.firstDate,
    this.lastDate,
    this.onChanged,
    super.validator,
    this.enabled = true,
    this.icon,
    this.fillColor,
  }) : super(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    builder: (state) {
      final context = state.context;
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;
      final borderRadius = BorderRadius.circular(14);

      OutlineInputBorder outline(Color color, {double width = 1}) =>
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: color, width: width),
          );

      final fill = theme.brightness == Brightness.dark
          ? colorScheme.surfaceContainerHighest.withOpacity(0.25)
          : colorScheme.surfaceContainerHighest.withOpacity(0.6);

      final hasValue = state.value != null;
      final text = hasValue
          ? _formatDate(state.value!)
          : (hintText ?? 'Select date');

      return InkWell(
        borderRadius: borderRadius,
        onTap: enabled
            ? () async {
          final now = DateTime.now();
          final picked = await showDatePicker(
            context: context,
            initialDate: state.value ?? DateTime(now.year - 18, now.month, now.day),
            firstDate: firstDate ?? DateTime(1900),
            lastDate: lastDate ?? DateTime(2100),
            helpText: label,
          );
          if (picked != null) {
            state.didChange(picked);
            onChanged?.call(picked);
          }
        }
            : null,
        child: InputDecorator(
          isEmpty: !hasValue,
          isFocused: false,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: fillColor ?? fill,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: outline(Colors.transparent),
            enabledBorder: outline(Colors.transparent),
            disabledBorder: outline(Colors.transparent),
            errorBorder: outline(colorScheme.error),
            focusedErrorBorder: outline(Colors.transparent),
            // focusedErrorBorder: outline(colorScheme.error, width: 1.5),
            focusedBorder: outline(Colors.transparent),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasValue)
                  IconButton(
                    tooltip: 'Clear',
                    onPressed: enabled
                        ? () {
                      state.didChange(null);
                      onChanged?.call(null);
                    }
                        : null,
                    icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary,),
                  ),
                IconButton(
                  tooltip: 'Pick date',
                  onPressed: enabled
                      ? () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: state.value ??
                          DateTime(now.year - 18, now.month, now.day),
                      firstDate: firstDate ?? DateTime(1900),
                      lastDate: lastDate ?? DateTime(2100),
                      helpText: label,
                    );
                    if (picked != null) {
                      state.didChange(picked);
                      onChanged?.call(picked);
                    }
                  }
                      : null,
                  icon: Icon(icon ?? Icons.calendar_today_rounded, color: AppColors.textSecondary,),
                ),
              ],
            ),
            errorText: state.errorText,
          ),
          child: Text(
            text,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: hasValue
                  ? AppColors.textSecondary
                  : AppColors.textSecondary,
            ),
          ),
        ),
      );
    },
  );

  final String? label;
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime?>? onChanged;
  final bool enabled;
  final IconData? icon;
  final Color? fillColor;

  static String _formatDate(DateTime d) {
    const months = [
      'January','February','March','April','May','June','July','August','September','October','November','December'
    ];
    return '${d.day.toString().padLeft(2, '0')} ${months[d.month - 1]} ${d.year}';
  }
}