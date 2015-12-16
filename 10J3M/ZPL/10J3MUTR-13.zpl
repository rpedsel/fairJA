set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.5115, <2> 45.3233, <3> 40.9389, <4> 3.2293, <5> 18.0569, <6> 38.8822, <7> 4.2934, <8> 0.9131, <9> 30.7767, <10> 20.2868;
param workload[JOB] := <1> 49.9858, <2> 5.7958, <3> 11.9156, <4> 1.8841, <5> 24.9426, <6> 48.0773, <7> 40.4619, <8> 2.29, <9> 17.3613, <10> 32.5656;
param capacity[MACHINE] := <1> 58.82, <2> 58.82, <3> 58.82;

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
