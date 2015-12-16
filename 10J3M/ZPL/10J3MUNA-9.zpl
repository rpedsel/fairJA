set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.1421, <2> 2.7141, <3> 33.5262, <4> 19.0694, <5> 10.9182, <6> 21.6362, <7> 1.4141, <8> 23.0164, <9> 22.7461, <10> 13.8062;
param workload[JOB] := <1> 17.157, <2> 7.3663, <3> 1124.0061, <4> 363.642, <5> 119.2071, <6> 468.1252, <7> 1.9997, <8> 529.7547, <9> 517.3851, <10> 190.6112;
param capacity[MACHINE] := <1> 3339.2544, <2> 3339.2544, <3> 3339.2544;

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
