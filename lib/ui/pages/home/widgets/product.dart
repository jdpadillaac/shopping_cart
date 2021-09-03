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
        vertical: AppSpacing.md,
        horizontal: AppSpacing.md,
      ),
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
                  product.price.toString(),
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
                    color: AppColors.primary,
                  ),
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
