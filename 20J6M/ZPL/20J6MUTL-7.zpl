set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.6154, <2> 23.7807, <3> 45.307, <4> 7.6786, <5> 17.8493, <6> 20.6631, <7> 37.5691, <8> 34.7587, <9> 27.0558, <10> 42.6412, <11> 23.0063, <12> 8.4289, <13> 47.3991, <14> 37.5902, <15> 10.0271, <16> 37.0209, <17> 33.6853, <18> 49.0375, <19> 25.584, <20> 38.3365;
param workload[JOB] := <1> 22.6154, <2> 23.7807, <3> 45.307, <4> 7.6786, <5> 17.8493, <6> 20.6631, <7> 37.5691, <8> 34.7587, <9> 27.0558, <10> 42.6412, <11> 23.0063, <12> 8.4289, <13> 47.3991, <14> 37.5902, <15> 10.0271, <16> 37.0209, <17> 33.6853, <18> 49.0375, <19> 25.584, <20> 38.3365;
param capacity[MACHINE] := <1> 73.7543, <2> 73.7543, <3> 73.7543, <4> 73.7543, <5> 73.7543, <6> 73.7543;

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
