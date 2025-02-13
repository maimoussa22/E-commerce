import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import 'package:flutter/material.dart';

class ProductTabItem extends StatelessWidget {
  ProductEntity productEntity;
  ProductTabItem({required this.productEntity});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primary30Color,width: 2)
      ),
      margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  height: height*0.09,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: productEntity.imageCover??"",
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                        backgroundColor: AppColors.primaryColor),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),
                ),
              ),
              Positioned(
                right: width*0.01,
                top: height*0.004,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.favorite_border,color: AppColors.primaryColor,)
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: height*0.02,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.02),
            child: AutoSizeText(productEntity.title??'',
              style: AppStyles.regular14Primary,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,

            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*0.02,),
                  child: AutoSizeText('EGP ${productEntity.price}',
                    style: AppStyles.regular14Primary,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(right: width*0.02),
                  child: AutoSizeText('${productEntity.price! *1.25} EGP',
                    style: AppStyles.regular14Primary60.copyWith(
                        decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.primary60Color
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,

                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: width*0.02,),
                  child: AutoSizeText('Review (${productEntity.ratingsAverage})',
                    style: AppStyles.regular14Primary,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.star,color: Colors.amberAccent,),
                Spacer(),
                Padding(
                  padding:EdgeInsets.only(right:width*0.02),
                  child: Icon(Icons.add_circle_outlined,color: AppColors.primaryColor,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
