set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0416, <2> 23.5348, <3> 26.0622, <4> 15.8293, <5> 29.2583, <6> 16.6734, <7> 31.7686, <8> 23.021, <9> 26.9977, <10> 25.4156;
param workload[JOB] := <1> 31.6503, <2> 22.0678, <3> 27.3434, <4> 24.421, <5> 35.8883, <6> 3.1353, <7> 30.4152, <8> 33.7839, <9> 2.5688, <10> 23.1993;
param capacity[MACHINE] := <1> 58.6183, <2> 58.6183, <3> 58.6183;

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
