set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.0244, <2> 37.6953, <3> 41.159, <4> 29.7959, <5> 11.6229, <6> 18.6299, <7> 11.2781, <8> 26.8268, <9> 11.2989, <10> 47.2471;
param workload[JOB] := <1> 2.8327, <2> 6.1396, <3> 6.4155, <4> 5.4586, <5> 3.4092, <6> 4.3162, <7> 3.3583, <8> 5.1795, <9> 3.3614, <10> 6.8737;
param capacity[MACHINE] := <1> 15.7816, <2> 15.7816, <3> 15.7816;

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
