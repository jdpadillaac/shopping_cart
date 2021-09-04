import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';


class AppOverlay {
  final BuildContext context;

  AppOverlay(this.context);

  List<Widget>? children;
  late String closeBtnLabel;
  VoidCallback? onClosedPressed;
  VoidCallback? onAcceptPressed;

  Future<dynamic> showOverlay({
    required List<Widget>? children,
    VoidCallback? onClosedPressed,
    String closeBtnLabel = 'CERRAR',
    String? acceptButtonText,
    VoidCallback? onAcceptTap,
  }) {
    assert(children != null && children.isNotEmpty);

    this.children = children;
    this.closeBtnLabel = closeBtnLabel;
    this.onClosedPressed = onClosedPressed;
    onAcceptPressed = onAcceptTap;

    return showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (BuildContext context) => BackdropFilter(
        key: const Key('bc-overrlay-container-screen'),
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: _getContainerWidget(acceptButtonText),
      ),
    ).then((value) {
      if (this.onClosedPressed != null) {
        this.onClosedPressed!();
      }
      return value;
    });
  }

  Widget _getContainerWidget(String? accept) {
    final double horizontalSpace = _getHorizontalSpaceContainer();
    final double verticalSpace = MediaQuery.of(context).padding.top;
    final EdgeInsets windowViewInsets = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance!.window.viewInsets,
      WidgetsBinding.instance!.window.devicePixelRatio,
    );

    return Card(
      key: const Key('overrlay-container-card'),
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSpacing.md),
          topLeft: Radius.circular(AppSpacing.md),
        ),
      ),
      margin: EdgeInsets.only(
        top: verticalSpace,
        right: horizontalSpace,
        left: horizontalSpace,
        bottom: windowViewInsets.bottom,
      ),
      child: _getChildWidget(accept),
    );
  }

  double _getHorizontalSpaceContainer() {
    double multiplier = 2;
    final Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      multiplier = 6;
    }

    final double spaceHorizontal = AppSpacing.md * multiplier;
    return spaceHorizontal;
  }

  void hideOverlay() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  void _onCloseOverlay() {
    hideOverlay();

    if (onClosedPressed != null) {
      onClosedPressed!.call();
    }
  }

  Widget _getChildWidget(String? accept) => Column(
        key: const Key('overrlay-container-column'),
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _getSwipeLine(),
          _getChildrenContainer(),
          _getCloseButton(accept),
        ],
      );

  Widget _getSwipeLine() =>
      const Padding(padding: EdgeInsets.all(AppSpacing.md), child: Text(''));

  Widget _getChildrenContainer() => Flexible(
        child: SingleChildScrollView(
          child: Column(
            key: const Key('overrlay-container-children'),
            mainAxisSize: MainAxisSize.min,
            children: children!,
          ),
        ),
      );

  Widget _getCloseButton(String? accept) => SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
              left: AppSpacing.md, right: AppSpacing.md, top: AppSpacing.md),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: AppSpacing.sm,
              ),
              Container(
                  width: double.infinity,
                margin: const EdgeInsets.only(
                  bottom: 10
                ),
                child: InkWell(
                  onTap: _onCloseOverlay,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(AppSpacing.sl),
                    ),
                    child: Center(
                      child: Text(closeBtnLabel),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
