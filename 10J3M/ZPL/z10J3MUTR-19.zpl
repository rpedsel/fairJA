set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1226, <2> 48.4346, <3> 22.1755, <4> 9.4902, <5> 36.0541, <6> 8.9985, <7> 35.0688, <8> 11.7442, <9> 25.2897, <10> 30.3506;
param workload[JOB] := <1> 30.3282, <2> 21.3046, <3> 27.8557, <4> 11.1205, <5> 5.7735, <6> 2.1427, <7> 3.0754, <8> 37.7479, <9> 30.5381, <10> 33.5059;
param capacity[MACHINE] := <1> 50.8481, <2> 50.8481, <3> 50.8481;

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
