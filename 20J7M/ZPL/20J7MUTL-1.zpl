set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.6223, <2> 18.8311, <3> 14.9156, <4> 18.7491, <5> 22.3371, <6> 23.7689, <7> 38.686, <8> 18.5148, <9> 20.888, <10> 6.5605, <11> 19.8578, <12> 10.4045, <13> 24.8542, <14> 31.4607, <15> 18.51, <16> 21.1869, <17> 1.0762, <18> 25.6906, <19> 0.399, <20> 18.7148;
param workload[JOB] := <1> 3.6223, <2> 18.8311, <3> 14.9156, <4> 18.7491, <5> 22.3371, <6> 23.7689, <7> 38.686, <8> 18.5148, <9> 20.888, <10> 6.5605, <11> 19.8578, <12> 10.4045, <13> 24.8542, <14> 31.4607, <15> 18.51, <16> 21.1869, <17> 1.0762, <18> 25.6906, <19> 0.399, <20> 18.7148;
param capacity[MACHINE] := <1> 51.4907, <2> 51.4907, <3> 51.4907, <4> 51.4907, <5> 51.4907, <6> 51.4907, <7> 51.4907;

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
