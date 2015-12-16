set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.852, <2> 25.3074, <3> 46.9762, <4> 8.6939, <5> 22.452, <6> 34.8044, <7> 17.9144, <8> 2.7908, <9> 30.9707, <10> 17.2014;
param workload[JOB] := <1> 5.5545, <2> 5.0306, <3> 6.8539, <4> 2.9485, <5> 4.7384, <6> 5.8995, <7> 4.2325, <8> 1.6706, <9> 5.5651, <10> 4.1475;
param capacity[MACHINE] := <1> 11.6603, <2> 11.6603, <3> 11.6603;

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
