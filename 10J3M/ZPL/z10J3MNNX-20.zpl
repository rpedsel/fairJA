set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.5345, <2> 13.3836, <3> 22.2817, <4> 22.926, <5> 30.0929, <6> 28.0766, <7> 29.1682, <8> 33.9125, <9> 22.8985, <10> 20.5585;
param workload[JOB] := <1> 3.8124, <2> 3.6584, <3> 4.7203, <4> 4.7881, <5> 5.4857, <6> 5.2987, <7> 5.4008, <8> 5.8234, <9> 4.7852, <10> 4.5341;
param capacity[MACHINE] := <1> 48.3071, <2> 48.3071, <3> 48.3071;

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
