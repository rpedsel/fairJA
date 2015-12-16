set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.7841, <2> 30.6776, <3> 32.2674, <4> 36.3113, <5> 13.9827, <6> 44.4428, <7> 45.9638, <8> 33.299, <9> 34.8774, <10> 14.8134, <11> 31.0267, <12> 13.5727, <13> 15.8204, <14> 13.8029, <15> 27.6526, <16> 11.1419, <17> 36.8797, <18> 42.1969, <19> 46.7818, <20> 4.385;
param workload[JOB] := <1> 12.7841, <2> 30.6776, <3> 32.2674, <4> 36.3113, <5> 13.9827, <6> 44.4428, <7> 45.9638, <8> 33.299, <9> 34.8774, <10> 14.8134, <11> 31.0267, <12> 13.5727, <13> 15.8204, <14> 13.8029, <15> 27.6526, <16> 11.1419, <17> 36.8797, <18> 42.1969, <19> 46.7818, <20> 4.385;
param capacity[MACHINE] := <1> 67.835, <2> 67.835, <3> 67.835, <4> 67.835, <5> 67.835, <6> 67.835;

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
