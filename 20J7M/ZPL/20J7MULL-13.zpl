set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.3317, <2> 8.6846, <3> 32.0656, <4> 10.9516, <5> 32.1972, <6> 29.1746, <7> 47.5382, <8> 34.2889, <9> 2.7631, <10> 15.9566, <11> 19.3236, <12> 9.3003, <13> 15.2854, <14> 18.9199, <15> 35.6509, <16> 46.6986, <17> 36.9317, <18> 41.6734, <19> 44.2221, <20> 27.1378;
param workload[JOB] := <1> 28.3317, <2> 8.6846, <3> 32.0656, <4> 10.9516, <5> 32.1972, <6> 29.1746, <7> 47.5382, <8> 34.2889, <9> 2.7631, <10> 15.9566, <11> 19.3236, <12> 9.3003, <13> 15.2854, <14> 18.9199, <15> 35.6509, <16> 46.6986, <17> 36.9317, <18> 41.6734, <19> 44.2221, <20> 27.1378;
param capacity[MACHINE] := <1> 76.728, <2> 76.728, <3> 76.728, <4> 76.728, <5> 76.728, <6> 76.728, <7> 76.728;

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
