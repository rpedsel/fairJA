set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.451, <2> 16.6186, <3> 9.1534, <4> 28.0759, <5> 41.0004, <6> 17.7152, <7> 19.0148, <8> 19.0536, <9> 4.2649, <10> 23.2695, <11> 45.5647, <12> 7.9255, <13> 12.6906, <14> 8.1407, <15> 20.2319, <16> 42.7795, <17> 37.5273, <18> 43.1735, <19> 43.0195, <20> 10.4401;
param workload[JOB] := <1> 36.3568, <2> 15.5072, <3> 20.4642, <4> 39.4129, <5> 5.9175, <6> 5.4079, <7> 28.2236, <8> 19.264, <9> 34.6152, <10> 1.4815, <11> 2.7424, <12> 43.6345, <13> 4.4582, <14> 19.4212, <15> 18.2787, <16> 9.7744, <17> 0.7498, <18> 43.3927, <19> 15.0864, <20> 49.1255;
param capacity[MACHINE] := <1> 68.8858, <2> 68.8858, <3> 68.8858, <4> 68.8858, <5> 68.8858, <6> 68.8858;

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
