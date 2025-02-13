import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/use%20cases/brand_use_case.dart';
import 'package:e_commerce/domain/use%20cases/category_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/utils/assets_manager.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  CategoryUseCase categoryUseCase;
  BrandUseCase brandUseCase;
  HomeTabViewModel({required this.categoryUseCase,required this.brandUseCase}):super(CategoryLoadingState());
  List<String>announcement = [
    AssetsManager.announcement1,
    AssetsManager.announcement2,
    AssetsManager.announcement3,
  ];
  List <CategoryOrBrandEntity>categoryList=[];
  List <CategoryOrBrandEntity>brandList=[];

  void getAllCategories ()async{
    emit(CategoryLoadingState());
    var either = await categoryUseCase.invoke();
    either.fold(
            (error){
      emit(CategoryErrorState(error: error));
      },
            (response){
              categoryList = response.data!;
      emit(CategorySuccessState(categoryOrBrandResponseEntity: response));
      getAllBrands();
    }
    );
  }
  void getAllBrands ()async{
    emit(BrandLoadingState());
    var either = await brandUseCase.invoke();
    either.fold(
            (error){
      emit(BrandErrorState(error: error));
    },
            (response){
              brandList = response.data!;
      emit(BrandSuccessState(categoryOrBrandResponseEntity: response));
    }
    );
  }
}