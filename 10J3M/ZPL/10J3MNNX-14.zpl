set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1882, <2> 22.1521, <3> 27.7421, <4> 13.5883, <5> 19.7262, <6> 30.2773, <7> 31.0988, <8> 29.25, <9> 17.0962, <10> 31.1218;
param workload[JOB] := <1> 4.9182, <2> 4.7066, <3> 5.2671, <4> 3.6862, <5> 4.4414, <6> 5.5025, <7> 5.5766, <8> 5.4083, <9> 4.1348, <10> 5.5787;
param capacity[MACHINE] := <1> 49.2204, <2> 49.2204, <3> 49.2204;

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
