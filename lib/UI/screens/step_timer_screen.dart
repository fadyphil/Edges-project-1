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
import 'package:mini_project_1/routes/app_router.dart';






// --- MAIN WIDGETS ---
@RoutePage()
class StepTimerScreen extends StatelessWidget {
  final Recipe recipe;
  const StepTimerScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepTimerCubit(recipe: recipe, userfactor: context.read<UserCubit>().getUsersFactor()),
      child:  _StepTimerView(recipe),
    );
  }
}

class _StepTimerView extends StatelessWidget {
  final Recipe recipe;
  const _StepTimerView(this.recipe);

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
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                    StepCard(index:state.currentStepIndex,step:  currentStep, isCurrent: true),
                    const SizedBox(height: 16),
                    SvgPicture.asset('assets/images/separator.svg'),
                    const SizedBox(height: 8,),
                    _buildTimer(
                       _formatDuration(state.elapsedSecondsInStep),
                     _formatDuration((currentStep.baseTimeInSeconds*userfactor).toInt()),
                      _getTimerColor(state.timerColor),
                      context
                      ),
                      const SizedBox(height: 8),
                    
                    // _buildControlButtons(context, state),
                    SvgPicture.asset('assets/images/separator.svg'),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: _buildStartPauseButton(context, state)
                      ),
                    const SizedBox(height: 16),
                     nextStep != null ? Text('Next Up', 
                     style: Theme.of(context).textTheme.headlineMedium):
                        SizedBox.shrink(),
                    const SizedBox(height: 16),
                    
                    nextStep != null?Stack(
                      children: [
                      StepCard(
                        index: state.currentStepIndex+1, 
                        step: nextStep,
                        isCurrent: false,),
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                Theme.of(context).colorScheme.surface,
                                Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
                                Theme.of(context).colorScheme.surface.withValues(alpha:  0.35),
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
                        ): SizedBox.shrink(),
                   
                    // _buildTimelineSection(recipe, state.overallProgress , userfactor),
                    TimelineBar(recipe: recipe,
                    elapsedSecondsInStep:context.watch<StepTimerCubit>().finalelapsedTime.toInt(),
                    currentStepIndex: state.currentStepIndex,
                    timerColor: _getTimerColor(state.timerColor),
                    ),
                    
                    const SizedBox(height: 20),

                    FloatingActionButton(
                      heroTag: 'done',
                      onPressed: (){
                      nextStep != null ? context.read<StepTimerCubit>().completeStepAndMoveToNext()
                      : context.router.popAndPush(  RecipeDoneRoute(
                        recipe: recipe,
                        timeTaken: context.read<StepTimerCubit>().finalelapsedTime
                      ));
                     
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nextStep != null ? 'Done with this step ':'Finish Recipe ',
                          style:Theme.of(context).textTheme.bodyMedium
                        ),
                        Icon( nextStep != null ? Icons.check : Icons.rocket_launch_outlined, color: Colors.white, size: 16)
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
}

Widget _buildStartPauseButton(BuildContext context, StepTimerState state){
  return IconButton(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
  
            onPressed: state.status == TimerStatus.finished ? null : () {
              if (state.status == TimerStatus.running) {
                context.read<StepTimerCubit>().pauseTimer();
              } else {
                context.read<StepTimerCubit>().startTimer();
              }
            },
            icon:Icon(
              
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
    return '-$minutes : $seconds';
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

Widget _buildTimer (String elapsed, String total, Color timerColor, BuildContext  context) {
  const double basesize =50;
  return Wrap(
    alignment: WrapAlignment.center,
    spacing: 8,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(elapsed, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: basesize,color: timerColor))
        ],
      ),
      Column(
        children: [
          Text('/',style :Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: basesize+20, color: Colors.grey))
        ],
      ),
      Column(
        children: [
          const SizedBox(height: 30,),
          Text(total, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: basesize, color: Colors.grey))
        ],
      )
    ],
  ) ;
}