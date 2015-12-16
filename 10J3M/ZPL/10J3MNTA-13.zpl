set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.9459, <2> 22.7342, <3> 29.0659, <4> 31.0693, <5> 24.6831, <6> 30.8326, <7> 20.6025, <8> 25.6893, <9> 19.6928, <10> 31.1202;
param workload[JOB] := <1> 1364.9995, <2> 516.8438, <3> 844.8265, <4> 965.3014, <5> 609.2554, <6> 950.6492, <7> 424.463, <8> 659.9401, <9> 387.8064, <10> 968.4668;
param capacity[MACHINE] := <1> 1923.138, <2> 1923.138, <3> 1923.138;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
