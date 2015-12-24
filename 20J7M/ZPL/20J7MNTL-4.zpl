set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.042, <2> 24.8746, <3> 24.2041, <4> 24.6527, <5> 28.292, <6> 25.7756, <7> 28.348, <8> 29.3098, <9> 28.9125, <10> 20.5274, <11> 26.5755, <12> 26.456, <13> 24.5751, <14> 28.6971, <15> 28.2409, <16> 29.1348, <17> 20.198, <18> 26.5794, <19> 23.4575, <20> 28.1088;
param workload[JOB] := <1> 20.042, <2> 24.8746, <3> 24.2041, <4> 24.6527, <5> 28.292, <6> 25.7756, <7> 28.348, <8> 29.3098, <9> 28.9125, <10> 20.5274, <11> 26.5755, <12> 26.456, <13> 24.5751, <14> 28.6971, <15> 28.2409, <16> 29.1348, <17> 20.198, <18> 26.5794, <19> 23.4575, <20> 28.1088;
param capacity[MACHINE] := <1> 55.3888, <2> 55.3888, <3> 55.3888, <4> 55.3888, <5> 55.3888, <6> 55.3888, <7> 55.3888;

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
