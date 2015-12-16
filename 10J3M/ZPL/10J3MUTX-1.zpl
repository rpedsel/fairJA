set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.5224, <2> 32.8178, <3> 17.207, <4> 1.6445, <5> 12.95, <6> 46.9789, <7> 37.4416, <8> 34.1814, <9> 0.3877, <10> 32.6995;
param workload[JOB] := <1> 5.9601, <2> 5.7287, <3> 4.1481, <4> 1.2824, <5> 3.5986, <6> 6.8541, <7> 6.119, <8> 5.8465, <9> 0.6227, <10> 5.7183;
param capacity[MACHINE] := <1> 11.4696, <2> 11.4696, <3> 11.4696;

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
