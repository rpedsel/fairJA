set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.6819, <2> 2.2002, <3> 5.8792, <4> 21.8149, <5> 20.8265, <6> 16.5726, <7> 1.3334, <8> 41.831, <9> 0.0851, <10> 22.7766, <11> 17.5613, <12> 45.6651, <13> 20.4101, <14> 44.9754, <15> 26.4452, <16> 40.4409, <17> 35.9792, <18> 1.1705, <19> 4.4921, <20> 7.9357;
param workload[JOB] := <1> 7.618, <2> 35.5333, <3> 3.434, <4> 22.6191, <5> 33.0205, <6> 17.7876, <7> 31.7773, <8> 5.8865, <9> 5.5213, <10> 0.4778, <11> 39.8549, <12> 42.0344, <13> 43.2368, <14> 47.4016, <15> 25.9588, <16> 15.297, <17> 5.4717, <18> 47.554, <19> 2.0838, <20> 0.1803;
param capacity[MACHINE] := <1> 432.7487, <2> 432.7487, <3> 432.7487, <4> 432.7487, <5> 432.7487, <6> 432.7487, <7> 432.7487;

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
