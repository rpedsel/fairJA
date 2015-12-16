set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.5243, <2> 16.1009, <3> 40.249, <4> 49.5427, <5> 26.4835, <6> 15.6814, <7> 47.6178, <8> 20.362, <9> 20.5487, <10> 32.6886;
param workload[JOB] := <1> 36.5554, <2> 38.5279, <3> 37.862, <4> 46.5256, <5> 8.7088, <6> 14.9082, <7> 0.6245, <8> 29.2069, <9> 1.1316, <10> 44.788;
param capacity[MACHINE] := <1> 64.7097, <2> 64.7097, <3> 64.7097;

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
