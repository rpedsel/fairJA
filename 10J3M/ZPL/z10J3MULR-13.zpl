set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.0259, <2> 11.1171, <3> 38.5541, <4> 36.4001, <5> 18.6394, <6> 40.8303, <7> 17.1901, <8> 26.0466, <9> 13.8157, <10> 7.3011;
param workload[JOB] := <1> 47.1103, <2> 3.9654, <3> 21.558, <4> 24.7172, <5> 6.957, <6> 48.219, <7> 48.1809, <8> 42.2197, <9> 47.1986, <10> 17.9563;
param capacity[MACHINE] := <1> 102.6941, <2> 102.6941, <3> 102.6941;

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
