set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.146, <2> 21.5871, <3> 25.1984, <4> 19.5925, <5> 27.1368, <6> 21.1382, <7> 25.4642, <8> 26.8296, <9> 28.7641, <10> 20.9465;
param workload[JOB] := <1> 22.146, <2> 21.5871, <3> 25.1984, <4> 19.5925, <5> 27.1368, <6> 21.1382, <7> 25.4642, <8> 26.8296, <9> 28.7641, <10> 20.9465;
param capacity[MACHINE] := <1> 59.7008, <2> 59.7008, <3> 59.7008;

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
