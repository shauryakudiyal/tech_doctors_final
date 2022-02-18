import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:tech_doctors/provider/speaker_provider.dart';
import 'package:tech_doctors/services/firebase_sevices.dart';

class SellerMobileForm extends StatefulWidget {
 static const String id = 'mobile-form';

  @override
  State<SellerMobileForm> createState() => _SellerMobileFormState();
}

class _SellerMobileFormState extends State<SellerMobileForm> {
 final _formKey = GlobalKey<FormState>();

 FirebaseServices _services = FirebaseServices();

 var _brandController = TextEditingController();
 var _yearController = TextEditingController();
 var _diagController = TextEditingController();
 var _typeController = TextEditingController();
 var _shopController = TextEditingController();
 var _staffController = TextEditingController();
 var _titleController = TextEditingController();
 var _descriptionController = TextEditingController();
 var _addressController = TextEditingController();


 validate(){
   if(_formKey.currentState.validate()){
     print('validated');
   }
 }

 List<String> _typeList=[
   'Brand','Authorised Partener', '3rd party',
 ];
 List<String> _shopList=[
   'Brand','Authorised Partener', '3rd party',
 ];

 @override
  void initState() {
    _services.getUserData().then((value) {
      setState(() {
        _addressController.text = value['address'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var _catProvider = Provider.of<CategoryProvider>(context);



    Widget _appBar(title, fieldValue){
     return AppBar(
       elevation: 0.0,
       backgroundColor: Colors.white,
       iconTheme: IconThemeData(color: Colors.black),
       automaticallyImplyLeading: false,
       shape: Border(bottom: BorderSide(color: Colors.grey.shade300),),
       title: Text('$title > $fieldValue', style: TextStyle(color: Colors.black, fontSize: 14),),
     );
   }


   Widget _brandList(){
     return Dialog(
       child: Column(
         mainAxisSize: MainAxisSize.min,

         children: [
           _appBar(_catProvider.selectedCategory, 'Brands'),


           Expanded(
             child: ListView.builder(
                 itemCount: _catProvider.doc['Brand'].length,
                 itemBuilder: (BuildContext context, int index){
               return ListTile(
                 onTap: (){
                  setState(() {
                    _brandController.text = _catProvider.doc['Brand'][index];
                  });
                  Navigator.pop(context);
                 },
                 title: Text(_catProvider.doc['Brand'][index]),
               );
             }),
           )

         ],
       ),
     );
   }

   Widget _listView({fieldValue,list,textController}){
     return Dialog(
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           _appBar(_catProvider.selectedCategory, fieldValue),
           ListView.builder(
               shrinkWrap: true,
               itemCount: list.length,
               itemBuilder: (BuildContext context, int index){
             return ListTile(
               onTap: (){
                 textController.text = list[index];
                 Navigator.pop(context);
               },

               title: Text(list[index]),
             );
           })
         ],
       ),
     );
   }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Text('Add Some Details', style: TextStyle(color: Colors.black),),
        shape: Border(bottom: BorderSide(color: Colors.grey.shade300),),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Speaker', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return _brandList();
                    });

                  },
                  child: TextFormField(
                    controller: _brandController,
                    enabled: false,

                    decoration: InputDecoration(
                      labelText: 'Brand / Model / Variant'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Complete Required Field';

                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: _yearController,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  decoration: InputDecoration(
                      labelText: 'Estd. Year'),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Complete Required Field';

                    }
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: false,
                  controller: _diagController,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  decoration: InputDecoration(
                      labelText: 'Diagnostics Charges',
                      prefixText: 'Rs '),

                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Complete Required Field';

                    }
                    return null;
                  },
                ),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return _listView(fieldValue: 'Type', list: _typeList, textController: _typeController );
                    });
                  },
                  child: TextFormField(
                    controller: _typeController,
                    keyboardType: TextInputType.number,
                    enabled: false,
                    decoration: InputDecoration(
                        labelText: 'Type',
                        ),

                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Complete Required Field';

                      }
                      return null;
                    },
                  ),
                ),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return _listView(fieldValue: 'Type', list: _typeList, textController: _typeController );
                    });
                  },
                  child: TextFormField(
                    controller: _shopController,
                    keyboardType: TextInputType.number,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'shop',
                    ),

                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Complete Required Field';

                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: _staffController,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  decoration: InputDecoration(
                      labelText: 'No. of Staff'),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Complete Required Field';

                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _titleController,
                  keyboardType: TextInputType.name,
                  maxLength: 50,
                  enabled: true,
                  decoration: InputDecoration(
                      labelText: 'Add Title',
                      counterText: 'Mention Name of Your Repairing Centre'
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Complete Required Field';

                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.name,
                  maxLength: 4000,
                  enabled: true,
                  decoration: InputDecoration(
                      labelText: 'Add Description',
                      counterText: 'Describe Your Repairing Centre'
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Complete Required Field';

                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                Divider(color: Colors.grey,),
                TextFormField(
                  enabled: false,
                  controller: _addressController,
                  keyboardType: TextInputType.name,
                  minLines: 2,
                  maxLines: 4,
                  decoration: InputDecoration(
                      labelText: 'Address',
                      counterText: 'Describe your address in detail'
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Complete Required Field';

                    }
                    return null;
                  },
                ),
                Divider(color: Colors.grey,),
                InkWell(
                  onTap: (){

                  },
                  child: Neumorphic(
                    child: Container(
                      height: 40,
                      child: Center(child: Text('Upload Image'),),
                    ),
                  ),
                ),
                SizedBox(height: 60,)

              ],
              ),
            ),
          ),

        ),
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: NeumorphicButton(
                style: NeumorphicStyle(color: Theme.of(context).primaryColor,),
                child: Text('Next',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                onPressed: (){
                  validate();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
