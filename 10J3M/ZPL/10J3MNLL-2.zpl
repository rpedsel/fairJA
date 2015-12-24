set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5333, <2> 16.1424, <3> 18.0881, <4> 23.3459, <5> 24.0807, <6> 27.8036, <7> 23.183, <8> 17.4121, <9> 25.6222, <10> 30.7759;
param workload[JOB] := <1> 23.5333, <2> 16.1424, <3> 18.0881, <4> 23.3459, <5> 24.0807, <6> 27.8036, <7> 23.183, <8> 17.4121, <9> 25.6222, <10> 30.7759;
param capacity[MACHINE] := <1> 76.6624, <2> 76.6624, <3> 76.6624;

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
