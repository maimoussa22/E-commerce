import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/domain/use%20cases/product_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/category_tab/cubit/category_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryTabViewModel extends Cubit<CategoryTabStates>{
  ProductUseCase productUseCase;
  CategoryTabViewModel({required this.productUseCase}):super(CategoryTabInitial());

  ///hold date - handle logic
  List<ProductEntity> productList =[];

  void getAllProducts() async{
    emit(CategoryTabLoading());
    var either = await productUseCase.invoke();
    either.fold((error){
      emit(CategoryTabError(error: error));
    }, (response){
      productList = response.data!;
      emit(CategoryTabSuccess(productsResponseEntity: response));
    });
}
}