set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0424, <2> 21.3899, <3> 8.9796, <4> 8.4353, <5> 20.9248, <6> 4.776, <7> 37.8973, <8> 10.118, <9> 33.597, <10> 12.8701, <11> 21.9845, <12> 17.3432, <13> 4.5355, <14> 7.5588, <15> 31.3973, <16> 3.3434, <17> 39.792, <18> 19.8223, <19> 19.4252, <20> 15.9219;
param workload[JOB] := <1> 24.3658, <2> 33.6642, <3> 19.9688, <4> 5.6055, <5> 37.7464, <6> 32.9553, <7> 33.8307, <8> 34.3888, <9> 2.1306, <10> 23.6634, <11> 43.8517, <12> 0.11, <13> 31.4419, <14> 7.6107, <15> 43.6153, <16> 44.1964, <17> 22.9691, <18> 5.674, <19> 9.1162, <20> 3.637;
param capacity[MACHINE] := <1> 57.5678, <2> 57.5678, <3> 57.5678, <4> 57.5678, <5> 57.5678, <6> 57.5678;

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
