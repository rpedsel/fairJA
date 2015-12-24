set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2469, <2> 16.4356, <3> 26.5521, <4> 18.9759, <5> 31.193, <6> 16.9492, <7> 29.4526, <8> 30.3004, <9> 18.1566, <10> 23.3403;
param workload[JOB] := <1> 25.2469, <2> 16.4356, <3> 26.5521, <4> 18.9759, <5> 31.193, <6> 16.9492, <7> 29.4526, <8> 30.3004, <9> 18.1566, <10> 23.3403;
param capacity[MACHINE] := <1> 78.8675, <2> 78.8675, <3> 78.8675;

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
