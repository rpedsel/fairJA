set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.253, <2> 3.4732, <3> 44.7221, <4> 35.5605, <5> 39.856, <6> 38.2848, <7> 23.4272, <8> 35.0464, <9> 25.1988, <10> 8.8666;
param workload[JOB] := <1> 5.2204, <2> 1.8637, <3> 6.6875, <4> 5.9633, <5> 6.3132, <6> 6.1875, <7> 4.8402, <8> 5.92, <9> 5.0198, <10> 2.9777;
param capacity[MACHINE] := <1> 12.7484, <2> 12.7484, <3> 12.7484;

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
