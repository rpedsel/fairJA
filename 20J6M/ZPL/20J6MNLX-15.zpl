set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2752, <2> 31.0986, <3> 26.4121, <4> 23.7821, <5> 20.8916, <6> 27.8311, <7> 23.7237, <8> 27.8465, <9> 28.6764, <10> 24.9859, <11> 26.7299, <12> 22.4267, <13> 22.2326, <14> 30.0705, <15> 24.2289, <16> 31.4807, <17> 18.6186, <18> 24.6627, <19> 24.3696, <20> 22.9583;
param workload[JOB] := <1> 5.1259, <2> 5.5766, <3> 5.1393, <4> 4.8767, <5> 4.5707, <6> 5.2755, <7> 4.8707, <8> 5.277, <9> 5.355, <10> 4.9986, <11> 5.1701, <12> 4.7357, <13> 4.7151, <14> 5.4837, <15> 4.9223, <16> 5.6108, <17> 4.3149, <18> 4.9662, <19> 4.9366, <20> 4.7915;
param capacity[MACHINE] := <1> 16.7855, <2> 16.7855, <3> 16.7855, <4> 16.7855, <5> 16.7855, <6> 16.7855;

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
