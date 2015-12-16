set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.3309, <2> 21.6078, <3> 22.1186, <4> 21.6141, <5> 27.8482, <6> 27.9885, <7> 33.4238, <8> 28.3954, <9> 10.6494, <10> 28.409;
param workload[JOB] := <1> 33.4235, <2> 11.2242, <3> 35.976, <4> 45.8404, <5> 3.0878, <6> 11.1879, <7> 30.2147, <8> 2.5227, <9> 30.818, <10> 44.6891;
param capacity[MACHINE] := <1> 62.2461, <2> 62.2461, <3> 62.2461;

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
