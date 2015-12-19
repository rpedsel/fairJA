set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3967, <2> 22.9554, <3> 25.1149, <4> 29.1909, <5> 19.3658, <6> 12.8085, <7> 30.8189, <8> 16.1081, <9> 15.9123, <10> 21.557;
param workload[JOB] := <1> 21.3967, <2> 22.9554, <3> 25.1149, <4> 29.1909, <5> 19.3658, <6> 12.8085, <7> 30.8189, <8> 16.1081, <9> 15.9123, <10> 21.557;
param capacity[MACHINE] := <1> 215.2285, <2> 215.2285, <3> 215.2285;

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
