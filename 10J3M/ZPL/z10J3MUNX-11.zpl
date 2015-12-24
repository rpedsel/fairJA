set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.548, <2> 5.1545, <3> 28.51, <4> 3.0745, <5> 49.6325, <6> 6.5193, <7> 8.6935, <8> 0.6686, <9> 48.4135, <10> 49.7316;
param workload[JOB] := <1> 5.527, <2> 2.2704, <3> 5.3395, <4> 1.7534, <5> 7.045, <6> 2.5533, <7> 2.9485, <8> 0.8177, <9> 6.958, <10> 7.0521;
param capacity[MACHINE] := <1> 42.2649, <2> 42.2649, <3> 42.2649;

var x[JM] binary;
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
