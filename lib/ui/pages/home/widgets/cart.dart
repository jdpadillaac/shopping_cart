part of '../home_page.dart';

class _HomeCart extends StatelessWidget {
  const _HomeCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ShoppingCartBloc>(context, listen: true);
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Center(
              child: Text(
                bloc.productList.length.toString(),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
          ),
          child: InkWell(
            child: Icon(Icons.shopping_cart),
          ),
        ),
      ],
    );
  }
}
