import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../widget/custom_text_filed_widget.dart';

@injectable
class HomeTab extends StatefulWidget{
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(width: width*0.05,),
                Expanded(
                  child: TextFiledWidget(
                    hintText: 'what do you search for?',
                    hintStyle: AppStyles.light14black,
                    prefixIcon: Image.asset(AssetsManager.searchIcon,),
                    borderColor: AppColors.primaryColor ,
                    radius: 25,
                    errorColor:AppColors.primaryColor ,
                    filled: false,
                  ),
                ),
                SizedBox(width: width*0.03,),
                Image.asset(AssetsManager.shoppingCartIcon),
                SizedBox(width: width*0.04,),
              ],
            ),
            SizedBox(height: height*0.02,),
             buildAnnouncement(image:viewModel.announcement),
            SizedBox(height: height*0.02,),
            lineBreak(title: 'Categories',width: width),
            SizedBox(height: height*0.02,),
            BlocBuilder<HomeTabViewModel,HomeTabStates>(
              bloc: viewModel..getAllCategories(),
                builder: (context,state){
                  if(state is CategoryLoadingState){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    );
                  }else if(state is CategoryErrorState){
                    return Center(
                      child: Text(state.error.errorMessage),
                    );
                  }else {
                    return buildCategoryBrandSec(viewModel.categoryList,height,width);
                  }
                }
            ),
            SizedBox(height: height*0.02,),
            lineBreak(title: 'Brands',width: width),
            SizedBox(height: height*0.02,),
            BlocBuilder<HomeTabViewModel,HomeTabStates>(
              bloc: viewModel,
                builder: (context,state){
                  if(state is BrandLoadingState){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    );
                  }else if(state is BrandErrorState){
                    return Center(
                      child: Text(state.error.errorMessage),
                    );
                  }else if(state is BrandSuccessState){
                    return buildCategoryBrandSec(viewModel.brandList,height,width);
                  }
                  return Container();
                }
            ),

          ],
        ),
      ),
    );
  }

  ImageSlideshow buildAnnouncement( {required List<String>image}){
    return ImageSlideshow(
        indicatorColor: AppColors.primaryColor,
        isLoop: true,
        initialPage: 0,
        autoPlayInterval: 3000,
        children: image.map((url){
          return Image.asset(url);
        }).toList()
    );

  }

  Widget lineBreak({required String title ,required var width}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.03),
          child: Text(title,style: AppStyles.medium18Primary,),
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.05),
          child: Text('View All',style: AppStyles.regular12Primary,),
        )
      ],
    );
  }
  Widget buildCategoryBrandSec(List<CategoryOrBrandEntity>list , double h,double w){
    return SizedBox(
      height: h*0.5,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 2),
        physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,crossAxisSpacing: w*0.002,
            mainAxisSpacing: h*0.002,
          ),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context,index) {
            return buildCategoryItem(list[index],h);
        },

      ),
    );
  }
  Widget buildCategoryItem(CategoryOrBrandEntity category,double h) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: CachedNetworkImage(
            imageUrl: category.image??"",
            width: double.infinity,
            height: double.infinity,
            imageBuilder: (context,imageProvider){
              return CircleAvatar(
                backgroundImage: imageProvider,
              );
            },
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                  backgroundColor: AppColors.primaryColor),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),
          ),
        ),
        SizedBox(height: h*0.02,),
        Expanded(
          flex: 4,
          child: Text(
            category.name??'',

          ),
        ),
      ],
    );
  }
}