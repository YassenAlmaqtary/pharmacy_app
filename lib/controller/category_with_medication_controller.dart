import 'package:get/get.dart';
import 'package:pharmacy/Netowrk/network.dart';
import '../model/category_model.dart';
import 'cheek_intrnet/intrnet_ceker.dart';

class CategoryWithMedicationController extends GetxController with StateMixin<List<CategoryWitheMedicationModel>>{

  late RxBool isLoad;
  late List<CategoryWitheMedicationModel>allCategoryWithMedication;
 @override
  void onInit()async{
   allCategoryWithMedication=List<CategoryWitheMedicationModel>.empty(growable: true);
   isLoad=false.obs;
   await getAllCategoryWithMedication();
   ever(Get.find<GetXNetworkManager>().connectionType, (callback){
     if(Get.find<GetXNetworkManager>().connectionType.value==1&&allCategoryWithMedication.isEmpty)getAllCategoryWithMedication();
   });
  }

  getAllCategoryWithMedication() async{
       isLoad.value = true;
    change(null, status: RxStatus.loading());
    await Network(url:'medications/category-with-medication' ).getData(
        onSuccess: (data){
      if(data['status']&&data['data']!=null){
        var dataLat=data['data'] as List;
        allCategoryWithMedication.addAll(dataLat.map((e) => CategoryWitheMedicationModel.fromJson(e)));
        change(allCategoryWithMedication,status:RxStatus.success());
      }
      else{
        isLoad.value=false;
        change([],status:RxStatus.empty());
      }
    },
    onError:(error){
      isLoad.value=false;
      change(allCategoryWithMedication,status:RxStatus.error());
    }, onRunTime:(){
      print("run time");
      isLoad.value=false;
    },noInterNet:(){
      print("not-intrenet");
      isLoad.value=false;
    });
  }


  Future<void> refreashAllCategoryWithMedication() async{
    allCategoryWithMedication=List<CategoryWitheMedicationModel>.empty(growable: true);
    isLoad.value = true;
    change(null, status: RxStatus.loading());
    await Network(url:'medications/category-with-medication' ).getData(
        onSuccess: (data){
          if(data['status']&&data['data']!=null){
            var dataLat=data['data'] as List;
            allCategoryWithMedication.addAll(dataLat.map((e) => CategoryWitheMedicationModel.fromJson(e)));
            change(allCategoryWithMedication,status:RxStatus.success());
          }
          else{
            isLoad.value=false;
            change([],status:RxStatus.empty());
          }
        },
        onError:(error){
          isLoad.value=false;
          change(allCategoryWithMedication,status:RxStatus.error());
        }, onRunTime:(){
      print("run time");
      isLoad.value=false;
    },noInterNet:(){
      print("not-intrenet");
      isLoad.value=false;
    });
  }


}