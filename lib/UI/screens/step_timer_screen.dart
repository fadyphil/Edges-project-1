// lib/UI/screens/step_timer_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/UI/widgets/timelinebar.dart';
import 'package:mini_project_1/UI/widgets/step_card.dart';
import 'package:mini_project_1/blocs/step_timer/step_timer_cubit.dart';
import 'package:mini_project_1/blocs/step_timer/step_timer_state.dart';
import 'package:mini_project_1/blocs/user/user_cubit.dart';
import 'package:mini_project_1/data/models/enums.dart';
import 'package:mini_project_1/data/models/recipe_model.dart';






// --- MAIN WIDGETS ---
@RoutePage()
class StepTimerScreen extends StatelessWidget {
  final Recipe recipe;
  const StepTimerScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepTimerCubit(recipe: recipe, userfactor: context.read<UserCubit>().getUsersFactor()),
      child: const _StepTimerView(),
    );
  }
}

class _StepTimerView extends StatelessWidget {
  const _StepTimerView();

  @override
  Widget build(BuildContext context) {
    final recipe = context.read<StepTimerCubit>().recipe;
    final userfactor = context.watch<UserCubit>().getUsersFactor();


    return BlocBuilder<StepTimerCubit, StepTimerState>(
      builder: (context, state) {
        final currentStep = recipe.steps[state.currentStepIndex];
        final nextStep = (state.currentStepIndex + 1 < recipe.steps.length)
            ? recipe.steps[state.currentStepIndex + 1]
            : null;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(
                  recipe.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () => context.router.pop(),
                  icon: const Icon(Icons.arrow_back,),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                   const SizedBox(height: 16),
                    _buildStepIndicator(state.currentStepIndex + 1, recipe.steps.length, context),
                    const SizedBox(height: 16),
                    // _buildStepCard(currentStep, state.currentStepIndex + 1, isCurrent: true),
                    StepCard(index:state.currentStepIndex,step:  currentStep, userfactor: userfactor, isCurrent: true),
                    const SizedBox(height: 16),
                    SvgPicture.asset('assets/images/separator.svg'),
                    _buildTimerDisplay(
                      _formatDuration(state.elapsedSecondsInStep),
                      _formatDuration((currentStep.baseTimeInSeconds*userfactor).toInt()),
                      _getTimerColor(state.timerColor),
                    ),
                    
                    // _buildControlButtons(context, state),
                    SvgPicture.asset('assets/images/separator.svg'),
                    const SizedBox(height: 16),
                    _buildStartPauseButton(context, state),
                    const SizedBox(height: 16),
                    _buildNextUpSection(),
                    const SizedBox(height: 16),
                    // _buildStepCard(nextStep, state.currentStepIndex + 2, isCurrent: false),
                    Stack(
                      children: [
                      StepCard(
                        index: state.currentStepIndex+1, 
                        step: nextStep,
                        userfactor: userfactor,
                        isCurrent: false,),
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                Theme.of(context).colorScheme.background,
                                Theme.of(context).colorScheme.background.withOpacity(0.9),
                                Theme.of(context).colorScheme.background.withOpacity(0.35),
                              ],
                              stops: const [0.48, 0.5, 1],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              )
                            ) ,
                            child:  Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 34),
                                child: SvgPicture.asset('assets/images/separator.svg'))),
                            ),
                        ),
                        
                        ]
                        ),
                   
                    // _buildTimelineSection(recipe, state.overallProgress , userfactor),
                    TimelineBar(recipe: recipe, userfactor: userfactor),
                    
                    const SizedBox(height: 20),

                    FloatingActionButton(
                      heroTag: 'done',
                      onPressed: (){
                      context.read<StepTimerCubit>().completeStepAndMoveToNext();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Done with this step ',
                          style:Theme.of(context).textTheme.bodyMedium
                        ),
                        Icon(Icons.check, color: Colors.white, size: 16)
                      ],
                    ),
                    ),
                    const SizedBox(height: 30),
                  
                  ]),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // --- UI HELPER WIDGETS ---

Widget _buildStepIndicator(int currentStep, int totalSteps,BuildContext context) {
  const double baseFontSize = 32.0; // The original font size for the step indicator

  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Text('Step', style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(width: 8),

      RichText(
        text: TextSpan(
          children: <TextSpan>[
            // Use the new, improved helper
            _buildFractionText(
              currentStep.toString(),
              feature: const FontFeature.numerators(),
              size: baseFontSize,
              weight: FontWeight.bold, // Make the current step bold
            ),
            _buildFractionText(
              '/',
              color: Colors.white,
              size: baseFontSize,
            ),
            _buildFractionText(
              totalSteps.toString(),
              feature: const FontFeature.denominator(),
              color: Colors.grey.shade500, // A slightly lighter grey for better contrast
              size: baseFontSize,
            ),
          ],
        ),
      )
    ],
  );
}


/// A reusable helper to create a TextSpan with optional fractional styling.
TextSpan _buildFractionText(
  String text, {
  Color? color,
  FontFeature? feature,
  double? size,
  FontWeight? weight,
}) {
  return TextSpan(
    text: text,
    style: GoogleFonts.hedvigLettersSerif(
      // The fontFeatures property expects a List.
      // We create a list with the feature only if it's not null.
      fontFeatures: feature != null ? [feature] : null,
      color: color ?? Colors.white,
      fontSize: size ?? 32, // A default size
      fontWeight: weight ?? FontWeight.w400, // A default weight
    ),
  );
}


Widget _buildTimerDisplay(String elapsed, String total, Color timerColor) {
  const double baseFontSize = 70; // Set the base font size for the timer

  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      // No default style is needed here, as each child is explicitly styled.
      children: <TextSpan>[
        // The elapsed time, styled as a numerator
        _buildFractionText(
          elapsed,
          feature: const FontFeature.numerators(),
          color: timerColor, // The dynamic color for the current time
          size: baseFontSize,
          weight: FontWeight.w300,
        ),
        
        // The slash, styled neutrally
        _buildFractionText(
          '/',
          color: Colors.grey.shade700,
          size: baseFontSize,
  
        ),

        // The total time, styled as a denominator
        _buildFractionText(
          total,
          feature: const FontFeature.denominator(),
          color: Colors.grey.shade600,
          size: baseFontSize,
          weight: FontWeight.w300,
        ),
      ],
    ),
  );
}

  

  Widget _buildNextUpSection() {
    return Text('Next Up', style: GoogleFonts.lora(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500));
  }

}

Widget _buildStartPauseButton(BuildContext context, StepTimerState state){
  return FloatingActionButton.extended(
            backgroundColor: const Color(0xFFDB7A2B),
            
            
            onPressed: state.status == TimerStatus.finished ? null : () {
              if (state.status == TimerStatus.running) {
                context.read<StepTimerCubit>().pauseTimer();
              } else {
                context.read<StepTimerCubit>().startTimer();
              }
            },
            label:Icon(
              
              state.status == TimerStatus.running ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 24,
            ),
          
          );
}



String _formatDuration(int totalSeconds) {
  if (totalSeconds < 0) {
    final duration = Duration(seconds: totalSeconds.abs());
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '-$minutes:$seconds';
  }
  final duration = Duration(seconds: totalSeconds);
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

Color _getTimerColor(TimerColorStatus status) {
  switch (status) {
    case TimerColorStatus.normal: return Colors.white;
    case TimerColorStatus.acceptanceMargin: return Colors.orange;
    case TimerColorStatus.overtime: return Colors.red;
  }
}