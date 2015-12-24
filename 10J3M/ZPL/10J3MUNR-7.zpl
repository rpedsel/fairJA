set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8992, <2> 46.1403, <3> 27.1636, <4> 49.6135, <5> 13.1522, <6> 34.8156, <7> 9.4706, <8> 42.0289, <9> 10.2531, <10> 24.119;
param workload[JOB] := <1> 43.5249, <2> 10.4787, <3> 30.8664, <4> 18.2351, <5> 30.536, <6> 9.2, <7> 9.8009, <8> 0.3819, <9> 38.3217, <10> 37.4989;
param capacity[MACHINE] := <1> 228.8445, <2> 228.8445, <3> 228.8445;

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
