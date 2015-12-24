set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7409, <2> 19.2354, <3> 27.2602, <4> 15.2339, <5> 23.1101, <6> 19.1821, <7> 30.0797, <8> 26.1301, <9> 22.8836, <10> 22.3241;
param workload[JOB] := <1> 5.5444, <2> 4.3858, <3> 5.2211, <4> 3.9031, <5> 4.8073, <6> 4.3797, <7> 5.4845, <8> 5.1118, <9> 4.7837, <10> 4.7248;
param capacity[MACHINE] := <1> 16.1154, <2> 16.1154, <3> 16.1154;

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
