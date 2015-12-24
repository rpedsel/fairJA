set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.4699, <2> 22.7946, <3> 28.149, <4> 30.2446, <5> 24.1755, <6> 12.1356, <7> 21.511, <8> 28.5782, <9> 27.5819, <10> 20.5282;
param workload[JOB] := <1> 13.6743, <2> 11.545, <3> 9.6842, <4> 47.1346, <5> 4.0659, <6> 32.002, <7> 26.3142, <8> 41.0216, <9> 23.3584, <10> 16.3392;
param capacity[MACHINE] := <1> 225.1394, <2> 225.1394, <3> 225.1394;

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
