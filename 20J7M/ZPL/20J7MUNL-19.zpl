set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8865, <2> 8.4256, <3> 24.025, <4> 29.1404, <5> 41.1927, <6> 34.1096, <7> 19.4989, <8> 4.7607, <9> 25.2483, <10> 10.7986, <11> 13.9259, <12> 3.6947, <13> 37.1054, <14> 6.5759, <15> 26.7234, <16> 30.5849, <17> 12.5832, <18> 49.8125, <19> 46.4124, <20> 4.2457;
param workload[JOB] := <1> 24.8865, <2> 8.4256, <3> 24.025, <4> 29.1404, <5> 41.1927, <6> 34.1096, <7> 19.4989, <8> 4.7607, <9> 25.2483, <10> 10.7986, <11> 13.9259, <12> 3.6947, <13> 37.1054, <14> 6.5759, <15> 26.7234, <16> 30.5849, <17> 12.5832, <18> 49.8125, <19> 46.4124, <20> 4.2457;
param capacity[MACHINE] := <1> 453.7503, <2> 453.7503, <3> 453.7503, <4> 453.7503, <5> 453.7503, <6> 453.7503, <7> 453.7503;

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
