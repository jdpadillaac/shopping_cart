part of '../home_page.dart';

class _HomeCart extends StatelessWidget {
  const _HomeCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ShoppingCartBloc>(context, listen: true);
    return InkWell(
      onTap: () {
        if (bloc.productList.isNotEmpty) {
          CartPage.navigate(context);
        }
      },
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(
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
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
            ),
            child: InkWell(
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
    );
  }
}
