import 'package:get/get.dart';
import '../Netowrk/network.dart';
import '../model/pharmacy_detail_model.dart';
import '../model/pharmacy_model.dart';
import 'cheek_intrnet/intrnet_ceker.dart';

class PharmacyController extends GetxController with StateMixin<List<PharmacyModel>>{

  late RxBool isLoad;
  late List<PharmacyModel>getAllPharmacy;
  @override
  void onInit()async{
    getAllPharmacy=List<PharmacyModel>.empty(growable: true);
    isLoad=false.obs;
    await getpharmacy();
    ever(Get.find<GetXNetworkManager>().connectionType, (callback){
      if(Get.find<GetXNetworkManager>().connectionType.value==1&&getAllPharmacy.isEmpty)getpharmacy();
    });
  }


  getpharmacy() async{
    isLoad.value = true;
    change(null, status: RxStatus.loading());
    await Network(url:'medications/pharmacys' ).getData(
        onSuccess: (data){

          if(data['status']&&data['data']!=null){
            var dataLat=data['data'] as List;
            getAllPharmacy.addAll(dataLat.map((e) => PharmacyModel.fromJson(e)));
            change(getAllPharmacy,status:RxStatus.success());
          }
          else{
            isLoad.value=false;
            change([],status:RxStatus.empty());
          }
        },
        onError:(error){
          isLoad.value=false;
          change(getAllPharmacy,status:RxStatus.error());
        }, onRunTime:(){
      print("run time");
      isLoad.value=false;
    },noInterNet:(){
      print("not-intrenet");
      isLoad.value=false;
    });
  }
//////////////////////////////////
 Future<void> getRefeashpharmacy() async{
    getAllPharmacy=List<PharmacyModel>.empty(growable: true);
    isLoad.value = true;
    change(null, status: RxStatus.loading());
    await Network(url:'medications/pharmacys' ).getData(
        onSuccess: (data){

          if(data['status']&&data['data']!=null){
            var dataLat=data['data'] as List;
            getAllPharmacy.addAll(dataLat.map((e) => PharmacyModel.fromJson(e)));
            change(getAllPharmacy,status:RxStatus.success());
          }
          else{
            isLoad.value=false;
            change([],status:RxStatus.empty());
          }
        },
        onError:(error){
          isLoad.value=false;
          change(getAllPharmacy,status:RxStatus.error());
        }, onRunTime:(){
      print("run time");
      isLoad.value=false;
    },noInterNet:(){
      print("not-intrenet");
      isLoad.value=false;
    });
  }
}