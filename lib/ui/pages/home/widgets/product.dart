part of '../home_page.dart';

class _ProductItem extends StatelessWidget {
  const _ProductItem({Key? key}) : super(key: key);

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
            'https://s3.us-east-1.amazonaws.com/laikapp/images_products/99346b7c2a33b3d7886aec3eafb1f65b.png',
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
                  'Ringo perro',
                  style: TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                Text(
                  'Lorem ipsum dolor sit ammet, consetetur',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
                Text(
                  '150.000',
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
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primary
                ),
                child: Icon(
                  Icons.shopping_basket,
                  size: AppSpacing.sl,
                  color: AppColors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
