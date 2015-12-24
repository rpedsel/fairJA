set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.2119, <2> 25.7142, <3> 16.3574, <4> 27.702, <5> 28.5408, <6> 29.363, <7> 17.9161, <8> 17.7988, <9> 25.042, <10> 26.2925;
param workload[JOB] := <1> 296.2495, <2> 661.2201, <3> 267.5645, <4> 767.4008, <5> 814.5773, <6> 862.1858, <7> 320.9866, <8> 316.7973, <9> 627.1018, <10> 691.2956;
param capacity[MACHINE] := <1> 5625.3793, <2> 5625.3793, <3> 5625.3793;

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
