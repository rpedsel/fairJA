set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.378, <2> 10.034, <3> 34.3164, <4> 40.351, <5> 44.2988, <6> 39.5591, <7> 8.0225, <8> 22.0753, <9> 22.1422, <10> 31.1429, <11> 27.6672, <12> 7.6646, <13> 5.9159, <14> 1.8037, <15> 8.5814, <16> 47.0914, <17> 16.2276, <18> 28.1355, <19> 1.1241, <20> 21.7416;
param workload[JOB] := <1> 1323.3589, <2> 100.6812, <3> 1177.6153, <4> 1628.2032, <5> 1962.3837, <6> 1564.9224, <7> 64.3605, <8> 487.3189, <9> 490.277, <10> 969.8802, <11> 765.474, <12> 58.7461, <13> 34.9979, <14> 3.2533, <15> 73.6404, <16> 2217.6, <17> 263.335, <18> 791.6064, <19> 1.2636, <20> 472.6972;
param capacity[MACHINE] := <1> 2317.1415, <2> 2317.1415, <3> 2317.1415, <4> 2317.1415, <5> 2317.1415, <6> 2317.1415, <7> 2317.1415;

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
