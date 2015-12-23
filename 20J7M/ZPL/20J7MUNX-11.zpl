set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.6555, <2> 2.6853, <3> 1.9947, <4> 49.1949, <5> 36.3071, <6> 20.8732, <7> 35.4437, <8> 18.4936, <9> 31.6931, <10> 7.5965, <11> 8.3289, <12> 41.6864, <13> 30.5226, <14> 5.9009, <15> 27.49, <16> 6.9379, <17> 16.98, <18> 48.564, <19> 41.7498, <20> 35.922;
param workload[JOB] := <1> 6.2973, <2> 1.6387, <3> 1.4123, <4> 7.0139, <5> 6.0255, <6> 4.5687, <7> 5.9535, <8> 4.3004, <9> 5.6297, <10> 2.7562, <11> 2.886, <12> 6.4565, <13> 5.5247, <14> 2.4292, <15> 5.2431, <16> 2.634, <17> 4.1207, <18> 6.9688, <19> 6.4614, <20> 5.9935;
param capacity[MACHINE] := <1> 94.3141, <2> 94.3141, <3> 94.3141, <4> 94.3141, <5> 94.3141, <6> 94.3141, <7> 94.3141;

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
