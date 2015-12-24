set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.0708, <2> 26.2403, <3> 28.3178, <4> 22.7794, <5> 13.5779, <6> 20.7781, <7> 33.1716, <8> 22.0591, <9> 35.7172, <10> 19.3401;
param workload[JOB] := <1> 5.7507, <2> 5.1225, <3> 5.3214, <4> 4.7728, <5> 3.6848, <6> 4.5583, <7> 5.7595, <8> 4.6967, <9> 5.9764, <10> 4.3977;
param capacity[MACHINE] := <1> 12.5102, <2> 12.5102, <3> 12.5102;

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
