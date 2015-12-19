set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.0306, <2> 4.597, <3> 11.6488, <4> 14.6892, <5> 38.0705, <6> 47.6847, <7> 21.9947, <8> 10.6897, <9> 16.4592, <10> 19.0401;
param workload[JOB] := <1> 16.9771, <2> 1.8281, <3> 32.331, <4> 27.7342, <5> 18.1804, <6> 22.8424, <7> 4.6669, <8> 24.3476, <9> 29.6883, <10> 46.6238;
param capacity[MACHINE] := <1> 225.2198, <2> 225.2198, <3> 225.2198;

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
