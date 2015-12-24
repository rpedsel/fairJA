set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0964, <2> 18.8696, <3> 18.8583, <4> 27.0184, <5> 14.2824, <6> 33.0844, <7> 33.7735, <8> 22.4954, <9> 21.4328, <10> 13.3002;
param workload[JOB] := <1> 25.0964, <2> 18.8696, <3> 18.8583, <4> 27.0184, <5> 14.2824, <6> 33.0844, <7> 33.7735, <8> 22.4954, <9> 21.4328, <10> 13.3002;
param capacity[MACHINE] := <1> 76.0705, <2> 76.0705, <3> 76.0705;

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
