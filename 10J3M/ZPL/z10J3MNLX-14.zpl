set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.1032, <2> 33.3554, <3> 21.6967, <4> 23.8307, <5> 25.4903, <6> 30.0425, <7> 28.9486, <8> 23.0091, <9> 17.9419, <10> 24.4449;
param workload[JOB] := <1> 5.3947, <2> 5.7754, <3> 4.658, <4> 4.8817, <5> 5.0488, <6> 5.4811, <7> 5.3804, <8> 4.7968, <9> 4.2358, <10> 4.9442;
param capacity[MACHINE] := <1> 16.8656, <2> 16.8656, <3> 16.8656;

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
