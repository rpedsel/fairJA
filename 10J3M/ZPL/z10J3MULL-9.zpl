set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.8321, <2> 25.9679, <3> 0.0661, <4> 25.6613, <5> 7.4478, <6> 4.3581, <7> 26.9599, <8> 39.0433, <9> 9.5764, <10> 21.7498;
param workload[JOB] := <1> 12.8321, <2> 25.9679, <3> 0.0661, <4> 25.6613, <5> 7.4478, <6> 4.3581, <7> 26.9599, <8> 39.0433, <9> 9.5764, <10> 21.7498;
param capacity[MACHINE] := <1> 57.8876, <2> 57.8876, <3> 57.8876;

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
