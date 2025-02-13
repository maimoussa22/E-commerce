import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/category_tab/cubit/category_tab_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/category_tab/cubit/category_tab_view_model.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/category_tab/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../widget/custom_text_filed_widget.dart';

class CategoryTab extends StatelessWidget{
  CategoryTabViewModel viewModel = getIt<CategoryTabViewModel>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<CategoryTabViewModel,CategoryTabStates>(
      bloc: viewModel..getAllProducts(),
      builder: (context,state) {
        return viewModel.productList.isEmpty ?
        Center(child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),) :
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: width * 0.05,),
                  Expanded(
                    child: TextFiledWidget(
                      hintText: 'what do you search for?',
                      hintStyle: AppStyles.light14black,
                      prefixIcon: Image.asset(AssetsManager.searchIcon,),
                      borderColor: AppColors.primaryColor,
                      radius: 25,
                      errorColor: AppColors.primaryColor,
                      filled: false,
                    ),
                  ),
                  SizedBox(width: width * 0.03,),
                  Image.asset(AssetsManager.shoppingCartIcon),
                  SizedBox(width: width * 0.04,),
                ],
              ),
              SizedBox(height: height * 0.02,),
              SizedBox(
                height: height * 0.70,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: viewModel.productList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          // todo: navigate to product details
                        },
                          child: ProductTabItem(productEntity: viewModel.productList[index],));
                    }
                ),
              )

            ],
          ),
        );
      }
    );
        }
      }