set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.6861, <2> 42.1323, <3> 20.7341, <4> 2.4771, <5> 43.1962, <6> 47.3065, <7> 2.715, <8> 4.9133, <9> 35.4707, <10> 7.343;
param workload[JOB] := <1> 28.4002, <2> 49.7914, <3> 33.0784, <4> 10.2174, <5> 40.9633, <6> 6.3844, <7> 27.6987, <8> 40.8233, <9> 4.7854, <10> 36.8885;
param capacity[MACHINE] := <1> 93.0103, <2> 93.0103, <3> 93.0103;

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
