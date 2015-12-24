set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.3721, <2> 0.0839, <3> 0.3172, <4> 3.4372, <5> 17.6696, <6> 2.6237, <7> 46.1678, <8> 16.4241, <9> 39.951, <10> 8.4825;
param workload[JOB] := <1> 4.2863, <2> 0.2897, <3> 0.5632, <4> 1.854, <5> 4.2035, <6> 1.6198, <7> 6.7947, <8> 4.0527, <9> 6.3207, <10> 2.9125;
param capacity[MACHINE] := <1> 32.8971, <2> 32.8971, <3> 32.8971;

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
