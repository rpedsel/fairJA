set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.0547, <2> 20.6955, <3> 17.2935, <4> 47.3248, <5> 25.5021, <6> 4.133, <7> 21.4791, <8> 13.743, <9> 27.67, <10> 30.434;
param workload[JOB] := <1> 2.2483, <2> 4.5492, <3> 4.1585, <4> 6.8793, <5> 5.05, <6> 2.033, <7> 4.6346, <8> 3.7072, <9> 5.2602, <10> 5.5167;
param capacity[MACHINE] := <1> 14.679, <2> 14.679, <3> 14.679;

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
