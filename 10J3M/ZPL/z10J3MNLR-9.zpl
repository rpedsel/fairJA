set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.9341, <2> 31.528, <3> 25.3508, <4> 27.2451, <5> 26.4942, <6> 25.5026, <7> 22.9972, <8> 25.6186, <9> 30.4091, <10> 25.4288;
param workload[JOB] := <1> 37.2805, <2> 48.02, <3> 16.1471, <4> 38.3101, <5> 25.6419, <6> 29.7302, <7> 26.0969, <8> 21.4905, <9> 46.1988, <10> 11.187;
param capacity[MACHINE] := <1> 100.0343, <2> 100.0343, <3> 100.0343;

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
