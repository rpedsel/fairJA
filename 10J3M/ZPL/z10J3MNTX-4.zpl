set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3004, <2> 24.1285, <3> 20.2741, <4> 26.9593, <5> 31.6086, <6> 29.2017, <7> 30.012, <8> 30.1895, <9> 24.2624, <10> 32.4145;
param workload[JOB] := <1> 4.827, <2> 4.9121, <3> 4.5027, <4> 5.1922, <5> 5.6222, <6> 5.4039, <7> 5.4783, <8> 5.4945, <9> 4.9257, <10> 5.6934;
param capacity[MACHINE] := <1> 13.013, <2> 13.013, <3> 13.013;

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
