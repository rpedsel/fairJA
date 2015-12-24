set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2804, <2> 29.2843, <3> 27.0915, <4> 23.6199, <5> 18.1802, <6> 25.4013, <7> 23.8897, <8> 24.2454, <9> 32.1223, <10> 28.8242;
param workload[JOB] := <1> 21.2804, <2> 29.2843, <3> 27.0915, <4> 23.6199, <5> 18.1802, <6> 25.4013, <7> 23.8897, <8> 24.2454, <9> 32.1223, <10> 28.8242;
param capacity[MACHINE] := <1> 63.4848, <2> 63.4848, <3> 63.4848;

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
