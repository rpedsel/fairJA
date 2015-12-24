set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.5474, <2> 15.3414, <3> 27.4155, <4> 2.2494, <5> 28.3394, <6> 48.1537, <7> 19.7278, <8> 48.0233, <9> 16.7199, <10> 11.5145;
param workload[JOB] := <1> 111.2476, <2> 235.3586, <3> 751.6096, <4> 5.0598, <5> 803.1216, <6> 2318.7788, <7> 389.1861, <8> 2306.2373, <9> 279.5551, <10> 132.5837;
param capacity[MACHINE] := <1> 2510.9111, <2> 2510.9111, <3> 2510.9111;

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
