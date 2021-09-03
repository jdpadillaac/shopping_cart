part of '../cart_page.dart';

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<ShoppingCartBloc>(context, listen: true);

    int total = 0;

    for (final item in bloc.productList) {
      total = total + item.quantity * item.price ;
    }

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -10), color: AppColors.gray, blurRadius: 10)
        ],
      ),
      padding: EdgeInsets.symmetric(
          vertical: AppSpacing.md, horizontal: AppSpacing.md),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Center(
          child: Text(
            'Completar:   ${total.toString()} ',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}