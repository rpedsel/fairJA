set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.7954, <2> 19.5458, <3> 25.855, <4> 17.202, <5> 39.8949, <6> 24.6047, <7> 21.2172, <8> 23.0128, <9> 30.2988, <10> 21.0342;
param workload[JOB] := <1> 24.7954, <2> 19.5458, <3> 25.855, <4> 17.202, <5> 39.8949, <6> 24.6047, <7> 21.2172, <8> 23.0128, <9> 30.2988, <10> 21.0342;
param capacity[MACHINE] := <1> 247.4608, <2> 247.4608, <3> 247.4608;

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
