set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7928, <2> 17.8369, <3> 21.3456, <4> 25.5514, <5> 29.4608, <6> 23.0794, <7> 30.9127, <8> 24.5032, <9> 24.0985, <10> 30.3878;
param workload[JOB] := <1> 717.8541, <2> 318.155, <3> 455.6346, <4> 652.874, <5> 867.9387, <6> 532.6587, <7> 955.595, <8> 600.4068, <9> 580.7377, <10> 923.4184;
param capacity[MACHINE] := <1> 2201.7577, <2> 2201.7577, <3> 2201.7577;

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
