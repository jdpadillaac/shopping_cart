part of '../cart_page.dart';

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.shopping_basket,
                  color: AppColors.green,
                ),
                SizedBox(
                  width: AppSpacing.md,
                ),
                Text(
                  'Tu compra',
                  style: TextStyle(
                    fontSize: AppSpacing.lg,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.white,
                    size: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
