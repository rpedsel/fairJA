set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5696, <2> 16.444, <3> 43.0213, <4> 2.4381, <5> 2.028, <6> 19.0912, <7> 24.1897, <8> 46.7897, <9> 36.1201, <10> 24.7276, <11> 41.3949, <12> 14.0837, <13> 4.7638, <14> 15.8422, <15> 41.1158, <16> 20.5887, <17> 18.9074, <18> 4.8179, <19> 37.7883, <20> 11.4893;
param workload[JOB] := <1> 344.83, <2> 270.4051, <3> 1850.8323, <4> 5.9443, <5> 4.1128, <6> 364.4739, <7> 585.1416, <8> 2189.276, <9> 1304.6616, <10> 611.4542, <11> 1713.5377, <12> 198.3506, <13> 22.6938, <14> 250.9753, <15> 1690.509, <16> 423.8946, <17> 357.4898, <18> 23.2122, <19> 1427.9556, <20> 132.004;
param capacity[MACHINE] := <1> 2295.2924, <2> 2295.2924, <3> 2295.2924, <4> 2295.2924, <5> 2295.2924, <6> 2295.2924;

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
