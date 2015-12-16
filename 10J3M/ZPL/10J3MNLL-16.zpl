set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.0779, <2> 14.2359, <3> 23.0155, <4> 14.9592, <5> 23.5139, <6> 23.1772, <7> 30.3897, <8> 17.8143, <9> 34.5259, <10> 28.8309;
param workload[JOB] := <1> 27.0779, <2> 14.2359, <3> 23.0155, <4> 14.9592, <5> 23.5139, <6> 23.1772, <7> 30.3897, <8> 17.8143, <9> 34.5259, <10> 28.8309;
param capacity[MACHINE] := <1> 79.1801, <2> 79.1801, <3> 79.1801;

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
