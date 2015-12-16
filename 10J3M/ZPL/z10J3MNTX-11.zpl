set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.5234, <2> 23.0361, <3> 30.8704, <4> 27.5344, <5> 24.3595, <6> 35.4736, <7> 34.5335, <8> 17.6436, <9> 25.9343, <10> 30.8664;
param workload[JOB] := <1> 4.1861, <2> 4.7996, <3> 5.5561, <4> 5.2473, <5> 4.9355, <6> 5.956, <7> 5.8765, <8> 4.2004, <9> 5.0926, <10> 5.5558;
param capacity[MACHINE] := <1> 12.8515, <2> 12.8515, <3> 12.8515;

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
