set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.1178, <2> 32.768, <3> 20.1514, <4> 29.1583, <5> 23.5757, <6> 24.2116, <7> 13.4528, <8> 32.6187, <9> 26.5528, <10> 18.6059, <11> 27.5935, <12> 26.0471, <13> 29.2732, <14> 27.3599, <15> 19.5119, <16> 29.5272, <17> 19.6149, <18> 27.6487, <19> 19.7235, <20> 18.0374;
param workload[JOB] := <1> 5.488, <2> 5.7243, <3> 4.489, <4> 5.3998, <5> 4.8555, <6> 4.9205, <7> 3.6678, <8> 5.7113, <9> 5.1529, <10> 4.3135, <11> 5.253, <12> 5.1036, <13> 5.4105, <14> 5.2307, <15> 4.4172, <16> 5.4339, <17> 4.4289, <18> 5.2582, <19> 4.4411, <20> 4.247;
param capacity[MACHINE] := <1> 12.3683, <2> 12.3683, <3> 12.3683, <4> 12.3683, <5> 12.3683, <6> 12.3683;

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
