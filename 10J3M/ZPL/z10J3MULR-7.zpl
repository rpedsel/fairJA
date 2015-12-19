set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.1417, <2> 11.2867, <3> 19.6972, <4> 14.765, <5> 41.6805, <6> 34.6814, <7> 12.6933, <8> 46.6584, <9> 27.71, <10> 19.0514;
param workload[JOB] := <1> 7.8747, <2> 15.9996, <3> 20.6428, <4> 21.0062, <5> 2.9157, <6> 44.8844, <7> 16.3785, <8> 48.1638, <9> 13.6203, <10> 6.8817;
param capacity[MACHINE] := <1> 66.1226, <2> 66.1226, <3> 66.1226;

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
