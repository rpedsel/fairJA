set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9993, <2> 19.9936, <3> 16.5261, <4> 24.1927, <5> 26.6885, <6> 26.2727, <7> 24.3324, <8> 22.1512, <9> 18.2393, <10> 29.0338;
param workload[JOB] := <1> 528.9678, <2> 399.744, <3> 273.112, <4> 585.2867, <5> 712.276, <6> 690.2548, <7> 592.0657, <8> 490.6757, <9> 332.6721, <10> 842.9615;
param capacity[MACHINE] := <1> 1362.0041, <2> 1362.0041, <3> 1362.0041;

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
