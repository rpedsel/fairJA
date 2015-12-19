set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.9885, <2> 13.3147, <3> 40.3216, <4> 26.3485, <5> 17.3548, <6> 0.3183, <7> 29.8179, <8> 30.3238, <9> 3.5961, <10> 29.6157;
param workload[JOB] := <1> 3.8715, <2> 3.6489, <3> 6.3499, <4> 5.1331, <5> 4.1659, <6> 0.5642, <7> 5.4606, <8> 5.5067, <9> 1.8963, <10> 5.442;
param capacity[MACHINE] := <1> 42.0391, <2> 42.0391, <3> 42.0391;

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
