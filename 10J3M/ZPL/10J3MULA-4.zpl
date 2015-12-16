set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.8879, <2> 7.6574, <3> 14.7291, <4> 15.4199, <5> 2.4674, <6> 13.4775, <7> 11.3124, <8> 22.2431, <9> 37.6009, <10> 4.61;
param workload[JOB] := <1> 118.5464, <2> 58.6358, <3> 216.9464, <4> 237.7733, <5> 6.0881, <6> 181.643, <7> 127.9704, <8> 494.7555, <9> 1413.8277, <10> 21.2521;
param capacity[MACHINE] := <1> 959.1462, <2> 959.1462, <3> 959.1462;

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
