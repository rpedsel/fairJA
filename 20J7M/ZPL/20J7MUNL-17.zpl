set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.6801, <2> 20.4001, <3> 26.0374, <4> 40.6057, <5> 17.2108, <6> 37.1417, <7> 39.5358, <8> 7.0105, <9> 36.3009, <10> 16.3624, <11> 11.2495, <12> 42.9327, <13> 47.6748, <14> 16.312, <15> 34.7793, <16> 36.5621, <17> 33.4082, <18> 42.4364, <19> 6.8498, <20> 25.9477;
param workload[JOB] := <1> 6.6801, <2> 20.4001, <3> 26.0374, <4> 40.6057, <5> 17.2108, <6> 37.1417, <7> 39.5358, <8> 7.0105, <9> 36.3009, <10> 16.3624, <11> 11.2495, <12> 42.9327, <13> 47.6748, <14> 16.312, <15> 34.7793, <16> 36.5621, <17> 33.4082, <18> 42.4364, <19> 6.8498, <20> 25.9477;
param capacity[MACHINE] := <1> 545.4379, <2> 545.4379, <3> 545.4379, <4> 545.4379, <5> 545.4379, <6> 545.4379, <7> 545.4379;

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