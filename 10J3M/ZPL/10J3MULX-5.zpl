set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.6327, <2> 40.978, <3> 5.0414, <4> 46.7694, <5> 9.7888, <6> 16.9769, <7> 31.2075, <8> 23.7453, <9> 9.8789, <10> 3.8572;
param workload[JOB] := <1> 2.3733, <2> 6.4014, <3> 2.2453, <4> 6.8388, <5> 3.1287, <6> 4.1203, <7> 5.5864, <8> 4.8729, <9> 3.1431, <10> 1.964;
param capacity[MACHINE] := <1> 13.5581, <2> 13.5581, <3> 13.5581;

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
