set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.3536, <2> 20.2631, <3> 41.0445, <4> 29.5585, <5> 39.0088, <6> 26.8231, <7> 7.0598, <8> 39.5482, <9> 31.2719, <10> 17.3548;
param workload[JOB] := <1> 983.0482, <2> 410.5932, <3> 1684.651, <4> 873.7049, <5> 1521.6865, <6> 719.4787, <7> 49.8408, <8> 1564.0601, <9> 977.9317, <10> 301.1891;
param capacity[MACHINE] := <1> 2271.5461, <2> 2271.5461, <3> 2271.5461;

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
