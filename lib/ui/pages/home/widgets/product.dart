part of '../home_page.dart';

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.sl),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.1),
            offset: const Offset(0, 5), //(x,y)
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: responsive.height(AppSpacing.md),
        horizontal: responsive.width(AppSpacing.md),
      ),
      margin: EdgeInsets.symmetric(
        vertical: responsive.height(AppSpacing.md),
        horizontal: responsive.width(AppSpacing.md),
      ),
      child: Row(
        children: [
          Image.network(
            product.image,
            width: responsive.width(100),
            height: responsive.height(100),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: responsive.width(AppSpacing.sl),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
                Text(
                  product.price.toString(),
                  style: const TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: responsive.width(AppSpacing.sl),
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
                  height: responsive.height(30),
                  width: responsive.width(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.primary,
                  ),
                  child: const Icon(
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
    final responsive = AppResponsive(context);

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: responsive.width(35),
        height: responsive.height(35),
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
