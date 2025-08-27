import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepTypeTag extends StatelessWidget {
  final String type;
  final num? extranumber;
  const StepTypeTag({super.key, required this.type, this.extranumber});

  @override
  Widget build(BuildContext context) {
    return _buildStepType(type, extranumber: extranumber);
  }
}

Widget  _buildStepType(String type, {num? extranumber}){
  Color color;
  Color textColor;
  if(type=='cooking'){
    color= const Color(0xFFDB7A2B).withValues(alpha: 0.2);
    textColor  = const Color(0xFFDB7A2B);
  }else {
     color= const Color(0xFF239D66).withValues(alpha: 0.2);
     textColor= const Color(0xFF239D66);
  }
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),

    ),
    child: Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor: textColor,
        ),
        Text(type[0].toUpperCase() + type.substring(1).toLowerCase(), style: GoogleFonts.nunito(
          color: textColor, fontSize: 14, fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
        ),
        if(extranumber!=null) Text('- ${extranumber.toString()}m', style: TextStyle(
          color: textColor, fontSize: 14, fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}