set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.8186, <2> 25.5148, <3> 17.753, <4> 29.6596, <5> 26.0868, <6> 22.3018, <7> 14.5683, <8> 28.2141, <9> 28.1237, <10> 28.6853;
param workload[JOB] := <1> 354.1397, <2> 651.005, <3> 315.169, <4> 879.6919, <5> 680.5211, <6> 497.3703, <7> 212.2354, <8> 796.0354, <9> 790.9425, <10> 822.8464;
param capacity[MACHINE] := <1> 5999.9567, <2> 5999.9567, <3> 5999.9567;

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
