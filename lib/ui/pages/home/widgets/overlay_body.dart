part of '../home_page.dart';

class _OverlayBody extends StatelessWidget {
  const _OverlayBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (BuildContext context, ShoppingCartState state) {
        final bloc = context.read<ShoppingCartBloc>();
        int quantity = 0;
        ProductCart? productFounded;

        if (bloc.productList.isNotEmpty) {
          productFounded = ProductCart.findById(bloc.productList, product.id);
        }

        if (productFounded != null) {
          quantity = productFounded.quantity;
        }

        return Column(
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Container(
              margin: EdgeInsets.all(AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.price,
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        _DotButton(
                          onPressed: () {
                            if (productFounded != null) {
                              bloc.add(
                                ReduceQuantity(productId: productFounded.id),
                              );
                            }
                          },
                          icon: Icon(Icons.remove),
                        ),
                        SizedBox(
                          width: AppSpacing.sl,
                        ),
                        Text(quantity.toString()),
                        SizedBox(
                          width: AppSpacing.sl,
                        ),
                        _DotButton(
                          onPressed: () {
                            if (productFounded == null) {
                              bloc.add(
                                AddProduct(product: product, quantity: 1),
                              );
                            } else {
                              bloc.add(
                                AddProductQuantity(productId: product.id),
                              );
                            }
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          isPrimary: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
