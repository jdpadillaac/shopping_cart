part of '../home_page.dart';

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.sl),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.1),
            offset: Offset(0, 5), //(x,y)
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSpacing.md),
      margin: EdgeInsets.symmetric(
          vertical: AppSpacing.md, horizontal: AppSpacing.md),
      child: Row(
        children: [
          Image.network(
            product.image,
            width: 90,
          ),
          SizedBox(
            width: AppSpacing.sl,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
                Text(
                  product.price,
                  style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  AppOverlay(context).showOverlay(
                    children: [
                      _OverlayBody(product: product),
                    ],
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.primary),
                  child: Icon(
                    Icons.shopping_basket,
                    size: AppSpacing.sl,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _DotButton extends StatelessWidget {
  const _DotButton({
    Key? key,
    required this.onPressed,
    this.isPrimary = false,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isPrimary;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final primaryColor = isPrimary ? AppColors.primary : null;
    final borderColor = isPrimary ? AppColors.primary : AppColors.green;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }
}

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
        print(state);
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
