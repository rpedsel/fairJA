set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3727, <2> 24.949, <3> 32.0192, <4> 28.3304, <5> 30.414, <6> 31.2039, <7> 33.9017, <8> 24.7983, <9> 25.6754, <10> 18.8907;
param workload[JOB] := <1> 695.5193, <2> 622.4526, <3> 1025.2292, <4> 802.6116, <5> 925.0114, <6> 973.6834, <7> 1149.3253, <8> 614.9557, <9> 659.2262, <10> 356.8585;
param capacity[MACHINE] := <1> 7824.8732, <2> 7824.8732, <3> 7824.8732;

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
