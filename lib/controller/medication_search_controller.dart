import 'package:get/get.dart';
import '../Netowrk/network.dart';
import '../model/medication_search_model.dart';
import 'cheek_intrnet/intrnet_ceker.dart';

class MedicationSearchController extends GetxController with StateMixin<List<MedicationSearchModel>>{

  late RxBool isLoad;
  late List<MedicationSearchModel>getAllMedication;
  @override
  void onInit()async{
    getAllMedication=List<MedicationSearchModel>.empty(growable: true);
    isLoad=false.obs;
   // ever(Get.find<GetXNetworkManager>().connectionType, (callback){
     // if(Get.find<GetXNetworkManager>().connectionType.value==1&&getAllMedication.isEmpty)getpharmacy();
    //});
  }
  getMedication(String name) async{
    getAllMedication=List<MedicationSearchModel>.empty(growable: true);
    isLoad.value = true;
    change(null, status: RxStatus.loading());
    await Network(url:'medications/serch-medication-name/'+name ).getData(
        onSuccess: (data){
          if(data['status']&&data['data']!=null){
            var dataLat=data['data'] as List;
            getAllMedication.addAll(dataLat.map((e) => MedicationSearchModel.fromJson(e)));
            change(getAllMedication,status:RxStatus.success());
          }
          else{
            isLoad.value=false;
            change([],status:RxStatus.empty());
          }
        },
        onError:(error){
          isLoad.value=false;
          change(getAllMedication,status:RxStatus.error());
        }, onRunTime:(){
      print("run time");
      isLoad.value=false;
    },noInterNet:(){
      print("not-intrenet");
      isLoad.value=false;
    });
  }

}