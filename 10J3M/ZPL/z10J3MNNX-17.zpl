set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.8451, <2> 22.5194, <3> 24.4819, <4> 20.7278, <5> 21.6598, <6> 29.9206, <7> 24.5059, <8> 23.7943, <9> 23.1785, <10> 26.2009;
param workload[JOB] := <1> 5.9871, <2> 4.7455, <3> 4.9479, <4> 4.5528, <5> 4.654, <6> 5.47, <7> 4.9503, <8> 4.8779, <9> 4.8144, <10> 5.1187;
param capacity[MACHINE] := <1> 50.1186, <2> 50.1186, <3> 50.1186;

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
