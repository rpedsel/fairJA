set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.8445, <2> 36.6229, <3> 25.7764, <4> 28.4593, <5> 32.592, <6> 20.6958, <7> 42.9744, <8> 29.7821, <9> 26.8318, <10> 26.618;
param workload[JOB] := <1> 568.5602, <2> 1341.2368, <3> 664.4228, <4> 809.9318, <5> 1062.2385, <6> 428.3161, <7> 1846.7991, <8> 886.9735, <9> 719.9455, <10> 708.5179;
param capacity[MACHINE] := <1> 2259.2356, <2> 2259.2356, <3> 2259.2356;

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
