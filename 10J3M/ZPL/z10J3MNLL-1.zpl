set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.8231, <2> 31.3252, <3> 24.4714, <4> 30.5665, <5> 14.8389, <6> 16.3845, <7> 19.1585, <8> 18.7349, <9> 25.3031, <10> 24.2312;
param workload[JOB] := <1> 23.8231, <2> 31.3252, <3> 24.4714, <4> 30.5665, <5> 14.8389, <6> 16.3845, <7> 19.1585, <8> 18.7349, <9> 25.3031, <10> 24.2312;
param capacity[MACHINE] := <1> 76.2791, <2> 76.2791, <3> 76.2791;

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
