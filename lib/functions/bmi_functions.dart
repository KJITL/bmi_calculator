// results variable
double result = 0.0;
String? theState;

enum state { UNDERWEIGHT, HEALTHY, OVERWEIGHT, OBESE }

state? userState;

Map<state, String> Info = {
  state.UNDERWEIGHT:
      'You have lower than normal body weight. Try to eat more maybe',
  state.HEALTHY: 'You are fine, no worries',
  state.OVERWEIGHT:
      'You have a higher than normal body weight. Try to exercise more.',
  state.OBESE: 'No way, very fat mate',
};

double CalculateBMI({required int weight, required int height}) {
  return double.parse(
      ((weight) / ((height / 100) * (height / 100))).toStringAsFixed(1));
}

state BodyState({required double bmiResult}) {
  if (bmiResult <= 18.5) {
    theState = 'UNDERWEIGHT';
    return state.UNDERWEIGHT;
  } else if (bmiResult <= 24.9) {
    theState = 'HEALTHY';
    return state.HEALTHY;
  } else if (bmiResult <= 29.9) {
    theState = 'OVERWEIGHT';
    return state.OVERWEIGHT;
  } else {
    theState = 'OBESE';
    return state.OBESE;
  }
}
