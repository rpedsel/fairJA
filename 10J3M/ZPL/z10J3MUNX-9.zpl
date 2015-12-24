set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.9578, <2> 16.1248, <3> 34.2292, <4> 22.3204, <5> 35.8622, <6> 18.4626, <7> 45.8022, <8> 10.099, <9> 5.974, <10> 32.7626;
param workload[JOB] := <1> 6.161, <2> 4.0156, <3> 5.8506, <4> 4.7244, <5> 5.9885, <6> 4.2968, <7> 6.7677, <8> 3.1779, <9> 2.4442, <10> 5.7239;
param capacity[MACHINE] := <1> 49.1506, <2> 49.1506, <3> 49.1506;

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
