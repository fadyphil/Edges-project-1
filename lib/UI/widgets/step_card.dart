import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/UI/widgets/step_type_tag.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/models/step_model.dart';

class StepCard extends StatelessWidget {

  final int index;
  final Step? step;
  final bool? isCurrent;

  const StepCard({
    super.key, 
    required this.index, 
    required this.step, 
    this.isCurrent
    });

  @override
  Widget build(BuildContext context) {
    final userfactor =context.watch<UserCubit>().getUsersFactor();
     final bool shouldBuild ;

  if(step==null){
    return SizedBox.shrink();
  }

  if(step?.note==null) {
    shouldBuild=false;
  } else{
    shouldBuild=true;
  }
    return Card(
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
       
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderRow(
            index:index,
            title: step!.title, 
          time:((step!.baseTimeInSeconds/60)*userfactor).toStringAsFixed(1),
          type: step!.type
          )
          ,Column(
            mainAxisSize:  MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepTypeTag(
                type:step!.type.name.toLowerCase()
                ),
              const SizedBox(height: 4),
          Text(step!.description , style: GoogleFonts.nunito(
            color: Color(0xFF888481), fontSize: 14, fontWeight: FontWeight.w400,))
            ],
          ),
          shouldBuild ? StepInfo(
                info:step!.note!,
                ) : SizedBox.shrink()
        ],
      ),
    ),
  ); 
  }
}

class HeaderRow extends StatelessWidget {

  const HeaderRow({
    super.key, 
    required this.index, 
    required this.title, 
    required this.time, 
    required this.type
    });

    final int index;
    final String title;
    final String time;
    final StepType type;


  @override
  Widget build(BuildContext context) {
    Color color;
  Color textColor;
  if(type.name=='cooking'){
    color= const Color(0xFFDB7A2B).withValues(alpha: 0.2);
    textColor  = const Color(0xFFDB7A2B);
  }else {
     color= const Color(0xFF239D66).withValues(alpha:  0.2);
     textColor= const Color(0xFF239D66);
  }
  return Row(
    spacing:8 ,
    children: [
      CircleAvatar(
        backgroundColor: color,
        radius: 14,
        child: Text((index+1).toString() , style: GoogleFonts.nunito(
          color: textColor, fontSize: 12, fontWeight: FontWeight.w600,
        )),
      ),
      Expanded(
        child: Text(title, style: GoogleFonts.nunito(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600,
        )),
      ),

      Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Icon(Icons.timelapse_rounded , color: Color(0xFF888481),size: 12,),
      Text('${time.toString()} Minutes' , style: Theme.of(context).textTheme.bodySmall)
        ],
      )
    ],
  );
  }
}

class StepInfo extends StatelessWidget {

  const StepInfo({

    super.key, 
    required this.info, 
    });

  final String info;


  @override
  Widget build(BuildContext context) {
    return Container(
    // margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Color(0xFF2B2E33),
      borderRadius: BorderRadius.circular(8)
    ),
    child: Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runSpacing: 8,
        spacing: 4,
        children: [
          Icon(
            Icons.info_outline , 
            color: Colors.white,
            size: 18,
            ),
          Text(
            info, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
            )
        ],
      ),
    ),
  );
  }
}



// class StepType extends StatelessWidget {

//   const StepType({
//     super.key, 
//     required this.type, 
//     this.extranumber
//     });

//   final String type;
//   final num? extranumber;


//   @override
//   Widget build(BuildContext context) {
//   Color color;
//   Color textColor;
//   if(type=='cooking'){
//     color= const Color(0xFFDB7A2B).withValues(alpha:  0.2);
//     textColor  = const Color(0xFFDB7A2B);
//   }else {
//      color= const Color(0xFF239D66).withValues(alpha:  0.2);
//      textColor= const Color(0xFF239D66);
//   }
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
//     decoration: BoxDecoration(
//       color: color,
//       borderRadius: BorderRadius.circular(8),

//     ),
//     child: Row(
//       spacing: 4,
//       mainAxisSize: MainAxisSize.min,
      
//       children: [
//         CircleAvatar(
//           radius: 4,
//           backgroundColor: textColor,
//         ),
//         Text(type[0].toUpperCase() + type.substring(1).toLowerCase(), style: GoogleFonts.nunito(
//           color: textColor, fontSize: 14, fontWeight: FontWeight.w600,
//         ),),
//         if(extranumber!=null) Text('- ${extranumber.toString()}m', style: TextStyle(
//           color: textColor, fontSize: 14, fontWeight: FontWeight.w600,
//         ),)
//       ],
//     ),
//   );
//   }
// }