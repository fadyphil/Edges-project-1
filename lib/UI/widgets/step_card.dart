import 'package:flutter/material.dart' hide Step;
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/UI/sub_screens/steps_subscreen.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/models/step_model.dart';

class StepCard extends StatelessWidget {
  final int index;
  final Step? step;
  final num userfactor;
  final bool? isCurrent;
  const StepCard({super.key, required this.index, required this.step, required this.userfactor,  this.isCurrent });

  @override
  Widget build(BuildContext context) {
    return _buildStepCard(index, step, userfactor, context);
  }
}


Widget _buildStepCard(int index,Step? step, num userfactor,BuildContext context) {
  final bool shouldBuild ;

  if(step==null){
    return SizedBox.shrink();
  }

  if(step.note==null){
    shouldBuild=false;
  }else{
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
          _buildHeaderRow(index, step.title, 
          ((step.baseTimeInSeconds/60)*userfactor).toStringAsFixed(1), step.type, context)
          ,Column(
            mainAxisSize:  MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildStepType(step.type.name.toLowerCase()),
              const SizedBox(height: 4),
          Text(step.description , style: GoogleFonts.nunito(
            color: Color(0xFF888481), fontSize: 14, fontWeight: FontWeight.w400,))
            ],
          ),
          shouldBuild ? buildinfo(step.note!, shouldBuild) : SizedBox.shrink()
        ],
      ),
    ),
  );
}


Widget  _buildHeaderRow (int index, String title, String time,StepType type,BuildContext context){
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



Widget buildinfo (String info  , bool shouldBuild){

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
          Icon(Icons.info_outline , color: Colors.white,size: 18,),
          Text(info, style: GoogleFonts.nunito(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400,
          ),)
        ],
      ),
    ),
  );
}

