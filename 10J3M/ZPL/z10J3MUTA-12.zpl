set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.9483, <2> 5.3984, <3> 38.1745, <4> 22.254, <5> 12.1486, <6> 5.7982, <7> 11.8754, <8> 25.6653, <9> 18.0065, <10> 48.0549;
param workload[JOB] := <1> 1595.8667, <2> 29.1427, <3> 1457.2925, <4> 495.2405, <5> 147.5885, <6> 33.6191, <7> 141.0251, <8> 658.7076, <9> 324.234, <10> 2309.2734;
param capacity[MACHINE] := <1> 3355.5802, <2> 3355.5802, <3> 3355.5802;

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
