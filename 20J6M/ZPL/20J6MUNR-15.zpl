set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.5141, <2> 44.4889, <3> 39.5814, <4> 25.2318, <5> 1.5474, <6> 5.2209, <7> 11.6699, <8> 40.8289, <9> 15.6055, <10> 7.1234, <11> 30.0675, <12> 41.3203, <13> 2.3884, <14> 6.0335, <15> 5.9305, <16> 10.8641, <17> 11.8209, <18> 26.1696, <19> 44.5391, <20> 34.6011;
param workload[JOB] := <1> 43.4186, <2> 39.8242, <3> 5.9263, <4> 26.7234, <5> 35.8122, <6> 48.9121, <7> 31.601, <8> 39.7198, <9> 25.174, <10> 49.2402, <11> 7.1339, <12> 5.3769, <13> 5.1512, <14> 5.6041, <15> 24.9199, <16> 48.7307, <17> 7.8881, <18> 42.5877, <19> 1.5093, <20> 16.1324;
param capacity[MACHINE] := <1> 511.386, <2> 511.386, <3> 511.386, <4> 511.386, <5> 511.386, <6> 511.386;

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
