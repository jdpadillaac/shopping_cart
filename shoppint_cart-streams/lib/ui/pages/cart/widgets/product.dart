part of '../cart_page.dart';

class _CartProduct extends StatelessWidget {
  const _CartProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductCart product;

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive(context);
    final bloc = BlocProvider.of<ShoppingCartBloc>(context);
    int quantity = 0;
    ProductCart? productFounded;

    if (bloc.productList.isNotEmpty) {
      productFounded = ProductCart.findById(bloc.productList, product.id);
    }

    if (productFounded != null) {
      quantity = productFounded.quantity;
    }

    return Dismissible(
      key: Key(product.id),
      onDismissed: (DismissDirection? direction) {
        bloc.add(ProductDeleted(productId: product.id));
      },
      background: const SizedBox.shrink(),
      secondaryBackground: Container(
        color: Colors.red,
        width: responsive.width(20),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.delete,
                color: AppColors.white,
              )
            ],
          ),
        ),
      ),
      child: Container(
        height: responsive.height(170),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.grey),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSpacing.md,
                  ),
                ),
                flex: 3,
              ),
              const SizedBox(width: AppSpacing.sl),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      product.price.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sl),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          bloc.add(AddProductQuantity(productId: product.id));
                        },
                        child: const Icon(Icons.add),
                      ),
                      Text(quantity.toString()),
                      InkWell(
                        onTap: () {
                          bloc.add(
                            ReduceQuantity(productId: product.id),
                          );
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
