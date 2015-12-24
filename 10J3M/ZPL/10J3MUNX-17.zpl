set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.7172, <2> 17.6528, <3> 38.3039, <4> 24.3274, <5> 8.6251, <6> 7.8662, <7> 23.4992, <8> 39.2232, <9> 11.1423, <10> 20.053;
param workload[JOB] := <1> 5.4513, <2> 4.2015, <3> 6.189, <4> 4.9323, <5> 2.9369, <6> 2.8047, <7> 4.8476, <8> 6.2628, <9> 3.338, <10> 4.4781;
param capacity[MACHINE] := <1> 45.4422, <2> 45.4422, <3> 45.4422;

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
