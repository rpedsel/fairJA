set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.4983, <2> 26.7806, <3> 29.553, <4> 15.6528, <5> 27.7159, <6> 22.7832, <7> 24.9681, <8> 26.8469, <9> 20.7012, <10> 27.0348, <11> 35.208, <12> 30.7588, <13> 39.0122, <14> 16.4291, <15> 24.4044, <16> 28.6318, <17> 28.9071, <18> 24.9184, <19> 30.2424, <20> 25.9223;
param workload[JOB] := <1> 306.1905, <2> 717.2005, <3> 873.3798, <4> 245.0101, <5> 768.1711, <6> 519.0742, <7> 623.406, <8> 720.756, <9> 428.5397, <10> 730.8804, <11> 1239.6033, <12> 946.1038, <13> 1521.9517, <14> 269.9153, <15> 595.5747, <16> 819.78, <17> 835.6204, <18> 620.9267, <19> 914.6028, <20> 671.9656;
param capacity[MACHINE] := <1> 2052.6647, <2> 2052.6647, <3> 2052.6647, <4> 2052.6647, <5> 2052.6647, <6> 2052.6647, <7> 2052.6647;

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
