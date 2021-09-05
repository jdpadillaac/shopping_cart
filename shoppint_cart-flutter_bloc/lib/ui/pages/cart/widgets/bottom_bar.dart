part of '../cart_page.dart';

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive(context);
    final pageBloc = BlocProvider.of<CartBloc>(context);
    final shoppingCartBloc =
        BlocProvider.of<ShoppingCartBloc>(context, listen: true);

    int total = 0;

    for (final item in shoppingCartBloc.productList) {
      total = total + item.quantity * item.price;
    }

    return InkWell(
      onTap: () {
        pageBloc.add(
          CompleteButtonPressed(products: shoppingCartBloc.productList),
        );
      },
      child: Container(
        height: responsive.height(110),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              color: AppColors.gray,
              blurRadius: 10,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: responsive.height(AppSpacing.md),
          horizontal: responsive.width(
            AppSpacing.md,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Center(
            child: Text(
              'Completar: ${total.toString()} ',
              style: const TextStyle(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
