set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0837, <2> 39.802, <3> 30.2254, <4> 30.9784, <5> 44.0664, <6> 20.3749, <7> 48.6626, <8> 23.7908, <9> 23.0917, <10> 25.4346, <11> 34.7448, <12> 36.4388, <13> 16.4213, <14> 40.6524, <15> 14.6741, <16> 47.7983, <17> 44.4968, <18> 37.1534, <19> 33.9189, <20> 41.0504;
param workload[JOB] := <1> 29.0837, <2> 39.802, <3> 30.2254, <4> 30.9784, <5> 44.0664, <6> 20.3749, <7> 48.6626, <8> 23.7908, <9> 23.0917, <10> 25.4346, <11> 34.7448, <12> 36.4388, <13> 16.4213, <14> 40.6524, <15> 14.6741, <16> 47.7983, <17> 44.4968, <18> 37.1534, <19> 33.9189, <20> 41.0504;
param capacity[MACHINE] := <1> 71.0206, <2> 71.0206, <3> 71.0206, <4> 71.0206, <5> 71.0206, <6> 71.0206, <7> 71.0206;

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
