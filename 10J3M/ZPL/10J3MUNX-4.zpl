set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.2108, <2> 31.5774, <3> 31.6776, <4> 10.3362, <5> 14.0581, <6> 5.7285, <7> 18.606, <8> 16.9457, <9> 43.9299, <10> 19.5134;
param workload[JOB] := <1> 3.9001, <2> 5.6194, <3> 5.6283, <4> 3.215, <5> 3.7494, <6> 2.3934, <7> 4.3135, <8> 4.1165, <9> 6.628, <10> 4.4174;
param capacity[MACHINE] := <1> 43.981, <2> 43.981, <3> 43.981;

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
