set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.875, <2> 30.4496, <3> 10.1166, <4> 22.2216, <5> 23.6863, <6> 22.2057, <7> 23.7809, <8> 17.9807, <9> 29.8142, <10> 26.5755;
param workload[JOB] := <1> 4.4581, <2> 5.5181, <3> 3.1807, <4> 4.714, <5> 4.8669, <6> 4.7123, <7> 4.8766, <8> 4.2404, <9> 5.4602, <10> 5.1551;
param capacity[MACHINE] := <1> 11.7956, <2> 11.7956, <3> 11.7956;

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
