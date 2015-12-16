set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.6805, <2> 32.474, <3> 48.6861, <4> 19.9507, <5> 2.6253, <6> 20.642, <7> 35.5554, <8> 37.8271, <9> 4.9432, <10> 6.5578, <11> 39.2809, <12> 32.6623, <13> 14.3832, <14> 29.8596, <15> 31.372, <16> 33.4392, <17> 23.2885, <18> 8.6067, <19> 32.2373, <20> 19.1879;
param workload[JOB] := <1> 2.9463, <2> 5.6986, <3> 6.9775, <4> 4.4666, <5> 1.6203, <6> 4.5433, <7> 5.9628, <8> 6.1504, <9> 2.2233, <10> 2.5608, <11> 6.2674, <12> 5.7151, <13> 3.7925, <14> 5.4644, <15> 5.6011, <16> 5.7827, <17> 4.8258, <18> 2.9337, <19> 5.6778, <20> 4.3804;
param capacity[MACHINE] := <1> 93.5908, <2> 93.5908, <3> 93.5908, <4> 93.5908, <5> 93.5908, <6> 93.5908;

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
