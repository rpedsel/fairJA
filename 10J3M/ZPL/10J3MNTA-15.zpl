set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3937, <2> 24.4106, <3> 20.1816, <4> 28.0553, <5> 23.011, <6> 32.0774, <7> 29.0342, <8> 31.3355, <9> 23.2055, <10> 28.6898;
param workload[JOB] := <1> 547.2652, <2> 595.8774, <3> 407.297, <4> 787.0999, <5> 529.5061, <6> 1028.9596, <7> 842.9848, <8> 981.9136, <9> 538.4952, <10> 823.1046;
param capacity[MACHINE] := <1> 1770.6259, <2> 1770.6259, <3> 1770.6259;

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
