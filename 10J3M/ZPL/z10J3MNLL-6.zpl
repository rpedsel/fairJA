set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9353, <2> 25.1323, <3> 19.4747, <4> 22.7913, <5> 26.9632, <6> 27.655, <7> 31.9291, <8> 25.4292, <9> 18.6306, <10> 20.4885;
param workload[JOB] := <1> 27.9353, <2> 25.1323, <3> 19.4747, <4> 22.7913, <5> 26.9632, <6> 27.655, <7> 31.9291, <8> 25.4292, <9> 18.6306, <10> 20.4885;
param capacity[MACHINE] := <1> 82.1431, <2> 82.1431, <3> 82.1431;

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
