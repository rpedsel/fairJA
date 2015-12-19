set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2784, <2> 22.1668, <3> 21.6377, <4> 21.8517, <5> 30.6543, <6> 15.1876, <7> 21.7051, <8> 23.6207, <9> 26.0586, <10> 35.7153;
param workload[JOB] := <1> 690.5543, <2> 491.367, <3> 468.1901, <4> 477.4968, <5> 939.6861, <6> 230.6632, <7> 471.1114, <8> 557.9375, <9> 679.0506, <10> 1275.5827;
param capacity[MACHINE] := <1> 6281.6397, <2> 6281.6397, <3> 6281.6397;

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
