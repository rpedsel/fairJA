set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.9624, <2> 21.2255, <3> 9.2223, <4> 24.4307, <5> 18.9861, <6> 28.617, <7> 40.6483, <8> 15.4502, <9> 10.0784, <10> 14.0142;
param workload[JOB] := <1> 11.9993, <2> 13.9298, <3> 17.1172, <4> 41.6347, <5> 44.1019, <6> 37.5675, <7> 5.8742, <8> 38.2419, <9> 35.9083, <10> 30.4166;
param capacity[MACHINE] := <1> 92.2638, <2> 92.2638, <3> 92.2638;

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
