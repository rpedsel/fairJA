set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.498, <2> 15.2072, <3> 18.8815, <4> 39.2236, <5> 28.9686, <6> 48.5603, <7> 15.2317, <8> 30.5345, <9> 16.0804, <10> 18.2082;
param workload[JOB] := <1> 8.498, <2> 15.2072, <3> 18.8815, <4> 39.2236, <5> 28.9686, <6> 48.5603, <7> 15.2317, <8> 30.5345, <9> 16.0804, <10> 18.2082;
param capacity[MACHINE] := <1> 239.394, <2> 239.394, <3> 239.394;

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
