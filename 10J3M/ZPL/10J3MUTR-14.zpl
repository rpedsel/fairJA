set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.5998, <2> 26.2765, <3> 45.3431, <4> 23.5513, <5> 33.4912, <6> 25.8355, <7> 27.7514, <8> 15.4951, <9> 2.551, <10> 45.4403;
param workload[JOB] := <1> 15.8536, <2> 26.9357, <3> 18.0752, <4> 19.1858, <5> 17.7917, <6> 5.845, <7> 8.9777, <8> 34.558, <9> 45.0175, <10> 26.8518;
param capacity[MACHINE] := <1> 54.773, <2> 54.773, <3> 54.773;

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
