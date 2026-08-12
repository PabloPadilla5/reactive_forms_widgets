import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A [ReactiveDropdownMenu] that contains a [DropdownMenu].
///
/// This is a convenience widget that wraps a [DropdownMenu] widget in a
/// [ReactiveDropdownMenu].
///
/// A [ReactiveForm] ancestor is required.
///
class ReactiveDropdownMenu<T, V> extends ReactiveFocusableFormField<T, V> {
  /// Creates a [ReactiveDropdownMenu] that contains a [DropdownMenu].
  ///
  /// Can optionally provide a [formControl] to bind this widget to a control.
  ///
  /// Can optionally provide a [formControlName] to bind this ReactiveFormField
  /// to a [FormControl].
  ///
  /// Must provide one of the arguments [formControl] or a [formControlName],
  /// but not both at the same time.
  ///
  /// Can optionally provide a [validationMessages] argument to customize a
  /// message for different kinds of validation errors.
  ///
  /// Can optionally provide a [valueAccessor] to set a custom value accessors.
  /// See [ControlValueAccessor].
  ///
  /// Can optionally provide a [showErrors] function to customize when to show
  /// validation messages. Reactive Widgets make validation messages visible
  /// when the control is INVALID and TOUCHED, this behavior can be customized
  /// in the [showErrors] function.
  ///
  /// ### Example:
  /// Binds a text field.
  /// ```
  /// final form = fb.group({'email': Validators.required});
  ///
  /// ReactiveDropdownMenu(
  ///   formControlName: 'email',
  /// ),
  ///
  /// ```
  ///
  /// Binds a text field directly with a *FormControl*.
  /// ```
  /// final form = fb.group({'email': Validators.required});
  ///
  /// ReactiveDropdownMenu(
  ///   formControl: form.control('email'),
  /// ),
  ///
  /// ```
  ///
  /// Customize validation messages
  /// ```dart
  /// ReactiveDropdownMenu(
  ///   formControlName: 'email',
  ///   validationMessages: {
  ///     ValidationMessage.required: 'The email must not be empty',
  ///     ValidationMessage.email: 'The email must be a valid email',
  ///   }
  /// ),
  /// ```
  ///
  /// Customize when to show up validation messages.
  /// ```dart
  /// ReactiveDropdownMenu(
  ///   formControlName: 'email',
  ///   showErrors: (control) => control.invalid && control.touched && control.dirty,
  /// ),
  /// ```
  ///
  /// For documentation about the various parameters, see the [DropdownMenu] class
  /// and [DropdownMenu], the constructor.
  ReactiveDropdownMenu({
    super.key,
    Key? widgetKey,
    super.formControlName,
    super.formControl,
    super.validationMessages,
    super.valueAccessor,
    super.showErrors,
    super.focusNode,

    //////////////////////////////////////////////////////////////////////////
    bool enabled = true,
    double? width,
    double? menuHeight,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool showTrailingIcon = true,
    FocusNode? trailingIconFocusNode,
    Widget? label,
    String? hintText,
    String? helperText,
    Widget? selectedTrailingIcon,
    bool enableFilter = false,
    bool enableSearch = true,
    TextInputType? keyboardType,
    TextStyle? textStyle,
    TextAlign textAlign = TextAlign.start,
    InputDecorationTheme? inputDecorationTheme,
    DropdownMenuDecorationBuilder? decorationBuilder,
    MenuStyle? menuStyle,
    TextEditingController? controller,
    ValueChanged<V?>? onSelected,
    bool? requestFocusOnTap,
    bool selectOnly = false,
    required List<DropdownMenuEntry<V>> dropdownMenuEntries,
    EdgeInsets? expandedInsets,
    FilterCallback<V>? filterCallback,
    SearchCallback<V>? searchCallback,
    Offset? alignmentOffset,
    List<TextInputFormatter>? inputFormatters,
    DropdownMenuCloseBehavior closeBehavior = DropdownMenuCloseBehavior.all,
    int? maxLines = 1,
    TextInputAction? textInputAction,
    double? cursorHeight,
    String? restorationId,
    MenuController? menuController,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
  }) : super(
         builder: (field) {
           return DropdownMenu<V>(
             key: widgetKey,
             enabled: enabled && field.control.enabled,
             width: width,
             menuHeight: menuHeight,
             leadingIcon: leadingIcon,
             trailingIcon: trailingIcon,
             showTrailingIcon: showTrailingIcon,
             trailingIconFocusNode: trailingIconFocusNode,
             label: label,
             hintText: hintText,
             helperText: helperText,
             errorText: field.errorText,
             selectedTrailingIcon: selectedTrailingIcon,
             enableFilter: enableFilter,
             enableSearch: enableSearch,
             keyboardType: keyboardType,
             textStyle: textStyle,
             textAlign: textAlign,
             inputDecorationTheme: inputDecorationTheme,
             decorationBuilder: decorationBuilder,
             menuStyle: menuStyle,
             controller: controller,
             initialSelection: field.value,
             onSelected: (value) {
               field.didChange(value);
               onSelected?.call(value);
             },
             focusNode: field.focusNode,
             requestFocusOnTap: requestFocusOnTap,
             selectOnly: selectOnly,
             dropdownMenuEntries: dropdownMenuEntries,
             expandedInsets: expandedInsets,
             filterCallback: filterCallback,
             searchCallback: searchCallback,
             alignmentOffset: alignmentOffset,
             inputFormatters: inputFormatters,
             closeBehavior: closeBehavior,
             maxLines: maxLines,
             textInputAction: textInputAction,
             cursorHeight: cursorHeight,
             restorationId: restorationId,
             menuController: menuController,
             scrollPadding: scrollPadding,
           );
         },
       );
}
