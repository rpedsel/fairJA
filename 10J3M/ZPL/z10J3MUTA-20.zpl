set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.5335, <2> 19.6954, <3> 12.6896, <4> 20.8969, <5> 31.9519, <6> 14.8993, <7> 4.0196, <8> 49.4615, <9> 5.411, <10> 47.4669;
param workload[JOB] := <1> 72.8206, <2> 387.9088, <3> 161.0259, <4> 436.6804, <5> 1020.9239, <6> 221.9891, <7> 16.1572, <8> 2446.44, <9> 29.2789, <10> 2253.1066;
param capacity[MACHINE] := <1> 1761.5828, <2> 1761.5828, <3> 1761.5828;

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
