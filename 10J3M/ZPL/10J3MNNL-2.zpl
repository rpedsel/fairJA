set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.8236, <2> 16.5096, <3> 26.5536, <4> 18.7744, <5> 29.0802, <6> 17.304, <7> 22.4843, <8> 27.9074, <9> 29.4333, <10> 22.7082;
param workload[JOB] := <1> 25.8236, <2> 16.5096, <3> 26.5536, <4> 18.7744, <5> 29.0802, <6> 17.304, <7> 22.4843, <8> 27.9074, <9> 29.4333, <10> 22.7082;
param capacity[MACHINE] := <1> 236.5786, <2> 236.5786, <3> 236.5786;

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
