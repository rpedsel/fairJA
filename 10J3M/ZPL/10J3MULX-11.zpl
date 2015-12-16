set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.1283, <2> 3.2141, <3> 12.2869, <4> 26.4829, <5> 16.4851, <6> 24.6516, <7> 43.0965, <8> 25.5585, <9> 48.9303, <10> 14.1907;
param workload[JOB] := <1> 6.7918, <2> 1.7928, <3> 3.5053, <4> 5.1462, <5> 4.0602, <6> 4.965, <7> 6.5648, <8> 5.0555, <9> 6.995, <10> 3.7671;
param capacity[MACHINE] := <1> 16.2146, <2> 16.2146, <3> 16.2146;

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
