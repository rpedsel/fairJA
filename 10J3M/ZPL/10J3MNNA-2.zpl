set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.4108, <2> 24.9569, <3> 26.7924, <4> 26.5407, <5> 16.1284, <6> 32.621, <7> 28.5914, <8> 26.7798, <9> 23.5684, <10> 28.1937;
param workload[JOB] := <1> 179.8496, <2> 622.8469, <3> 717.8327, <4> 704.4088, <5> 260.1253, <6> 1064.1296, <7> 817.4682, <8> 717.1577, <9> 555.4695, <10> 794.8847;
param capacity[MACHINE] := <1> 6434.173, <2> 6434.173, <3> 6434.173;

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
